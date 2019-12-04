package com.sweet.core.shiro;import com.sweet.modular.system.entity.User;import org.apache.commons.collections.functors.ConstantFactory;import org.apache.shiro.SecurityUtils;import org.apache.shiro.session.Session;import org.apache.shiro.subject.Subject;import java.util.List;public class ShiroKit {    /**     * 获取当前 Subject     *     * @return Subject     */    public static Subject getSubject() {        return SecurityUtils.getSubject();    }    /**     * 获取封装的 ShiroUser     *     * @return ShiroUser     */    public static User getUser() {        if (isGuest()) {            return null;        } else {            return (User) getSubject().getPrincipals().getPrimaryPrincipal();        }    }    /**     * 认证通过或已记住的用户。与guset搭配使用。     *     * @return 用户：true，否则 false     */    public static boolean isUser() {        return getSubject() != null && getSubject().getPrincipal() != null;    }    /**     * 验证当前用户是否为“访客”，即未认证（包含未记住）的用户。用user搭配使用     *     * @return 访客：true，否则false     */    public static boolean isGuest() {        return !isUser();    }    /**     * 已认证通过的用户。不包含已记住的用户，这是与user标签的区别所在。与notAuthenticated搭配使用     *     * @return 通过身份验证：true，否则false     */    public static boolean isAuthenticated() {        return getSubject() != null && getSubject().isAuthenticated();    }    /**     * 未认证通过用户，与authenticated标签相对应。与guest标签的区别是，该标签包含已记住用户。。     *     * @return 没有通过身份验证：true，否则false     */    public static boolean notAuthenticated() {        return !isAuthenticated();    }    /**     * 从shiro获取session     */    public static Session getSession() {        return getSubject().getSession();    }    /**     * 获取shiro指定的sessionKey     */    @SuppressWarnings("unchecked")    public static <T> T getSessionAttr(String key) {        Session session = getSession();        return session != null ? (T) session.getAttribute(key) : null;    }    /**     * 设置shiro指定的sessionKey     */    public static void setSessionAttr(String key, Object value) {        Session session = getSession();        session.setAttribute(key, value);    }    /**     * 移除shiro指定的sessionKey     */    public static void removeSessionAttr(String key) {        Session session = getSession();        if (session != null)            session.removeAttribute(key);    }}