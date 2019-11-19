package com.sweet.modular.admin;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.sweet.core.exception.UserNotExistException;import com.sweet.core.model.ResultBean;import com.sweet.core.util.MD5Utils;import com.sweet.modular.user.entity.User;import com.sweet.modular.user.service.UserService;import org.apache.shiro.SecurityUtils;import org.apache.shiro.authc.*;import org.apache.shiro.subject.Subject;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.ui.ModelMap;import org.springframework.web.bind.annotation.ControllerAdvice;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.ResponseBody;/** * 后台控制器 */@RequestMapping("/admin")@Controllerpublic class AdminController {    @Autowired    UserService userService;    private String PREFIX = "/article";    @RequestMapping("")    public String index(){        return "admin/index";    }    @RequestMapping("/login")    public String login(ModelMap model){        User user = (User) SecurityUtils.getSubject().getPrincipal();        model.addAttribute("user", user);        return "admin/user/login";    }    @RequestMapping("/loginSubmit")    @ResponseBody    public ResultBean loginSubmit(String username,String password,boolean remember){        // 密码MD5加密        password = MD5Utils.encrypt(username, password);        System.out.println(password);        UsernamePasswordToken token = new UsernamePasswordToken(username, password,remember);        // 获取Subject对象        Subject subject = SecurityUtils.getSubject();        try {            subject.login(token);            return ResultBean.success();        } catch (UnknownAccountException e) {            return ResultBean.error(e.getMessage());        } catch (IncorrectCredentialsException e) {            return ResultBean.error(e.getMessage());        } catch (LockedAccountException e) {            return ResultBean.error(e.getMessage());        } catch (AuthenticationException e) {            return ResultBean.error("认证失败！");        }    }}