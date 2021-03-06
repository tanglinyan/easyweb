package com.shipmap.modules.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shipmap.modules.system.dao.UserMapper;
import com.shipmap.modules.system.model.User;
import com.shipmap.modules.system.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Override
    public User getByUsername(String username) {
        return baseMapper.getByUsername(username);
    }

}
