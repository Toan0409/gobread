package vn.banhmi.gobread.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.banhmi.gobread.domain.Role;
import vn.banhmi.gobread.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hoidanit);

    List<User> findOneByEmail(String email);

    User findById(long id);

    void deleteById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);

    long count();

    @Query("SELECT p from User p where p.fullName like %?1%")
    Page<User> findByFullNameContainingIgnoreCase(String keyword, org.springframework.data.domain.Pageable pageable);
}
