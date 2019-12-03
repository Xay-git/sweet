package com.sweet.modular.system.controller;


import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.core.util.MD5Utils;
import com.sweet.core.util.StringUtil;
import com.sweet.modular.system.service.BaseService;
import com.sweet.modular.system.service.DeptService;
import com.sweet.modular.system.entity.User;
import com.sweet.modular.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wxl
 * @since 2019-06-20
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private BaseService baseService;

    @RequestMapping("")
    public String userList() {
        return "/admin/user/user";
    }

    @RequestMapping("/user_edit")
    public String user_edit() {
        return "/admin/user/user_edit";
    }

    /**
     * 创建用户
     * @param user
     * @return
     */
    @RequestMapping("/editUser")
    @ResponseBody
    @Transactional
    public ResultBean editUser(User user,String roleAssign){
        if(StringUtil.isEmpty(user.getUserId())){
            user.setPassword(MD5Utils.encrypt(user.getUserName().toLowerCase(), User.DEFAULT_PASSWORD));
            userService.save(user);
        }else{
            userService.updateById(user);
        }
        if(!StringUtil.isEmpty(roleAssign)){
            userService.setRoleAssign(user.getUserId(),roleAssign);
        }
        return ResultBean.success(user);
    }

    /**
     * 获得用户详情
     * @param id
     * @return
     */
    @RequestMapping("/getUser")
    @ResponseBody
    public ResultBean getUser(String userId){
       User user = userService.findUserById(userId);
       return ResultBean.success(user);
    }

    @RequestMapping("/getUserRole")
    @ResponseBody
    public ResultBean getUserRole(String userId){
        return ResultBean.success(userService.getRole(userId));
    }

    /**
     * 获得机构下的用户列表
     * @param user
     * @return
     */
    @RequestMapping("/getUserList")
    @ResponseBody
    public LayuiPageInfo getUserList(User user){
        LayuiPageInfo layuiPageInfo = userService.findPageBySpec(user);
        return layuiPageInfo;
    }



}
