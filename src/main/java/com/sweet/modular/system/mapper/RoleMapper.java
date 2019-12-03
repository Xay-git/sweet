package com.sweet.modular.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.modular.system.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sweet.modular.system.entity.RoleMenu;
import com.sweet.modular.system.entity.User;
import com.sweet.modular.system.model.XmSelect;
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
 * @since 2019-11-20
 */
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> findRoleByUserName(@Param("userName") String userName);

    Page<Role> customPageList(Page page, @Param("param") Role role);

    @Delete("delete from t_role_menu where rid = #{roleId}")
    Integer deleteRolesById(@Param("roleId") String roleId);

    @Select("select a.mid from t_role_menu a left join t_menu b on a.mid = b.menu_id where rid = #{roleId} and b.parent_id != '0'")
    List<String> getMenusByRoleId(@Param("roleId") String roleId);

    @Select("select role_id value,name from t_role order by create_time asc")
    List<XmSelect> getXmSelect();


}
