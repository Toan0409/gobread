package vn.banhmi.gobread.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.repository.ProductRepository;
import vn.banhmi.gobread.service.ProductService;

@Controller
public class ProductController {

    private final ProductRepository productRepository;
    private final ProductService productService;
    private final ServletContext servletContext;

    public ProductController(ProductService productService, ServletContext servletContext,
            ProductRepository productRepository) {
        this.servletContext = servletContext;
        this.productService = productService;
        this.productRepository = productRepository;
    }

    @RequestMapping("/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        System.out.println(products);
        model.addAttribute("products", products);
        return "product/QLSANPHAMTK";
    }

    @GetMapping("/product/add")
    public String getAddProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "product/addProduct";
    }

    @PostMapping("/product/add")
    public String addProduct(@ModelAttribute("newProduct") Product product,
            @RequestParam("image") MultipartFile imageFile) {
        try {
            byte[] bytes = imageFile.getBytes();

            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + "product");
            if (!dir.exists())
                dir.mkdirs();

            // Tạo tên file duy nhất
            String filename = System.currentTimeMillis() + "-" + imageFile.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);

            // Lưu file ảnh
            try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
                stream.write(bytes);
            }

            // Gán đường dẫn ảnh vào product
            product.setImageUrl("/resources/images/product/" + filename);

            // Lưu product vào database
            productRepository.save(product);

        } catch (IOException e) {
            e.printStackTrace();
            return "error"; // Trả về trang lỗi nếu có
        }

        return "redirect:/product"; // Chuyển hướng sau khi lưu thành công
    }

}
