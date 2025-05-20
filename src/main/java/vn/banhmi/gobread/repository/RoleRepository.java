package vn.banhmi.gobread.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.banhmi.gobread.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name); // Để tìm role theo tên nếu cần

    Role findById(long id); // Để tìm role theo id nếu cần
}
