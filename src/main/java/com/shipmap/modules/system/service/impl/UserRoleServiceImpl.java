package com.shipmap.modules.system.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shipmap.modules.system.dao.UserRoleMapper;
import com.shipmap.modules.system.model.UserRole;
import com.shipmap.modules.system.service.UserRoleService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018-12-19 下午 4:10.
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {

    @Override
    public String[] getRoleIds(String userId) {
        List<UserRole> userRoles = baseMapper.selectList(new EntityWrapper().eq("user_id", userId));
        String[] roleIds = new String[userRoles.size()];
        for (int i = 0; i < userRoles.size(); i++) {
            roleIds[i] = userRoles.get(i).getRoleId();
        }
        return roleIds;
    }
}
