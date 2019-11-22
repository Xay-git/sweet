package com.sweet.modular.menu.service.impl;

import com.sweet.modular.menu.entity.Menu;
import com.sweet.modular.menu.mapper.MenuMapper;
import com.sweet.modular.menu.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

}
