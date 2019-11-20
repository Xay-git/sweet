package com.sweet.modular.permission.mapper;

import com.sweet.modular.permission.entity.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
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
public interface PermissionMapper extends BaseMapper<Permission> {

    List<Permission> findByUserName(@Param("userName")String userName);


}
