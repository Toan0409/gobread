package vn.banhmi.gobread.service;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.dto.BestSellingProductDTO;
import vn.banhmi.gobread.repository.OrderDetailRepository;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailServiceImpl(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }

    @Override
    public List<BestSellingProductDTO> getTopBestSellingProducts(int topN) {
        Pageable pageable = PageRequest.of(0, topN);
        return orderDetailRepository.findBestSellingProducts(pageable);
    }
}
