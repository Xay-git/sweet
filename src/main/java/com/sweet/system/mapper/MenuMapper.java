package com.sweet.system.mapper;

import com.sweet.core.model.system.layMenu;
import com.sweet.core.model.system.layTree;
import com.sweet.system.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sweet.system.model.MenuResult;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author wxl
 * @since 2019-11-22
 */
public interface MenuMapper extends BaseMapper<Menu> {
    // 获取用户菜单集
    List<Menu> findMenuByUserName(@Param("userName") String userName);
    // 获取所有菜单生成树性菜单使用
    @Select("select MENU_ID id,MENU_NAME title,PARENT_ID pid from t_menu order by create_time asc")
    ArrayList<layTree> getMenuList();
    // 获取所有菜单生成树表格使用
    @Select("select * from t_menu order by ORDER_NUM asc")
    ArrayList<MenuResult> getMenuTree();
    // 获取所有一级菜单
    @Select("select MENU_ID id,MENU_NAME title,PARENT_ID pid from t_menu where PARENT_ID = '0' order by create_time asc")
    ArrayList<layTree> getParentMenu();
    //根据用户名查询左侧菜单
    List<layMenu> findNavByUserName(@Param("userName") String userName);
    //删除菜单角色表中关联的的数据
    @Delete("delete from t_role_menu where mid = #{menuId}")
    Integer delRoleMenuByMenuId(@Param("menuId") String menuId);
    //删除查询菜单下面有无子菜单
    @Select("select count(1) from t_menu where parent_id = #{menuId}")
    Integer getMenuChildrenCount(@Param("menuId") String menuId);





}
