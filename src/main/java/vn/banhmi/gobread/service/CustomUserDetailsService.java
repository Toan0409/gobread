package vn.banhmi.gobread.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserService userService;

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // logic
        vn.banhmi.gobread.domain.User user = userService.getUserByEmail(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + username);
        }
        return new User(
                user.getEmail(), // Username (often used as email)
                user.getPassword(), // Password
                Collections.singletonList( // List of authorities (roles)
                        new SimpleGrantedAuthority("ROLE_USER") // Granting "ROLE_USER"
                ));

    }

}