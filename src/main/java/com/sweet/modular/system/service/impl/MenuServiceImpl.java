package com.sweet.modular.system.service.impl;

import com.sweet.core.model.system.layTree;
import com.sweet.core.sweetConst;
import com.sweet.modular.system.entity.Menu;
import com.sweet.modular.system.mapper.MenuMapper;
import com.sweet.modular.system.model.MenuResult;
import com.sweet.modular.system.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author wxl
 * @since 2019-11-22
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {


    @Override
    public ArrayList<layTree> getMenuList() {
        return baseMapper.getMenuList();
    }

    @Override
    public ArrayList<MenuResult> getMenuTree() {
        return baseMapper.getMenuTree();
    }

    @Override
    public Menu addMenu(String menuId) {
        Menu menu = new Menu();
        menu.setMenuName("未命名");
        menu.setParentId(menuId);
        menu.setType(sweetConst.MENU);
        this.save(menu);
        return menu;
    }

    @Override
    public ArrayList<layTree> getParentMenu() {
        return baseMapper.getParentMenu();
    }
}
