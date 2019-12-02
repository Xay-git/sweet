package com.sweet.modular.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.core.model.system.LayuiPageFactory;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.system.entity.Role;
import com.sweet.modular.system.entity.RoleMenu;
import com.sweet.modular.system.entity.User;
import com.sweet.modular.system.mapper.RoleMapper;
import com.sweet.modular.system.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wxl
 * @since 2019-11-20
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Override
    public LayuiPageInfo findPageBySpec(Role role) {
        Page pageContext = getPageContext();
        IPage page = this.baseMapper.customPageList(pageContext, role);
        return LayuiPageFactory.createPageInfo(page);
    }

    @Override
    public Integer deleteRolesById(String roleId) {
        return baseMapper.deleteRolesById(roleId);
    }

    @Override
    public List<String> getMenusByRoleId(String roleId) {
        return baseMapper.getMenusByRoleId(roleId);
    }


    private Page getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

}
