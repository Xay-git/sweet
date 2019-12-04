package com.sweet.modular.system.controller;import com.sweet.core.model.ResultBean;import com.sweet.core.shiro.ShiroKit;import com.sweet.core.util.MD5Utils;import com.sweet.modular.system.entity.User;import com.sweet.modular.system.service.UserService;import org.apache.shiro.SecurityUtils;import org.apache.shiro.authc.*;import org.apache.shiro.authz.annotation.RequiresAuthentication;import org.apache.shiro.authz.annotation.RequiresRoles;import org.apache.shiro.subject.Subject;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.ui.ModelMap;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.ResponseBody;/** * 后台控制器 */@RequestMapping("/admin")@Controllerpublic class LoginController {    @Autowired    UserService userService;    @RequestMapping("")    public String index(){        return "admin/index";    }    @RequestMapping("/login")    public String login(ModelMap model){        //如果登录过直接跳转后台        if(ShiroKit.isUser()){            return "redirect:/admin/";        }        return "admin/user/login";    }    @RequestMapping("/loginSubmit")    @ResponseBody    public ResultBean loginSubmit(String username,String password,boolean remember){        // 密码MD5加密        password = MD5Utils.encrypt(username, password);        UsernamePasswordToken token = new UsernamePasswordToken(username.toLowerCase(), password,remember);        // 获取Subject对象        Subject subject = ShiroKit.getSubject();        try {            subject.login(token);            return ResultBean.success();        } catch (UnknownAccountException e) {            return ResultBean.error(e.getMessage());        } catch (IncorrectCredentialsException e) {            return ResultBean.error(e.getMessage());        } catch (LockedAccountException e) {            return ResultBean.error(e.getMessage());        } catch (AuthenticationException e) {            return ResultBean.error("认证失败！");        }    }}