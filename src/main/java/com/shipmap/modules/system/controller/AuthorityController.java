package com.shipmap.modules.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.shipmap.framework.*;
import com.shipmap.framework.utils.ReflectUtil;
import com.shipmap.modules.system.model.Authority;
import com.shipmap.modules.system.model.RoleAuthority;
import com.shipmap.modules.system.service.AuthorityService;
import com.shipmap.modules.system.service.RoleAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/authority")
public class AuthorityController extends BaseController {
    @Autowired
    private AuthorityService authorityService;
    @Autowired
    private RoleAuthorityService roleauthorityService;

    @GetMapping
    public Result list(String roleId) {
        List<Map<String, Object>> maps = new ArrayList<>();
        List<Authority> authoritys = authorityService.selectList(null);
        List<String> roleAuths = authorityService.listByRoleId(roleId);
        for (int i = 0; i < authoritys.size(); i++) {
            Authority authority = authoritys.get(i);
            Map<String, Object> map = ReflectUtil.objectToMap(authority);
            if (roleAuths != null) {
                for (int j = 0; j < roleAuths.size(); j++) {
                    if (authority.getAuthority().equals(roleAuths.get(j))) {
                        map.put("checked", 1);
                        break;
                    }
                }
            } else {
                map.put("checked", 0);
            }
            maps.add(map);
        }
        return PageResult.toResult(maps);
    }

    @PostMapping("/role")
    public Result addRoleAuth(Authority authority) {
        if (authorityService.insert(authority)) {
            return Result.success();
        }
        return Result.failure(ResultCode.ERROR);
    }

    @DeleteMapping("/role")
    public JsonResult deleteRoleAuth(String roleId, String authId) {
        if (roleauthorityService.delete(new EntityWrapper<RoleAuthority>().eq("role_id", roleId).eq("authority", authId))) {
            return JsonResult.ok();
        }
        return JsonResult.error();
    }
}
