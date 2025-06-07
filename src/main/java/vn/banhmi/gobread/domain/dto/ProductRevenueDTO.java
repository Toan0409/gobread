package vn.banhmi.gobread.domain.dto;

public class ProductRevenueDTO {
    private String productName;
    private Double totalRevenue;

    public ProductRevenueDTO(String productName, Double totalRevenue) {
        this.productName = productName;
        this.totalRevenue = totalRevenue;
    }

    public String getProductName() {
        return productName;
    }

    public Double getTotalRevenue() {
        return totalRevenue;
    }
}
