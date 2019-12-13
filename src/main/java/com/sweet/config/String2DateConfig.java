package com.sweet.config;

import cn.hutool.core.date.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 默认的string to date的转化
 *
 * @author fengshuonan
 * @Date 2019/2/12 20:09
 */
@Configuration
public class String2DateConfig {

    @Autowired
    private RequestMappingHandlerAdapter handlerAdapter;

    @Autowired
    HttpServletRequest request;

    /**
     * 默认时间转化器
     */
    @PostConstruct
    public void addConversionConfig() {
        ConfigurableWebBindingInitializer initializer = (ConfigurableWebBindingInitializer) handlerAdapter.getWebBindingInitializer();
        if ((initializer != null ? initializer.getConversionService() : null) != null) {
            GenericConversionService genericConversionService = (GenericConversionService) initializer.getConversionService();
            genericConversionService.addConverter(new StringToDateConverter());
            genericConversionService.addConverter(new StringConverter());

        }
    }

    public class StringToDateConverter implements Converter<String, Date> {
        @Override
        public Date convert(String dateString) {
            if(StringUtils.isEmpty(dateString)){
                return null;
            }
            return DateUtil.parse(dateString);
        }
    }

    public class StringConverter implements Converter<String, String> {
        @Override
        public String convert(String str) {

            String method = request.getMethod();

            System.out.println(str);
            if(str.equals("")&&method.equals("POST")){
                str = " ";
            }
            return str;
        }
    }

}
