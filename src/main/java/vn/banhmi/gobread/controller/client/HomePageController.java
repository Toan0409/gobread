package vn.banhmi.gobread.controller.client;

import java.util.List;

import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.domain.User; // ✅ Sửa import User đúng chỗ
import vn.banhmi.gobread.domain.dto.RegisterDTO;
import vn.banhmi.gobread.service.ProductService;
import vn.banhmi.gobread.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomeUserPage(Model model) {
        List<Product> products = productService.getAllProducts();
        long userCount = userService.countAllUsers();
        model.addAttribute("userCount", userCount);
        model.addAttribute("products", products);

        return "client/home/index";
    }

    @RequestMapping("/user/cancel_order")
    public String getUserCancelOrder(Model model) {
        return "client/order/cancel_order";
    }

    @RequestMapping("/user/review")
    public String getUserReview(Model model) {
        return "client/review/review";
    }

    @GetMapping("/signup")
    public String getUserSignUp(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        return "client/auth/signup";
    }

    @PostMapping("/signup")
    public String postUserSignUp(
            @ModelAttribute("registerDTO") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult,
            Model model) {

        if (bindingResult.hasErrors()) {
            List<FieldError> errors = bindingResult.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println(">>> " + error.getField() + ": " + error.getDefaultMessage());
            }

            model.addAttribute("registerDTO", registerDTO);
            return "client/auth/signup";
        }

        // Chuyển đổi DTO sang entity
        User user = userService.registerDTOtoUser(registerDTO);
        user.setRole(userService.getRoleByName("USER"));
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userService.handleSaveUser(user);

        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String getUserLogin(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-denied")
    public String getAccessDenied(Model model) {
        return "client/auth/404page";
    }
}
