package vn.banhmi.gobread.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
        model.addAttribute("orders", orders);
        return "order/QLDONHANG";
    }

    @GetMapping("/admin/order/{orderId}")
    public String getOrderDetailPage(Model model, @PathVariable long orderId) {
        Order order = this.orderService.getOrderById(orderId).get();
        model.addAttribute("order", order);
        model.addAttribute("orderID", orderId);
        model.addAttribute("orderDetails", order.getOrderDetails());
        return "order/detailOrder";
    }

    @RequestMapping("/admin/order/update/{orderId}")
    public String getUpdateOrderStatusPage(Model model, @PathVariable long orderId) {
        Optional<Order> currentOrder = this.orderService.getOrderById(orderId);
        model.addAttribute("newOrder", currentOrder.get());
        return "order/updateOrder";
    }

    @PostMapping("/admin/order/update")
    public String hanldeUpdateOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.updateOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{orderId}")
    public String getDeleteOrderPage(Model model, @PathVariable long orderId) {
        model.addAttribute("id", orderId);
        model.addAttribute("newOrder", new Order());
        return "order/deleteOrder";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.deleteOrderById(order.getOrderId());
        return "redirect:/admin/order";
    }

}
