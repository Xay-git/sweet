package com.sweet.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sweet.system.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wxl
 * @since 2019-06-20
 */
public interface UserMapper extends BaseMapper<User> {

    User findByUserId(@Param("userId") String userId);

    User findByUserName(@Param("userName") String userName);

    Page<User> customPageList(Page page, @Param("param") User dept);

    @Delete("delete from t_user_role where uid = #{userId}")
    Integer deleteRoleAssignById(@Param("userId")String userId);

    @Select("select rid from t_user_role where uid = #{userId} ")
    List<String> getRole(String userId);




}
