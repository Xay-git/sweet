package com.sweet.modular.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.modular.system.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sweet.modular.system.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wxl
 * @since 2019-11-20
 */
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> findByUserName(@Param("userName") String userName);

    Page<Role> customPageList(Page page, @Param("param") Role role);


}
