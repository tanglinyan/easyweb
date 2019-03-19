package com.shipmap.modules.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.shipmap.modules.system.model.Authority;

import java.util.List;

public interface AuthorityService extends IService<Authority> {
    List<Authority> listByUserId(String userId);

    List<String> listByRoleId(String roleId);
}
