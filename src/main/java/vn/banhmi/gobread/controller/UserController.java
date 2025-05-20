package vn.banhmi.gobread.controller;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {

        return "admin/index";
    }

    @RequestMapping("/user")
    public String getHomeUserPage(Model model) {
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

    @RequestMapping("/user/signup")
    public String getUserSignUp(Model model) {
        return "client/auth/signup";
    }

    @RequestMapping("/user/login")
    public String getUserLogin(Model model) {
        return "client/auth/login";
    }

    @RequestMapping("/login")
    public String getLoginPage(Model model) {

        return "pages-login";
    }

    @RequestMapping("/admin")
    public String getAdminPage(Model model) {
        return "users-profile";
    }

    @RequestMapping("/contact")
    public String getContactPage(Model model) {
        return "pages-contact";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/QLKHACHHANG";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(@PathVariable long id, Model model) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/update/{id}") // get
    public String getUpdateUserPage(@PathVariable long id, Model model) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update") // post
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setFullName(user.getFullName());
            currentUser.setUsername(user.getUsername());
            currentUser.setPhoneNumber(user.getPhoneNumber());
            currentUser.setAddress(user.getAddress());
            this.userService.handleSaveUser(currentUser);

        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getdeleteUserPage(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        return "admin/user/deleteUser";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/create")
    public String getRegisterPage(Model model) {

        return "admin/user/pages-register";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User user) {
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

}
