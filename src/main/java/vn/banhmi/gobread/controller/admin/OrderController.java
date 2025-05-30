package vn.banhmi.gobread.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.banhmi.gobread.domain.Order;

import vn.banhmi.gobread.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> orders = this.orderService.getAllOrders();
        model.addAttribute("users1", orders);
        return "order/QLDONHANG";
    }

    @RequestMapping("/admin/order/add")
    public String getAddOrderPage(Model model) {
        model.addAttribute("order", new Order());
        return "order/addOrder";
    }
}
