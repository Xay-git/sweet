package com.sweet.system.controller;
import com.sweet.core.exception.ServiceException;
import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.core.model.system.layMenu;
import com.sweet.core.model.system.layTree;
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

import java.util.ArrayList;
import java.util.List;

import static com.sweet.core.exception.enums.SystemExceptionEnum.ACCOUNT_ALREADY_EXCEPTION;

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
    private RoleService roleService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private BaseService baseService;

    @RequestMapping("")
    public String userList() {
        return "/system/user/user";
    }

    @RequestMapping("/user_edit")
    public String user_edit() {
        return "/system/user/user_edit";
    }


    @RequestMapping("/user_password")
    public String user_password() {
        return "/system/user/user_password";
    }

    @RequestMapping("/user_info")
    public String user_info(Model model) {
        model.addAttribute("shiroUser",ShiroKit.getUser());
        return "/system/user/user_info";
    }

    /**
     * 修改密码
     * @param userId
     * @param oldPsw
     * @param newPsw
     * @return
     */
    @RequestMapping("/editPassword")
    @ResponseBody
    public ResultBean editPassword(String userId,String oldPsw,String newPsw){
        User user = userService.getById(userId);
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
        if(StringUtil.isEmpty(user.getUserId())){
            userService.addUser(user);
        }else{
            String userName = user.getUserName().toLowerCase();
            User temp = userService.findByUserName(userName);
            if((temp!=null)&&!temp.getUserId().equals(user.getUserId())){
                throw new ServiceException(ACCOUNT_ALREADY_EXCEPTION);
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
     * 重置密码
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
       user.setRoleIds(userService.getRoleByUserId(userId));
       return ResultBean.success(user);
    }

    /**
     * 删除用户
     * @param user
     * @return
     */
    @RequestMapping("/delUser")
    @ResponseBody
    public ResultBean delUser(User user){
        userService.removeById(user);
        return ResultBean.success();
    }


    /**
     * 根据机构id获得机构下的用户列表
     * @param user
     * @return
     */
    @RequestMapping("/getUserList")
    @ResponseBody
    public LayuiPageInfo getUserList(User user){
        LayuiPageInfo layuiPageInfo = userService.findPageBySpec(user);
        return layuiPageInfo;
    }

    @RequestMapping("/deptTree")
    @ResponseBody
    public ResultBean tree(){
        ArrayList<layTree> trees = deptService.deptTree();
        ArrayList<layTree> cloneTree = (ArrayList<layTree>) trees.clone();
        ArrayList<layTree> newtrees = new ArrayList<layTree>();

        //创建父级节点
        newtrees.add(new layTree().createParent());

        if(cloneTree.size()>0){
            newtrees = baseService.coverLayuiTree(newtrees,cloneTree);
        }
        return ResultBean.success(newtrees);
    }

    /**
     * 获得
     * @param deptId
     * @return
     */
    @RequestMapping("/deptList")
    @ResponseBody
    public ResultBean list(){
        return ResultBean.success(deptService.list());
    }

}
