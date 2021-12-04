package org.wl.service;

import org.wl.Enum.UserState;
import org.wl.dto.User;

import java.util.List;

public interface UserService {
    User searchUserByEmail(String email) throws Exception;

    boolean addUser(User user) throws Exception;

    User findUserById(String userid) throws Exception;

    User findUserByEmail(String email) throws Exception;

    Boolean update(User userdto) throws Exception;

    Boolean updateState(User userdto) throws Exception;

    List<User> findByState(UserState state)throws Exception;
    List<User> getAll()throws Exception;
}
