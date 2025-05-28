package vn.banhmi.gobread.controller.client;

import java.util.List;

import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.domain.dto.RegisterDTO;
import vn.banhmi.gobread.service.ProductService;
import vn.banhmi.gobread.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomeUserPage(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/home/index";
    }

    @RequestMapping("/user/cart")
    public String getCartPage(Model model) {
        return "client/cart/cart";
    }

    @RequestMapping("/user/cancel_order")
    public String getUserCancelOrder(Model model) {
        return "client/order/cancel_order";
    }

    @RequestMapping("/user/review")
    public String getUserReview(Model model) {
        return "client/review/review";
    }

    @GetMapping("/user/signup")
    public String getUserSignUp(Model model) {
        // You can add a RegisterDTO object to the model if needed
        model.addAttribute("registerDTO", new RegisterDTO());
        return "client/auth/signup";
    }

    @PostMapping("/user/signup")
    public String postUserSignUp(@ModelAttribute("registerDTO") RegisterDTO registerDTO, Model model) {

        vn.banhmi.gobread.domain.User user = this.userService.registerDTOtoUser(registerDTO);
        user.setRole(this.userService.getRoleByName("USER"));
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);

        userService.handleSaveUser(user);
        return "redirect:/user/login";

    }

    @RequestMapping("/user/login")
    public String getUserLogin(Model model) {
        return "client/auth/login";
    }
}
