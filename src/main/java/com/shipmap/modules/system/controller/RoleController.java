package com.shipmap.modules.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.shipmap.framework.JsonResult;
import com.shipmap.framework.PageResult;
import com.shipmap.framework.Result;
import com.shipmap.modules.system.model.Role;
import com.shipmap.modules.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping()
    public Result list(String keyword) {
        List<Role> list = roleService.selectList(new EntityWrapper<Role>().orderBy("create_time", true));
        // 筛选结果
        if (keyword != null && !keyword.trim().isEmpty()) {
            keyword = keyword.trim();
            Iterator<Role> iterator = list.iterator();
            while (iterator.hasNext()) {
                Role next = iterator.next();
                boolean b = next.getRoleName().contains(keyword) || next.getComments().contains(keyword);
                if (!b) {
                    iterator.remove();
                }
            }
        }
        return PageResult.toResult(list);
    }

    @PostMapping()
    public JsonResult add(Role role) {
        if (roleService.insert(role)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    @PutMapping()
    public JsonResult update(Role role) {
        if (roleService.updateById(role)) {
            return JsonResult.ok("修改成功！");
        }
        return JsonResult.error("修改失败！");
    }

    @DeleteMapping("/{id}")
    public JsonResult delete(@PathVariable("id") String roleId) {
        if (roleService.deleteById(roleId)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }
}
