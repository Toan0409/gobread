package vn.banhmi.gobread.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.stereotype.Repository;

import vn.banhmi.gobread.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    long count();

    Page<Product> findAll(org.springframework.data.domain.Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.name LIKE %?1%")
    Page<Product> findProduct(String keyword, Pageable pageable);
}
