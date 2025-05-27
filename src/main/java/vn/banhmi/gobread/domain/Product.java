package vn.banhmi.gobread.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long productID;

    @NotBlank(message = "Tên sản phẩm không được để trống")
    @Size(max = 100, message = "Tên sản phẩm tối đa 100 ký tự")
    private String name;

    @NotBlank(message = "Mô tả không được để trống")
    @Size(max = 500, message = "Mô tả tối đa 500 ký tự")
    @Column(columnDefinition = "MediumText")
    private String description;

    @Positive(message = "Giá sản phẩm phải lớn hơn 0")
    private double price;

    @NotBlank(message = "URL hình ảnh không được để trống")
    @Size(max = 255, message = "URL hình ảnh tối đa 255 ký tự")
    private String imageUrl;

    @Min(value = 0, message = "Số lượng không được âm")
    private long quantity;

    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Product [productID=" + productID + ", name=" + name + ", description=" + description + ", price="
                + price + ", imageUrl=" + imageUrl + ", quantity=" + quantity + "]";
    }
}
