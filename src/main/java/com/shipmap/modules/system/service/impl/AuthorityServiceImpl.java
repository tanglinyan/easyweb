package com.shipmap.modules.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shipmap.modules.system.dao.AuthorityMapper;
import com.shipmap.modules.system.model.Authority;
import com.shipmap.modules.system.service.AuthorityService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorityServiceImpl extends ServiceImpl<AuthorityMapper, Authority> implements AuthorityService {
    @Override
    public List<Authority> listByUserId(String userId) {
        return baseMapper.listByUserId(userId);
    }

    @Override
    public List<String> listByRoleId(String roleId) {
        return baseMapper.listByRoleId(roleId);
    }
}
