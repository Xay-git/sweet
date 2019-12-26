package com.sweet.core.shiro;import com.sweet.core.exception.ControllerExceptionHandler;import com.sweet.core.exception.ServiceException;import com.sweet.core.model.ResultError;import com.sweet.core.util.HttpContext;import com.sweet.core.util.SpringContextUtil;import com.sweet.system.entity.User;import com.sweet.system.service.UserService;import lombok.extern.slf4j.Slf4j;import org.apache.shiro.web.filter.PathMatchingFilter;import org.apache.shiro.web.util.WebUtils;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Component;import javax.servlet.ServletRequest;import javax.servlet.ServletResponse;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;import java.util.Set;@Slf4j@Componentpublic class URLPathMatchingFilter extends PathMatchingFilter {    @Override    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue)            throws Exception {        HttpServletRequest httpServletRequest = WebUtils.toHttp(request) ;        HttpServletResponse httpServletResponse = WebUtils.toHttp(response);        UserService userService = SpringContextUtil.getApplicationContext().getBean(UserService.class);        ResultError resultError;        String requestURI = getPathWithinApplication(request);        log.debug("begin => : URLPathMatchingFilter request_url => :" + requestURI);        if (!ShiroKit.isUser()) {            // 如果没有登录, 直接返回false 进入登录流程            if(HttpContext.isAjax(httpServletRequest)){                resultError = ResultError.error(401,"登录状态已失效！");                HttpContext.write(httpServletResponse,resultError);            }else{                WebUtils.issueRedirect(request, response, "/admin/login");            }            return false;        }        User user = ShiroKit.getUser();        String userName = user.getUserName();        Set<String> roleSet = userService.getUserRole(userName);        log.debug("hasRole => : "+roleSet);        //如果是管理员直接放行        if(roleSet.contains("admin")){            return true;        }        //创建权限标记        boolean hasPermission = false;        //如果url大于三层分割为两层        String[] str = requestURI.split("/");        if (str.length > 3) {            requestURI = "/" + str[1] + "/" + str[2];        }        Set<String> menuSet = userService.getUserMenu(userName);        log.debug("hasMenu => : "+menuSet);        for (String url : menuSet) {            if(url!=null){                if (requestURI.equals(url)) {                    hasPermission = true;                }            }        }        //如果拥有权限放行        if (hasPermission) {            return true;        } else {            if(HttpContext.isAjax(httpServletRequest)){                throw new ServiceException(500,"抱歉您没有访问权限");            }            //否则跳转到未授权页面            WebUtils.issueRedirect(request, response, "/error/unauthorized");            return false;        }    }}