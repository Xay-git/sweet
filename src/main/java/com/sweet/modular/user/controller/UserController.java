package com.sweet.modular.user.controller;


import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.core.model.system.layTree;
import com.sweet.core.util.StringUtil;
import com.sweet.modular.base.BaseService;
import com.sweet.modular.dept.service.DeptService;
import com.sweet.modular.user.entity.User;
import com.sweet.modular.user.service.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

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

    @RequestMapping("/user_add")
    public String user_add() {
        return "/admin/user/user_add";
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public ResultBean addUser(User user){
        if(StringUtil.isEmpty(user.getId())){
            userService.save(user);
        }else{
            userService.updateById(user);
        }
        return ResultBean.success(user);
    }

    @RequestMapping("/deptTree")
    @ResponseBody
    public ResultBean tree(){
        ArrayList<layTree> trees = deptService.deptTree();
        ArrayList<layTree> cloneTree = (ArrayList<layTree>) trees.clone();
        ArrayList<layTree> newtrees = new ArrayList<layTree>();

        if(cloneTree.size()>0){
            for(layTree layTree:cloneTree){
                if(layTree.getPid().equals("0")){
                    newtrees.add(layTree);
                    cloneTree.remove(layTree);
                }
            }
            newtrees = baseService.coverLayuiTree(newtrees,cloneTree);
        }
        //默认展开第一个
        newtrees.get(0).setSpread(true);
        return ResultBean.success(newtrees);
    }

    @RequestMapping("/getUserList")
    @ResponseBody
    public LayuiPageInfo getUserList(User user){
        LayuiPageInfo layuiPageInfo = userService.findPageBySpec(user);
        return layuiPageInfo;
    }



}
