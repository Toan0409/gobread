package vn.banhmi.gobread.controller;

import java.util.List;
import java.util.Optional;

import javax.management.relation.Role;
import javax.naming.Binding;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.repository.RoleRepository;
import vn.banhmi.gobread.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, RoleRepository roleRepository,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleRepository = roleRepository;
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

    @GetMapping("/admin/user/create")
    public String getRegisterPage(Model model) {
        model.addAttribute("roles", roleRepository.findAll());
        return "admin/user/pages-register";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User user,
            BindingResult bindingResult,
            @RequestParam("roleId") Long roleId) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
        }

        Optional<vn.banhmi.gobread.domain.Role> role = roleRepository.findById(roleId); // ✅ truyền đúng Long id

        if (role.isEmpty()) {
            model.addAttribute("error", "Vai trò không hợp lệ!");
            model.addAttribute("roles", roleRepository.findAll());
            return "admin/user/pages-register";
        }

        // Gán role và mã hóa mật khẩu
        user.setRole(role.get());
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);

        userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

}
