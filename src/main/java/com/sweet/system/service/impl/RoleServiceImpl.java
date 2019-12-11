package com.sweet.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.core.model.system.LayuiPageFactory;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.system.entity.Role;
import com.sweet.system.mapper.RoleMapper;
import com.sweet.system.model.XmSelect;
import com.sweet.system.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public Integer deleteRoleMenuById(String roleId) {
        return baseMapper.deleteRolesById(roleId);
    }

    @Override
    @Transactional
    public void deleteRole(Role role) {
        deleteRoleMenuById(role.getRoleId());
        baseMapper.deleteUserRolesById(role.getRoleId());
        removeById(role);
    }

    @Override
    public List<String> getMenusByRoleId(String roleId) {
        return baseMapper.getMenusByRoleId(roleId);
    }

    @Override
    public List<XmSelect> getXmSelect() {
        return baseMapper.getXmSelect();
    }


    private Page getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

}
