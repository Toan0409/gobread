package vn.banhmi.gobread.controller.client;

import java.util.List;
import java.util.Optional;

import jakarta.validation.Valid;

import org.springframework.boot.actuate.autoconfigure.observation.ObservationProperties.Http;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.banhmi.gobread.domain.Order;
import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.domain.dto.RegisterDTO;
import vn.banhmi.gobread.service.ProductService;
import vn.banhmi.gobread.service.UploadService;
import vn.banhmi.gobread.service.UserService;
import vn.banhmi.gobread.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;
    private final UploadService uploadService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            OrderService orderService, UploadService uploadService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
        this.uploadService = uploadService;
    }

    @GetMapping("/")
    public String getHomeUserPage(Model model) {
        List<Product> products = productService.getAllProducts();
        long userCount = userService.countAllUsers();
        long productCount = productService.countAllProducts();
        model.addAttribute("productCount", productCount);
        model.addAttribute("userCount", userCount);
        model.addAttribute("products", products);
        return "client/home/index";
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
            Model model, @RequestParam("image") MultipartFile imageFile) {

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
        // try {
        // // Gọi service để lưu ảnh và nhận tên file trả về
        // String filename = uploadService.handleSaveUploadFile(imageFile, "user");
        // if (filename == null) {
        // return "error"; // Trả về trang lỗi nếu lưu thất bại
        // }

        // // Gán tên file ảnh cho product
        // user.setAvatar(filename);
        // }
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

    @GetMapping("/order-history")
    public String getOrderHistory(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.fetchOrdersByUser(currentUser);
        model.addAttribute("orders", orders);
        return "client/cart/order_history";
    }

    @RequestMapping("/user/product/{productID}")
    public String getProductdetailForUser(@PathVariable long productID, Model model) {
        Optional<Product> product = this.productService.getProductById(productID);
        model.addAttribute("product", product.get());
        return "product/detailProduct";
    }

}
