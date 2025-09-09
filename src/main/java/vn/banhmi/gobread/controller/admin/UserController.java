package vn.banhmi.gobread.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.method.P;
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

import jakarta.validation.Valid;
import vn.banhmi.gobread.domain.Role;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.repository.RoleRepository;
import vn.banhmi.gobread.service.UploadService;
import vn.banhmi.gobread.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final UploadService uploadService;

    public UserController(UserService userService, RoleRepository roleRepository,
            UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.uploadService = uploadService;
        this.userService = userService;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    // @RequestMapping("/login")
    // public String getLoginPage(Model model) {

    // return "pages-login";
    // }

    @RequestMapping("/admin/profile")
    public String getAdminPage(Model model) {
        return "users-profile";
    }

    @RequestMapping("/admin/contact")
    public String getContactPage(Model model) {
        return "pages-contact";
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "keyword", required = false) String keyword) {

        if (page < 1)
            page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<User> userPage;

        if (keyword != null && !keyword.trim().isEmpty()) {
            userPage = userService.searchUsersByName(keyword.trim(), pageable);
            model.addAttribute("keyword", keyword);
        } else {
            userPage = userService.getPaginatedUsers(pageable);
        }

        model.addAttribute("users1", userPage.getContent());
        model.addAttribute("currentPage", page); // Spring page start = 0
        model.addAttribute("totalPages", userPage.getTotalPages());

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
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("image") MultipartFile imageFile) {
        User currentUser = this.userService.getUserById(user.getId());
        if (!imageFile.isEmpty()) {
            String avatarUrl = uploadService.handleSaveUploadFile(imageFile, "avatar");
            currentUser.setAvatar(avatarUrl);
        }
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
        model.addAttribute("newUser", new User());
        model.addAttribute("roles", roleRepository.findAll());
        return "admin/user/pages-register";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User user,
            BindingResult bindingResult,
            @RequestParam("image") MultipartFile imageFile) {

        // Log lỗi nếu có
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
        }

        // Lấy roleId từ user
        Long roleId = user.getRole() != null ? user.getRole().getId() : null;

        if (roleId == null) {
            model.addAttribute("error", "Vui lòng chọn vai trò!");
            model.addAttribute("roles", roleRepository.findAll());
            return "admin/user/pages-register";
        }

        Optional<Role> role = roleRepository.findById(roleId);
        if (role.isEmpty()) {
            model.addAttribute("error", "Vai trò không hợp lệ!");
            model.addAttribute("roles", roleRepository.findAll());
            return "admin/user/pages-register";
        }

        user.setRole(role.get());

        String avatarUrl = uploadService.handleSaveUploadFile(imageFile, "avatar");
        if (avatarUrl == null) {
            return "error";
        }

        user.setAvatar(avatarUrl);

        // Mã hóa mật khẩu
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

}
