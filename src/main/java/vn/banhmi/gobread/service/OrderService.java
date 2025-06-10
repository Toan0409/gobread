package vn.banhmi.gobread.service;

import java.util.List;
import java.util.Optional;

import org.hibernate.query.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.Order;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.domain.dto.BestSellingProductDTO;
import vn.banhmi.gobread.domain.OrderDetail;
import vn.banhmi.gobread.repository.OrderDetailRepository;
import vn.banhmi.gobread.repository.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public org.springframework.data.domain.Page<Order> getPaginationOrders(Pageable pageable) {
        Pageable sortedPageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(),
                Sort.by(Sort.Direction.DESC, "orderId"));

        return orderRepository.findAll(sortedPageable);
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public Optional<Order> getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        // delete order detail first
        Optional<Order> orOptional = this.getOrderById(id);
        if (orOptional.isPresent()) {
            Order order = orOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }
        // then delete order
        this.orderRepository.deleteById(id);
    }

    public List<OrderDetail> getAllOrderDetails() {
        return this.orderDetailRepository.findAll();
    }

    public Optional<OrderDetail> getOrderDetailById(long id) {
        return this.orderDetailRepository.findById(id);
    }

    public void deleteOrderDetailById(long id) {
        this.orderDetailRepository.deleteById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.getOrderById(order.getOrderId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }

    public List<BestSellingProductDTO> getTopBestSellingProducts(int topN) {
        PageRequest pageable = PageRequest.of(0, topN);
        return orderDetailRepository.findBestSellingProducts(pageable);
    }

}
