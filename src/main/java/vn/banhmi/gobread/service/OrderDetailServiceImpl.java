package vn.banhmi.gobread.service;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import vn.banhmi.gobread.domain.Order;
import vn.banhmi.gobread.domain.OrderDetail;
import vn.banhmi.gobread.domain.Product;
import vn.banhmi.gobread.domain.dto.BestSellingProductDTO;
import vn.banhmi.gobread.repository.OrderDetailRepository;
import vn.banhmi.gobread.repository.OrderRepository;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

    private final OrderRepository orderRepository;

    private final ProductService productService;
    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailServiceImpl(OrderDetailRepository orderDetailRepository, ProductService productService,
            OrderRepository orderRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.productService = productService;
        this.orderRepository = orderRepository;
    }

    @Override
    public List<BestSellingProductDTO> getTopBestSellingProducts(int topN) {
        Pageable pageable = PageRequest.of(0, topN);
        return orderDetailRepository.findBestSellingProducts(pageable);
    }

    @Override
    public List<vn.banhmi.gobread.domain.dto.ProductRevenueDTO> getRevenueByProduct() {
        return orderDetailRepository.getRevenueByProduct();
    }

    @Transactional
    public void processOrder(Order order) {
        List<OrderDetail> details = order.getOrderDetails();

        for (OrderDetail detail : details) {
            Product product = detail.getProduct();
            long quantityOrdered = detail.getQuantity();

            // Cập nhật số lượng tồn kho
            product.setQuantity(product.getQuantity() - quantityOrdered);
            productService.createProduct(product); // cập nhật lại DB
        }

        orderRepository.save(order); // lưu đơn hàng sau khi đã cập nhật sản phẩm
    }

}
