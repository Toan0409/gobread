package vn.banhmi.gobread.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.banhmi.gobread.domain.Product;

import vn.banhmi.gobread.service.ProductService;
import vn.banhmi.gobread.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService,
            UploadService uploadService) {

        this.productService = productService;

        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(
            Model model,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "keyword", required = false) String keyword) {

        if (page < 1)
            page = 1;

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> productPage;

        if (keyword != null && !keyword.trim().isEmpty()) {
            // Tìm kiếm có phân trang
            productPage = productService.searchProductsByName(keyword.trim(), pageable);
            model.addAttribute("keyword", keyword);
        } else {
            // Lấy toàn bộ sản phẩm có phân trang
            productPage = productService.getAllPaginationProducts(pageable);
        }

        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());

        return "admin/product/QLSANPHAMTK";
    }

    @GetMapping("/admin/product/add")
    public String getAddProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/addProduct";
    }

    @PostMapping("/admin/product/add")
    public String addProduct(
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult result,
            @RequestParam("image") MultipartFile imageFile, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors());
            return "admin/product/addProduct";
        }
        try {
            // Gọi service để lưu ảnh và nhận tên file trả về
            String filename = uploadService.handleSaveUploadFile(imageFile, "product");
            if (filename == null) {
                return "error";
            }

            // Gán tên file ảnh cho product
            product.setImageUrl(filename);

            // Lưu product vào database
            productService.createProduct(product);

            return "redirect:/admin/product"; // Chuyển hướng nếu thành công
        } catch (Exception e) {
            e.printStackTrace();
            return "admin/product/addProduct";
        }
    }

    @RequestMapping("/admin/product/{productID}")
    public String getProductDetailPage(@PathVariable long productID, Model model) {
        Optional<Product> product = this.productService.getProductById(productID);
        model.addAttribute("product", product.get());
        return "admin/product/detailProduct";
    }

    @GetMapping("/admin/product/update/{productID}")
    public String getUpdateProductPage(@PathVariable long productID, Model model) {
        Optional<Product> product = this.productService.getProductById(productID);
        model.addAttribute("product", product.get());
        return "admin/product/updateProduct";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(@ModelAttribute("product") @Valid Product product,
            BindingResult bindingResult,
            @RequestParam("image") MultipartFile imageFile) {

        if (bindingResult.hasErrors()) {
            return "admin/product/updateProduct"; // Quay lại form nếu có lỗi
        }

        // Lấy sản phẩm hiện tại từ DB
        Optional<Product> currentProduct = productService.getProductById(product.getProductID());

        if (currentProduct.isPresent()) {
            Product p = currentProduct.get();

            // Nếu người dùng chọn ảnh mới
            if (!imageFile.isEmpty()) {
                String savedImage = uploadService.handleSaveUploadFile(imageFile, "product");
                p.setImageUrl(savedImage); // Cập nhật đường dẫn ảnh
            }

            // Cập nhật các thuộc tính khác
            p.setName(product.getName());
            p.setPrice(product.getPrice());
            p.setDescription(product.getDescription());
            p.setQuantity(product.getQuantity());

            // Lưu lại vào DB
            productService.createProduct(p);

            return "redirect:/admin/product"; // Thành công, về trang danh sách
        }

        // Nếu không tìm thấy sản phẩm
        throw new RuntimeException("Không tìm thấy sản phẩm với ID: " + product.getProductID());
    }

    @GetMapping("/admin/product/delete/{productID}")
    public String deleteProduct(@PathVariable long productID, Model model) {
        model.addAttribute("productID", productID);
        Product product = new Product();
        product.setProductID(productID);
        model.addAttribute("newProduct", product);
        return "admin/product/deleteProduct";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(@ModelAttribute("newProduct") Product product) {
        this.productService.deleteProductById(product.getProductID());
        return "redirect:/admin/product"; // Chuyển hướng về trang danh sách sản phẩm
    }

}
