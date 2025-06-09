package vn.banhmi.gobread.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.dto.BestSellingProductDTO;

@Service
public interface OrderDetailService {
    List<BestSellingProductDTO> getTopBestSellingProducts(int topN);

    List<vn.banhmi.gobread.domain.dto.ProductRevenueDTO> getRevenueByProduct();

    void processOrder(vn.banhmi.gobread.domain.Order order);
}
