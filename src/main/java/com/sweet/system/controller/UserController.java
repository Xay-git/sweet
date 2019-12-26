package com.sweet.system.controller;


import com.sweet.core.exception.ServiceException;
import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.core.model.system.layMenu;
import com.sweet.core.shiro.ShiroKit;
import com.sweet.core.util.MD5Utils;
import com.sweet.core.util.StringUtil;
import com.sweet.system.mapper.UserMapper;
import com.sweet.system.model.XmSelect;
import com.sweet.system.service.BaseService;
import com.sweet.system.service.DeptService;
import com.sweet.system.entity.User;
import com.sweet.system.service.RoleService;
import com.sweet.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
    private UserMapper userMapper;

    @Autowired
    private DeptService deptService;

    @Autowired
    private BaseService baseService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("")
    public String userList() {
        return "/system/user/user";
    }

    @RequestMapping("/user_edit")
    public String user_edit() {
        return "/system/user/user_edit";
    }

    @RequestMapping("/user_info")
    public String user_info(Model model) {
        model.addAttribute("shiroUser",ShiroKit.getUser());
        return "/system/user/user_info";
    }

    @RequestMapping("/user_password")
    public String user_password() {
        return "/system/user/user_password";
    }

    @RequestMapping("/editPassword")
    @ResponseBody
    public ResultBean editPassword(String userId,String oldPsw,String newPsw){
        User user = userMapper.selectById(userId);
        String userName = user.getUserName();
        String psw = user.getPassword();
        oldPsw = MD5Utils.encrypt(userName, oldPsw);
        if(!psw.equals(oldPsw)){
            throw new ServiceException("您输入的密码不正确！");
        }else{
            user.setPassword(MD5Utils.encrypt(userName, newPsw));
        }
        userService.updateById(user);
        return ResultBean.success();
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
        String username = user.getUserName();
        if(StringUtil.isEmpty(user.getUserId())){
            userService.addUser(user);
        }else{
            if((user.getAccountStatus()==0)&&ShiroKit.hasRole("admin")){
                throw new ServiceException("不可以冻结管理员！");
            }
            userService.updateById(user);
            if(user.getUserId().equals(ShiroKit.getUser().getUserId())){
                ShiroKit.updateUser(user);
            }
        }
        if(!StringUtil.isEmpty(roleAssign)){
            userService.setRoleAssign(user.getUserId(),roleAssign);
        }
        return ResultBean.success(user);
    }

    /**
     * 充值密码
     * @param userId
     * @return
     */
    @RequestMapping("/resetPassword")
    @ResponseBody
    public ResultBean resetPassword(User user){
        String password = MD5Utils.encrypt(user.getUserName(), User.DEFAULT_PASSWORD);
        user.setPassword(password);
        userService.updateById(user);
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
       user.setPassword(null);
       user.setRoleIds(userService.getRoleByUserId(userId));
       return ResultBean.success(user);
    }


    @RequestMapping("/navTree")
    @ResponseBody
    public ResultBean navTree(){
        User user = ShiroKit.getUser();
        List<layMenu> list= userService.findNavByUserName(user.getUserName());
        return ResultBean.success(list);
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

    /**
     * 获得角色多选
     * @param menu
     * @return
     */
    @RequestMapping("/getXmSelect")
    @ResponseBody
    public ResultBean getXmSelect(){
        List<XmSelect> list = roleService.getXmSelect();
        return ResultBean.success(list);
    }

}
