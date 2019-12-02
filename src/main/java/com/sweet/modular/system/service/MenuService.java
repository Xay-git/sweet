package com.sweet.modular.system.service;

import com.sweet.core.model.system.layTree;
import com.sweet.modular.system.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sweet.modular.system.model.MenuResult;

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

    public ArrayList<layTree> getMenuList();

    public ArrayList<MenuResult> getMenuTree();

    public Menu addMenu(String menuId);

    public ArrayList<layTree> getParentMenu();

}
