package com.sweet.modular.system.controller;


import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.system.entity.Role;
import com.sweet.modular.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wxl
 * @since 2019-11-20
 */
@Controller
@RequestMapping("/admin/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("")
    public String roleList(){
        return "/admin/role/role";
    }

    @RequestMapping("/role_menu")
    public String role_menu(){
        return "/admin/role/role_menu";
    }

    @RequestMapping("/getRoleList")
    @ResponseBody
    public LayuiPageInfo getRoleList(Role role){
        return roleService.findPageBySpec(role);
    }

    @RequestMapping("/setAuthority")
    @ResponseBody
    public ResultBean setAuthority(String roleId,@RequestParam(value = "menuIds[]")String[] menuIds){
        roleService.deleteRolesById(roleId);

        System.out.println(roleId);
        System.out.println(menuIds);
        for(String menuId:menuIds){
            System.out.println(menuId);
        }
        return ResultBean.success();
    }



}
