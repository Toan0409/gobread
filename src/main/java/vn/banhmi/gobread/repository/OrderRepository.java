package vn.banhmi.gobread.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.banhmi.gobread.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order save(Order order);

}
