package com.sweet.config;import com.baomidou.mybatisplus.extension.plugins.PerformanceInterceptor;import com.sweet.core.exception.ErrorView;import com.sweet.core.properties.SystemProperties;import com.sweet.core.util.ToolUtil;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.boot.web.server.ConfigurableWebServerFactory;import org.springframework.boot.web.server.ErrorPage;import org.springframework.boot.web.server.WebServerFactoryCustomizer;import org.springframework.context.annotation.Bean;import org.springframework.context.annotation.Configuration;import org.springframework.http.HttpStatus;import org.springframework.web.method.support.HandlerMethodArgumentResolver;import org.springframework.web.servlet.config.annotation.*;import java.util.List;import java.util.Properties;/** * 在SpringBoot2.0及Spring 5.0 WebMvcConfigurerAdapter已被废弃，目前找到解决方案就有 * 1 直接实现WebMvcConfigurer （官方推荐） * 2 直接继承WebMvcConfigurationSupport * @ https://blog.csdn.net/lenkvin/article/details/79482205 */@Configurationpublic class WebConfig extends WebMvcConfigurerAdapter {    @Autowired    SystemProperties systemProperties;    /**     * 配置servlet处理     */    @Override    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {        configurer.enable();    }    /**     * 跨域     */    @Override    public void addCorsMappings(CorsRegistry registry) {        registry.addMapping("/**")                .allowedOrigins("*")                .allowedMethods("GET");    }    @Override    public void addResourceHandlers(ResourceHandlerRegistry registry) {        if (ToolUtil.isWinOs()) {  //如果是Windows系统            registry.addResourceHandler("/upload/**")                    // /upload/**表示在磁盘upload目录下的所有资源会被解析为以下的路径                    .addResourceLocations("file:"+systemProperties.getUploadPath()) //媒体资源                    .addResourceLocations("classpath:/META-INF/resources/");        } else {  //linux 和mac            registry.addResourceHandler("/upload/**")                    .addResourceLocations("file:/www/www/www/")   //媒体资源                    .addResourceLocations("classpath:/META-INF/resources/");  //媒体资源;        }    }    /**     * 默认错误页面，返回json     */    @Bean("error")    public ErrorView error() {        return new ErrorView();    }    /**     * 打印 sql     *//*    @Bean    public PerformanceInterceptor performanceInterceptor() {        PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();        //格式化sql语句        Properties properties = new Properties();        properties.setProperty("format", "false");        performanceInterceptor.setProperties(properties);        return performanceInterceptor;    }*/}