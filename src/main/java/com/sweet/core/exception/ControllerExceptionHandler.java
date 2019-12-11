package com.sweet.core.exception;import com.sweet.core.model.ResultBean;import com.sweet.core.model.ResultError;import lombok.extern.slf4j.Slf4j;import org.apache.shiro.authz.AuthorizationException;import org.beetl.ext.fn.StringUtil;import org.springframework.core.annotation.Order;import org.springframework.http.HttpStatus;import org.springframework.web.bind.annotation.ControllerAdvice;import org.springframework.web.bind.annotation.ExceptionHandler;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.web.bind.annotation.ResponseStatus;import javax.servlet.http.HttpServletRequest;import java.sql.SQLException;import java.sql.SQLSyntaxErrorException;import java.util.HashMap;import java.util.Map;@ControllerAdvice@Order(-1)@Slf4jpublic class ControllerExceptionHandler {    @ExceptionHandler(UserNotExistException.class)    @ResponseBody    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)    public Map<String, Object> handleUserNotExistsException(UserNotExistException e) {        Map<String, Object> map = new HashMap<>();        map.put("id", e.getId());        map.put("message", e.getMessage());        return map;    }    @ExceptionHandler(value = AuthorizationException.class)    public String handleAuthorizationException() {        return "/unauthorized";    }    /**     * 拦截业务异常     */    @ExceptionHandler(ServiceException.class)    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)    @ResponseBody    public ResultBean bussiness(ServiceException e) {        return new ResultError(e.getCode(), e.getMessage());    }    @ExceptionHandler(SQLSyntaxErrorException.class)    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)    @ResponseBody    public ResultBean SQLSyntaxErrorException(SQLSyntaxErrorException e) {        log.error(e.getMessage());        log.error(e.getSQLState());        return ResultBean.error("阿哦！出现错误惹！");    }    @ExceptionHandler(SQLException.class)    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)    @ResponseBody    public ResultBean SQLSyntaxErrorException(SQLException e) {        log.error(e.getMessage());        log.error(e.getSQLState());        return ResultBean.error("阿哦！出现错误惹！");    }/*    @ExceptionHandler(Exception.class)    @ResponseBody    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)    public ResultBean Exception(HttpServletRequest request,Exception e) {        if(isAjax(request)){            System.out.println("是接口错误");        }else{            System.out.println("是页面错误");        }        Map<String, Object> map = new HashMap<>();        return ResultBean.error("发生错误了");    }*/    /**     * 判断是否是ajax请求     */    public static boolean isAjax(HttpServletRequest httpRequest) {        return (httpRequest.getHeader("X-Requested-With") != null                && "XMLHttpRequest"                .equals(httpRequest.getHeader("X-Requested-With").toString()));    }}