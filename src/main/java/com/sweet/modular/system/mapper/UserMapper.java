package com.sweet.modular.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sweet.modular.system.entity.User;
import org.apache.ibatis.annotations.Param;

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
