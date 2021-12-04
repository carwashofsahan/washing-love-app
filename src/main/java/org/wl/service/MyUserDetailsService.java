package org.wl.service;

import org.wl.dto.User;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@SuppressWarnings({"UnusedAssignment", "SpringJavaAutowiredFieldsWarningInspection"})
@Service
public class MyUserDetailsService implements UserDetailsService {
    @Autowired
    private UserService userService;

    @SneakyThrows
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User userDto = null;
        userDto = userService.searchUserByEmail(s);

        if (!(userDto == null)) {
            return new org.springframework.security.core.userdetails.User(userDto.getEmail(), userDto.getPassword(), new ArrayList<>());
        } else {
            return new org.springframework.security.core.userdetails.User("foo", "foo", new ArrayList<>());
        }
    }
}
