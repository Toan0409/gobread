package vn.banhmi.gobread.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.banhmi.gobread.domain.Product;
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

    // Constructor injection nếu cần
    public ProductService(ProductRepository productRepository,
    CartDetailRepository cartDetailRepository,
    CartRepository cartRepository) {
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
    public List<Product> fetchProducts(){
        return this.productRepository.findAll();
    }

    

}
