package vn.banhmi.gobread.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.service.ProductService;

@Controller
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping("/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("users1", products);
        return "product/QLSANPHAMTK";
    }

    @RequestMapping("/product/add")
    public String getAddProductPage(Model model) {
        model.addAttribute("order", new Product());
        return "product/addProduct";
    }
}
