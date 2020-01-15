package com.sweet.config;import com.sweet.core.jwt.JWTFilter;import com.sweet.core.properties.SystemProperties;import com.sweet.core.shiro.ShiroRealm;import com.sweet.core.shiro.URLPathMatchingFilter;import com.sweet.core.shiro.session.ShiroSessionListener;import org.apache.shiro.codec.Base64;import org.apache.shiro.mgt.SecurityManager;import org.apache.shiro.session.SessionListener;import org.apache.shiro.session.mgt.SessionManager;import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;import org.apache.shiro.spring.web.ShiroFilterFactoryBean;import org.apache.shiro.web.mgt.CookieRememberMeManager;import org.apache.shiro.web.mgt.DefaultWebSecurityManager;import org.apache.shiro.web.servlet.SimpleCookie;import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;import org.crazycake.shiro.RedisCacheManager;import org.crazycake.shiro.RedisManager;import org.crazycake.shiro.RedisSessionDAO;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.beans.factory.annotation.Value;import org.springframework.context.annotation.Bean;import org.springframework.context.annotation.Configuration;import javax.servlet.Filter;import java.util.ArrayList;import java.util.Collection;import java.util.LinkedHashMap;import java.util.Map;/** * 描述： * * @author caojing * @create 2019-01-27-13:38 */@Configurationpublic class ShiroConfig {    @Autowired    private SystemProperties systemProperties;    @Value("${server.session.cookie.name}")    String cooikeName;    @Bean    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();        // 设置securityManager        shiroFilterFactoryBean.setSecurityManager(securityManager);        //自定义拦截器        Map<String, Filter> filtersMap = new LinkedHashMap<String, Filter>();        //访问权限配置        filtersMap.put("requestURL", new URLPathMatchingFilter());        filtersMap.put("jwt", new JWTFilter());        shiroFilterFactoryBean.setFilters(filtersMap);        // 登录的url        shiroFilterFactoryBean.setLoginUrl("/admin/auth/login");        // 登录成功后跳转的url        shiroFilterFactoryBean.setSuccessUrl("/admin");        // 未授权url        shiroFilterFactoryBean.setUnauthorizedUrl("/error/unauthorized");        LinkedHashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<>();        /* 配置映射关系*/        //authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问;user用户可以访问包含记住我        // 定义filterChain，静态资源不拦截        filterChainDefinitionMap.put("/css/**", "anon");        filterChainDefinitionMap.put("/js/**", "anon");        filterChainDefinitionMap.put("/fonts/**", "anon");        filterChainDefinitionMap.put("/img/**", "anon");        filterChainDefinitionMap.put("/upload/**", "anon");        // 配置退出过滤器，其中具体的退出代码Shiro已经替我们实现了        filterChainDefinitionMap.put("/admin/auth/logout", "logout");        filterChainDefinitionMap.put("/admin/auth/**", "anon");        filterChainDefinitionMap.put("/swagger-ui.html/**", "user");        // 除上以外所有url都必须认证通过才可以访问，未通过认证自动访问LoginUrl        filterChainDefinitionMap.put("/admin/**", "user");        filterChainDefinitionMap.put("/admin/**", "requestURL");        filterChainDefinitionMap.put("/weixin/login**", "anon");        filterChainDefinitionMap.put("/weixin/**", "jwt");        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);        return shiroFilterFactoryBean;    }    @Bean    public SecurityManager securityManager(){        // 配置SecurityManager，并注入shiroRealm        DefaultWebSecurityManager securityManager =  new DefaultWebSecurityManager();        securityManager.setRealm(shiroRealm());        securityManager.setRememberMeManager(rememberMeManager());        securityManager.setCacheManager(cacheManager());        securityManager.setSessionManager(sessionManager());        return securityManager;    }    @Bean    public ShiroRealm shiroRealm(){        // 配置Realm，需自己实现        ShiroRealm shiroRealm = new ShiroRealm();        return shiroRealm;    }    /**     * cookie对象     * @return     */    public SimpleCookie rememberMeCookie() {        // 设置cookie名称，对应login.html页面的<input type="checkbox" name="remember"/>        SimpleCookie cookie = new SimpleCookie("remember");        // 设置cookie的过期时间，单位为秒，这里为一天        cookie.setMaxAge(86400);        cookie.setHttpOnly(true);        return cookie;    }    /**     * cookie管理对象     * @return     */    public CookieRememberMeManager rememberMeManager() {        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();        cookieRememberMeManager.setCookie(rememberMeCookie());        // rememberMe cookie加密的密钥        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));        return cookieRememberMeManager;    }    /**     * shiro redis缓存     * @return     */    public RedisManager redisManager() {        RedisManager redisManager = new RedisManager();        return redisManager;    }    /**     * shiro redis缓存     * @return     */    public RedisCacheManager cacheManager() {        RedisCacheManager redisCacheManager = new RedisCacheManager();        redisCacheManager.setRedisManager(redisManager());        redisCacheManager.setPrincipalIdFieldName("userId");        return redisCacheManager;    }    /**     * shiro注解     * @param securityManager     * @return     */    @Bean    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);        return authorizationAttributeSourceAdvisor;    }    /**     * 会话管理     * @return     */    @Bean    public RedisSessionDAO sessionDAO() {        RedisSessionDAO redisSessionDAO = new RedisSessionDAO();        redisSessionDAO.setRedisManager(redisManager());        redisSessionDAO.setKeyPrefix(cooikeName+":shiro_session:");        return redisSessionDAO;    }    /**     * 给shiro的sessionId默认的JSSESSIONID名字改掉     * @return     */    @Bean    public SimpleCookie getSessionIdCookie(){        SimpleCookie simpleCookie = new SimpleCookie(cooikeName);        return simpleCookie;    }    @Bean    public SessionManager sessionManager() {        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();        Collection<SessionListener> listeners = new ArrayList<SessionListener>();        listeners.add(new ShiroSessionListener());        sessionManager.setSessionListeners(listeners);        sessionManager.setSessionDAO(sessionDAO());        sessionManager.setGlobalSessionTimeout(systemProperties.getSessionTimeout()* 1000L);        sessionManager.setSessionIdUrlRewritingEnabled(false);        sessionManager.setSessionIdCookie(getSessionIdCookie());        return sessionManager;    }}