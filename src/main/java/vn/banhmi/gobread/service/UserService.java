package vn.banhmi.gobread.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;

import org.springframework.stereotype.Service;

import vn.banhmi.gobread.domain.Order;
import vn.banhmi.gobread.domain.Role;
import vn.banhmi.gobread.domain.User;
import vn.banhmi.gobread.domain.dto.RegisterDTO;
import vn.banhmi.gobread.repository.OrderRepository;
import vn.banhmi.gobread.repository.ProductRepository;
import vn.banhmi.gobread.repository.RoleRepository;
import vn.banhmi.gobread.repository.UserRepository;

@Service
public class UserService {

    private final RoleRepository roleRepository;

    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository,
            ProductRepository productRepository, OrderRepository orderRepository) {
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User user1 = this.userRepository.save(user);

        return user1;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public org.springframework.data.domain.Page<User> getPaginatedUsers(int page, int size) {
        return userRepository.findAll(PageRequest.of(page, size));
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public Role getRoleByName(String roleName) {
        return roleRepository.findByName(roleName);

    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setFullName(registerDTO.getFullName());
        user.setPhoneNumber(registerDTO.getPhoneNumber());
        user.setAddress(registerDTO.getAddress());
        user.setUsername(registerDTO.getUsername());
        user.setTerms(registerDTO.isTerms());
        return user;
    }

    public boolean isEmailExists(String email) {
        return userRepository.existsByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countOrders() {

        return this.orderRepository.count();
    }

    public long countProducts() {

        return this.productRepository.count();
    }

    public double calculateTotalRevenue() {
        List<Order> orders = orderRepository.findAll();
        return orders.stream()
                .mapToDouble(Order::getTotalPrice)
                .sum();
    }
}
