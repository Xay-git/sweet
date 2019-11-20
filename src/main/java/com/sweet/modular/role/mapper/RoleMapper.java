package com.sweet.modular.role.mapper;

import com.sweet.modular.role.entity.Role;
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
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> findByUserName(@Param("userName") String userName);

}
