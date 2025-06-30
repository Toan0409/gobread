package vn.banhmi.gobread.controller.client;

import java.io.UnsupportedEncodingException;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.banhmi.gobread.domain.Cart;
import vn.banhmi.gobread.domain.CartDetail;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.service.ProductService;
import vn.banhmi.gobread.service.VNPayService;

@Controller
public class ItemController {

    private final ProductService productService;
    private final VNPayService vnpayService;

    public ItemController(ProductService productService, VNPayService vnpayService) {
        this.vnpayService = vnpayService;
        this.productService = productService;
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User currentUser = new User();
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchbyUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new java.util.ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0.0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getProduct().getPrice() * cartDetail.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/cart";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartProduct(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long cartDetailID = id;
        this.productService.handleDeleteCartProduct(cartDetailID, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User currentUser = new User();
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchbyUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new java.util.ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0.0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getProduct().getPrice() * cartDetail.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new java.util.ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/start-vnpay-payment")
    public String startVnpayPayment(HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("totalPrice") double totalPrice) {
        HttpSession session = request.getSession();
        session.setAttribute("receiverName", receiverName);
        session.setAttribute("receiverPhone", receiverPhone);
        session.setAttribute("receiverAddress", receiverAddress);

        return "redirect:/payment/vnpay-checkout?totalPrice=" + totalPrice;
    }

    @GetMapping("/payment/vnpay-checkout")
    public String vnpayCheckout(HttpServletRequest request, @RequestParam("totalPrice") double totalPrice) {
        HttpSession session = request.getSession();
        User currentUser = new User();
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        String paymentUrl = "redirect:/checkout-failed"; // mặc định nếu lỗi

        try {
            // Gọi sang VNPAY
            paymentUrl = vnpayService.createURLPayment(totalPrice, request);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            // Có thể log thêm hoặc thông báo lỗi ở đây
        }

        return "redirect:" + paymentUrl;
    }

    // @PostMapping("/place-order")
    // public String placeOrder(HttpServletRequest request,
    // @RequestParam("receiverName") String receiverName,
    // @RequestParam("receiverPhone") String receiverPhone,
    // @RequestParam("receiverAddress") String receiverAddress) {
    // HttpSession session = request.getSession();
    // User currentUser = new User();
    // long id = (long) session.getAttribute("id");
    // currentUser.setId(id);

    // this.productService.handlePlaceOrder(currentUser, session, receiverName,
    // receiverAddress, receiverPhone);
    // return "redirect:/order-success";
    // }

    @GetMapping("/vnpay-return")
    public String vnpayReturn(HttpServletRequest request) {
        Map<String, String> vnpParams = vnpayService.getVnpayResponseParams(request);

        String responseCode = vnpParams.get("vnp_ResponseCode");
        System.out.println(">>>>>>>>>>Mã phản hồi từ VNPAY: " + responseCode);

        if (responseCode.equals("00")) {
            HttpSession session = request.getSession();
            long userId = (long) session.getAttribute("id");

            User user = new User();
            user.setId(userId);

            String receiverName = (String) session.getAttribute("receiverName");
            String receiverPhone = (String) session.getAttribute("receiverPhone");
            String receiverAddress = (String) session.getAttribute("receiverAddress");

            this.productService.handlePlaceOrder(user, session, receiverName, receiverAddress, receiverPhone);

            return "redirect:/order-success";
        }

        return "redirect:/checkout-failed";

    }

    @GetMapping("/checkout-failed")
    public String getCheckoutFailedPage() {
        return "client/cart/checkout-failed";
    }

    @GetMapping("/order-success")
    public String getOrderSuccessPage() {
        return "client/cart/thanks";
    }

}
