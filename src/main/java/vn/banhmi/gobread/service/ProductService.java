package vn.banhmi.gobread.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }
}
