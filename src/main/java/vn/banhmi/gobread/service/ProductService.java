package vn.banhmi.gobread.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import vn.banhmi.gobread.domain.Cart;
import vn.banhmi.gobread.domain.CartDetail;
import vn.banhmi.gobread.domain.OrderDetail;
import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.repository.CartDetailRepository;
import vn.banhmi.gobread.repository.CartRepository;
import vn.banhmi.gobread.repository.ProductRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    // Constructor injection nếu cần
    public ProductService(ProductRepository productRepository,
            CartDetailRepository cartDetailRepository,
            CartRepository cartRepository,
            UserService userService) {
        this.userService = userService;
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    public Optional<Product> getProductById(long id) {
        return productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        productRepository.deleteById(id);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    @Transactional
    public void handleAddProductToCart(String email, long productId) {
        // 1. Lấy user từ email
        User user = this.userService.getUserByEmail(email);
        if (user == null) {
            throw new RuntimeException("User not found with email: " + email);
        }

        // 2. Tìm Cart hiện tại của user (nếu chưa có, tạo mới và lưu ngay)
        Cart cart = this.cartRepository.findByUser(user);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
            cart.setSum(0);
            cart = this.cartRepository.save(cart);
        }

        // 3. Lấy Product theo ID
        Optional<Product> productOptional = this.productRepository.findById(productId);
        if (!productOptional.isPresent()) {
            throw new RuntimeException("Product not found with ID: " + productId);
        }
        Product product = productOptional.get();

        // 4. Kiểm tra xem sản phẩm đã có trong cart chưa
        CartDetail cartDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
        if (cartDetail == null) {
            // Nếu chưa có, tạo mới cartDetail
            cartDetail = new CartDetail();
            cartDetail.setCart(cart);
            cartDetail.setProduct(product);
            cartDetail.setQuantity(1);
            cartDetail.setPrice(product.getPrice());
        } else {
            // Nếu đã có, tăng số lượng
            cartDetail.setQuantity(cartDetail.getQuantity() + 1);
        }

        // 5. Lưu lại cartDetail (mới hoặc đã chỉnh sửa)
        this.cartDetailRepository.save(cartDetail);

        // 6. Cập nhật tổng số lượng trong giỏ hàng và lưu lại cart
        cart.setSum(cart.getSum() + 1);
        this.cartRepository.save(cart);
    }

    public Cart fetchbyUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    @Transactional
    public void handleDeleteCartProduct(long cartDetailID, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailID);

        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart currentCart = cartDetail.getCart();

            currentCart.getCartDetails().remove(cartDetail);
            cartDetail.setCart(null);

            long quantityToRemove = cartDetail.getQuantity();

            this.cartDetailRepository.delete(cartDetail);

            this.cartDetailRepository.flush();

            int updatedSum = (int) (currentCart.getSum() - quantityToRemove);

            if (updatedSum > 0) {
                currentCart.setSum(updatedSum);
                session.setAttribute("sum", updatedSum);
                this.cartRepository.save(currentCart);
            } else {
                this.cartRepository.delete(currentCart);
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);

            }
        }
    }

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone) {

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.orderDetailRepository.save(orderDetail);
                }

                // step 2: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // step 3: update session
                session.setAttribute("sum", 0);
            }

        }

    }

}
