package vn.banhmi.gobread.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.banhmi.gobread.domain.CartDetail;



public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
      
}
