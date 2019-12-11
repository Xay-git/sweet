package com.sweet.system.service;

import com.sweet.core.model.system.layTree;
import com.sweet.system.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sweet.system.model.MenuResult;

import java.util.ArrayList;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author wxl
 * @since 2019-11-22
 */
public interface MenuService extends IService<Menu> {

    public ArrayList<layTree> getMenuTree();

    public ArrayList<MenuResult> getMenuTableTree();

    public Menu addMenu(String menuId);

    public ArrayList<layTree> getParentMenu();

    public void deleteMenu(Menu menu);

    public Integer getMenuChildrenCount(String menuId);

}
