package com.shipmap.modules.system.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shipmap.modules.system.model.Authority;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuthorityMapper extends BaseMapper<Authority> {

    List<Authority> listByUserId(String userId);

    List<String> listByRoleId(String roleId);
}
