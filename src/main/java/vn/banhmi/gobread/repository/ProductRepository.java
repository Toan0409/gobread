package vn.banhmi.gobread.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.banhmi.gobread.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    long count();

    Page<Product> findAll(org.springframework.data.domain.Pageable pageable);
}
