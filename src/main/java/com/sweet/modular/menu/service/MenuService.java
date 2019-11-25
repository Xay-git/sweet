package com.sweet.modular.menu.service;

import com.sweet.core.model.system.layTree;
import com.sweet.modular.menu.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author wxl
 * @since 2019-11-22
 */
public interface MenuService extends IService<Menu> {

    public ArrayList<layTree> getParentMenu();

    public Menu addMenu(String menuId);

}
