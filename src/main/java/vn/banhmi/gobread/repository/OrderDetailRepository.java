package vn.banhmi.gobread.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.banhmi.gobread.domain.OrderDetail;
import vn.banhmi.gobread.domain.dto.BestSellingProductDTO;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    @Query("SELECT new vn.banhmi.gobread.domain.dto.BestSellingProductDTO(od.product.name, SUM(od.quantity)) " +
            "FROM OrderDetail od " +
            "WHERE od.order.status IN ('PENDING', 'COMPLETED', 'SHIPPING') " +
            "GROUP BY od.product.name " +
            "ORDER BY SUM(od.quantity) DESC")
    List<BestSellingProductDTO> findBestSellingProducts(Pageable pageable);

}
