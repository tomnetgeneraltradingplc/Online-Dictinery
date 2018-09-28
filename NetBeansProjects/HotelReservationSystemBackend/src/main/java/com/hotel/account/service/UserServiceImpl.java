package com.hotel.account.service;

import com.hotel.account.model.User;
import com.hotel.account.model.Role;
import com.hotel.account.repository.RoleRepository;
import com.hotel.account.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        
        /****** To be reviewed *****/
        List<Role> roles = new ArrayList<>();
        List<Role> dbroles = roleRepository.findAll();        		
        dbroles.sort(
        		(r1,r2)->(int)(r1.getId() - r2.getId()) 
        		);
        roles.add(dbroles.get(0));     
        /****** To be reviewed *****/
        
        
        user.setRoles(new HashSet<>(roles));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
