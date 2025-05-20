package vn.banhmi.gobread.service;

import com.github.javafaker.Faker;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.Order;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.repository.OrderRepository;
import vn.banhmi.gobread.repository.UserRepository;

@Service
public class DataSeeder {

    private final OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    private final Faker faker = new Faker();

    DataSeeder(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @PostConstruct
    public void seedData() {
        // Kiểm tra xem đã có dữ liệu chưa để tránh sinh trùng
        if (userRepository.count() == 0) {
            for (int i = 0; i < 100; i++) {
                User user = new User();
                user.setFullName(faker.name().fullName());
                user.setEmail(faker.internet().emailAddress());
                user.setAddress(faker.address().fullAddress());
                try {
                    String phoneNumberStr = faker.phoneNumber().phoneNumber().replaceAll("[^\\d]", "");
                    long phoneNumber = Long.parseLong(phoneNumberStr);
                    user.setPhoneNumber(phoneNumber);
                } catch (NumberFormatException e) {
                    System.err.println("⚠️ Unable to parse phone number: " + e.getMessage());
                }
                user.setUsername(null);
                user.setPassword(faker.internet().password());

                userRepository.save(user);
            }
            System.out.println("✅ Đã sinh 100 user mẫu.");
        }

    }
}
