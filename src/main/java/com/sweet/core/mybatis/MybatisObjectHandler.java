package com.sweet.core.mybatis;import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;import com.sweet.core.shiro.ShiroKit;import com.sweet.system.entity.User;import org.apache.ibatis.reflection.MetaObject;import org.springframework.context.annotation.Configuration;import javax.sound.midi.MetaEventListener;import java.time.LocalDateTime;import java.util.Date;@Configurationpublic class MybatisObjectHandler implements MetaObjectHandler {    @Override    public void insertFill(MetaObject metaObject) {        User loginUser =  ShiroKit.getUser();        setFieldValByName("version", 1L,metaObject);        setFieldValByName("createTime", new Date(),metaObject);        setFieldValByName("modifyTime", new Date(),metaObject);        if(loginUser!=null){            setFieldValByName("deptId", loginUser.getDeptId(),metaObject);            setFieldValByName("createId", loginUser.getUserId(),metaObject);        }    }    @Override    public void updateFill(MetaObject metaObject) {        setFieldValByName("modifyTime",new Date(),metaObject);    }}