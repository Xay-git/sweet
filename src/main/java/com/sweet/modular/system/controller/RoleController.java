package com.sweet.modular.system.controller;


import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.system.entity.Role;
import com.sweet.modular.system.entity.RoleMenu;
import com.sweet.modular.system.model.XmSelect;
import com.sweet.modular.system.service.RoleMenuService;
import com.sweet.modular.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
    RoleService roleService;

    @Autowired
    RoleMenuService roleMenuService;

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

    @RequestMapping("/getAuthority")
    @ResponseBody
    public ResultBean getAuthority(String roleId){
        List<String> list = roleService.getMenusByRoleId(roleId);
        return ResultBean.success(list);
    }

    @RequestMapping("/setAuthority")
    @ResponseBody
    public ResultBean setAuthority(String roleId,@RequestParam(value = "menuIds[]")String[] menuIds){
        roleService.deleteRolesById(roleId);

        if(menuIds.length>0){
            for(String menuId:menuIds){
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setRid(roleId);
                roleMenu.setMid(menuId);
                roleMenuService.save(roleMenu);
            }
        }
        return ResultBean.success();
    }

    @RequestMapping("/getXmSelect")
    @ResponseBody
    public ResultBean getXmSelect(){
        List<XmSelect> list = roleService.getXmSelect();
        return ResultBean.success(list);
    }



}
