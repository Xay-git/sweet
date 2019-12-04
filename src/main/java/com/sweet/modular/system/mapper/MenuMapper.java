package com.sweet.modular.system.mapper;

import com.sweet.core.model.system.layMenu;
import com.sweet.core.model.system.layTree;
import com.sweet.modular.system.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sweet.modular.system.model.MenuResult;
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

    List<Menu> findMenuByUserName(@Param("userName") String userName);

    @Select("select MENU_ID id,MENU_NAME title,PARENT_ID pid from t_menu order by create_time asc")
    public ArrayList<layTree> getMenuList();

    @Select("select * from t_menu order by ORDER_NUM asc")
    public ArrayList<MenuResult> getMenuTree();

    @Select("select MENU_ID id,MENU_NAME title from t_menu where type = 0 order by ORDER_NUM asc")
    public ArrayList<layMenu> Tree();

    @Select("select MENU_ID id,MENU_NAME title,PARENT_ID pid from t_menu where PARENT_ID = '0' order by create_time asc")
    public ArrayList<layTree> getParentMenu();

    //根据用户名查询左侧菜单
    List<layMenu> findNavByUserName(@Param("userName") String userName);




}
