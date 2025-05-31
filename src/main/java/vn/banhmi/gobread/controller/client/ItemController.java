package vn.banhmi.gobread.controller.client;

import java.nio.file.Path;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

public class ItemController {
    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(PathVariable id) {
        
        return "redirect:/"; 
    }
}
