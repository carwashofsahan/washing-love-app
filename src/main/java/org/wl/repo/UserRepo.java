package org.wl.repo;


import org.wl.Enum.UserState;
import org.wl.entity.Role;
import org.wl.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

@SuppressWarnings("unused")
public interface UserRepo extends JpaRepository<User, String> {
    User findUserByEmailAndPasswordAndState(String Email, String Password, UserState state);

    User findUserByEmail(String email);

    User findByRole(Role role);

    User findUserById(String id);

    User findUserByFirstname(String name);

    List<User> findAllByState(UserState state);

}
