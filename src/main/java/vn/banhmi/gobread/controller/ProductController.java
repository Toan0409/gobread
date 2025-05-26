package vn.banhmi.gobread.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import vn.banhmi.gobread.domain.Product;

import vn.banhmi.gobread.repository.ProductRepository;
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

    @RequestMapping("/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "product/QLSANPHAMTK";
    }

    @GetMapping("/product/add")
    public String getAddProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "product/addProduct";
    }

    @PostMapping("/product/add")
    public String addProduct(
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult result,
            @RequestParam("image") MultipartFile imageFile, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors());
            return "product/addProduct";
        }
        try {
            // Gọi service để lưu ảnh và nhận tên file trả về
            String filename = uploadService.handleSaveUploadFile(imageFile, "product");
            if (filename == null) {
                return "error"; // Trả về trang lỗi nếu lưu thất bại
            }

            // Gán tên file ảnh cho product
            product.setImageUrl(filename);

            // Lưu product vào database
            productService.createProduct(product);

            return "redirect:/product"; // Chuyển hướng nếu thành công
        } catch (Exception e) {
            e.printStackTrace();
            return "product/addProduct"; // Quay lại trang thêm sản phẩm nếu có lỗi
        }
    }

    @RequestMapping("/product/{productID}")
    public String getProductDetailPage(@PathVariable long productID, Model model) {
        Optional<Product> product = this.productService.getProductById(productID);
        model.addAttribute("product", product.get());
        return "product/detailProduct";
    }

    @GetMapping("/product/update/{productID}")
    public String getUpdateProductPage(@PathVariable long productID, Model model) {
        Optional<Product> product = this.productService.getProductById(productID);
        model.addAttribute("product", product.get());
        return "product/updateProduct";
    }

    @PostMapping("/product/update")
    public String postUpdateProduct(@ModelAttribute("product") @Valid Product product,
            BindingResult bindingResult,
            @RequestParam("image") MultipartFile imageFile) {

        if (bindingResult.hasErrors()) {
            return "product/updateProduct"; // Quay lại form nếu có lỗi
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

            return "redirect:/product"; // Thành công, về trang danh sách
        }

        // Nếu không tìm thấy sản phẩm
        throw new RuntimeException("Không tìm thấy sản phẩm với ID: " + product.getProductID());
    }

    @GetMapping("/product/delete/{productID}")
    public String deleteProduct(@PathVariable long productID, Model model) {
        model.addAttribute("productID", productID);
        Product product = new Product();
        product.setProductID(productID);
        model.addAttribute("newProduct", product);
        return "product/deleteProduct";
    }

    @PostMapping("/product/delete")
    public String postDeleteProduct(@ModelAttribute("newProduct") Product product) {
        this.productService.deleteProductById(product.getProductID());
        return "redirect:/product"; // Chuyển hướng về trang danh sách sản phẩm
    }

}
