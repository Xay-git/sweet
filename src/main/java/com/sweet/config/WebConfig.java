package com.sweet.config;import com.baomidou.mybatisplus.extension.plugins.PerformanceInterceptor;import org.springframework.context.annotation.Bean;import org.springframework.context.annotation.Configuration;import org.springframework.web.servlet.config.annotation.*;import java.util.Properties;/** * 在SpringBoot2.0及Spring 5.0 WebMvcConfigurerAdapter已被废弃，目前找到解决方案就有 * 1 直接实现WebMvcConfigurer （官方推荐） * 2 直接继承WebMvcConfigurationSupport * @ https://blog.csdn.net/lenkvin/article/details/79482205 */@Configurationpublic class WebConfig extends WebMvcConfigurerAdapter {    /**     * 配置servlet处理     */    @Override    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {        configurer.enable();    }    /**     * 跨域     */    @Override    public void addCorsMappings(CorsRegistry registry) {        registry.addMapping("/**")                .allowedOrigins("*")                .allowedMethods("GET");    }    /**     * 打印 sql     */    @Bean    public PerformanceInterceptor performanceInterceptor() {        PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();        //格式化sql语句        Properties properties = new Properties();        properties.setProperty("format", "false");        performanceInterceptor.setProperties(properties);        return performanceInterceptor;    }}