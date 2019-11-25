package com.sweet.modular.menu.mapper;

import com.sweet.core.model.system.layMenu;
import com.sweet.core.model.system.layTree;
import com.sweet.modular.menu.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
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

    @Select("select MENU_ID id,MENU_NAME title,PARENT_ID pid from t_menu where type = 0")
    public ArrayList<layTree> getParentMenu();

}
