package vn.banhmi.gobread.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.Order;
import vn.banhmi.gobread.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }
}
