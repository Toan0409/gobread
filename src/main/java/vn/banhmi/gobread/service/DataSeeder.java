package vn.banhmi.gobread.service;

import com.github.javafaker.Faker;
import jakarta.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.Role;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.repository.RoleRepository;
import vn.banhmi.gobread.repository.UserRepository;

@Service
public class DataSeeder {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    private final Faker faker = new Faker();

    DataSeeder(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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
                user.setUsername(faker.name().username());
                user.setPassword(faker.internet().password());
                user.setAvatar(faker.internet().avatar());
                Role defaultRole = roleRepository.findByName("USER");
                if (defaultRole == null) {
                    defaultRole = new Role();
                    defaultRole.setName("USER");
                    roleRepository.save(defaultRole);
                }

                user.setRole(defaultRole);

                userRepository.save(user);
            }
            System.out.println("✅ Đã sinh 100 user mẫu.");
        }

    }
}
