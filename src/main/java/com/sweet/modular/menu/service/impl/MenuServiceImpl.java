package com.sweet.modular.menu.service.impl;

import com.sweet.core.model.system.layTree;
import com.sweet.core.sweetConst;
import com.sweet.modular.menu.entity.Menu;
import com.sweet.modular.menu.mapper.MenuMapper;
import com.sweet.modular.menu.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


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
    public ArrayList<layTree> getParentMenu() {
        return baseMapper.getParentMenu();
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
}
