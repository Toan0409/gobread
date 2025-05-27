package vn.banhmi.gobread.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {

    @GetMapping("/user")
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
}
