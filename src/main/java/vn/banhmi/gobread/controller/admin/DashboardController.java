package vn.banhmi.gobread.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.banhmi.gobread.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/admin")
    public String getHomePage(Model model) {
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countRevenues", this.userService.calculateTotalRevenue());
        model.addAttribute("countOrders", this.userService.countOrders());
        return "admin/index";
    }
}
