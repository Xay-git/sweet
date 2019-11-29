package com.sweet.modular.user.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.modular.dept.entity.Dept;
import com.sweet.modular.user.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wxl
 * @since 2019-06-20
 */
public interface UserMapper extends BaseMapper<User> {

    User findByUserName(@Param("userName") String userName);

    Page<User> customPageList(Page page, @Param("param") User dept);



}
