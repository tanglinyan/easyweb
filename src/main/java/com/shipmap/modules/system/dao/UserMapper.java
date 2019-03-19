package com.shipmap.modules.system.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shipmap.modules.system.model.User;

public interface UserMapper extends BaseMapper<User> {

    User getByUsername(String username);
}
