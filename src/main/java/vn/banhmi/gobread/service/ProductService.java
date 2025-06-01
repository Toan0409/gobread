package vn.banhmi.gobread.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.Cart;
import vn.banhmi.gobread.domain.CartDetail;
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

    public void handleAddProductToCart(String email, long productId) {
        // Kiểm tra xem sản phẩm có tồn tại không
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // Nếu không có giỏ hàng, tạo mới
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(1);
                cart = this.cartRepository.save(otherCart);
            }

            // Tìm sản phẩm theo ID
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();

                // Tạo CartDetail mới
                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                cartDetail.setProduct(product);
                cartDetail.setQuantity(1); // Giả sử số lượng là 1
                cartDetail.setPrice(product.getPrice()); // Lấy giá từ sản phẩm

                // Lưu CartDetail
                this.cartDetailRepository.save(cartDetail);

                // Cập nhật tổng số lượng trong giỏ hàng
                cart.setSum(cart.getSum());
                this.cartRepository.save(cart);
            } else {
                throw new RuntimeException("Product not found with ID: " + productId);
            }

        }
    }

}
