package com.hotel.account.service;

import com.hotel.account.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
