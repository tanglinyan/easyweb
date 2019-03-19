package com.shipmap.modules.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.shipmap.modules.system.model.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleService extends IService<Role> {
    /**
     * 根据角色id批量查询角色信息
     **/
    public List<Role> listByRoleIds(String[] roleIds);
}
