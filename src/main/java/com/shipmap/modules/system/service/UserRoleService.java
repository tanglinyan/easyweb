package com.shipmap.modules.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.shipmap.modules.system.model.UserRole;

/**
 * Created by Administrator on 2018-12-19 下午 4:09.
 */
public interface UserRoleService extends IService<UserRole> {

    String[] getRoleIds(String userId);
}
