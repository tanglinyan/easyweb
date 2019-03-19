package com.shipmap.modules.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shipmap.modules.system.dao.RoleMapper;
import com.shipmap.modules.system.model.Role;
import com.shipmap.modules.system.service.RoleService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    /**
     * 根据角色id批量查询角色信息
     **/
    @Override
    public List<Role> listByRoleIds(String... roleIds) {
        return this.baseMapper.listByRoleIds(roleIds);
    }
}
