package com.shipmap.modules.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.shipmap.modules.system.model.User;

public interface UserService extends IService<User> {

    User getByUsername(String username);

}
