package vn.banhmi.gobread.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.banhmi.gobread.domain.Order;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.domain.dto.BestSellingProductDTO;
import vn.banhmi.gobread.service.OrderDetailService;
import vn.banhmi.gobread.service.OrderService;
import vn.banhmi.gobread.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;

    public DashboardController(UserService userService, OrderService orderService,
            OrderDetailService orderDetailService) {
        this.orderDetailService = orderDetailService;
        this.orderService = orderService;
        this.userService = userService;
    }

    @RequestMapping("/admin")
    public String getHomePage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> order_user = this.orderService.fetchOrdersByUser(currentUser);
        model.addAttribute("order_user", order_user);

        List<BestSellingProductDTO> bestSellers = orderDetailService.getTopBestSellingProducts(10); // Top 10
        model.addAttribute("bestSellers", bestSellers);
        System.out.println(">>>>>>>>>>>>>>>>>Best Selling Products: " + bestSellers);
        List<Order> orders = this.orderService.getAllOrders();
        model.addAttribute("orders", orders);
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countRevenues", this.userService.calculateTotalRevenue());
        model.addAttribute("countOrders", this.userService.countOrders());
        return "admin/index";
    }
}
