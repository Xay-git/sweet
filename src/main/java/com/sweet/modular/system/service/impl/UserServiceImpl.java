package com.sweet.modular.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.core.model.system.LayuiPageFactory;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.system.entity.User;
import com.sweet.modular.system.entity.UserRole;
import com.sweet.modular.system.mapper.UserMapper;
import com.sweet.modular.system.mapper.UserRoleMapper;
import com.sweet.modular.system.service.UserRoleService;
import com.sweet.modular.system.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wxl
 * @since 2019-06-20
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    UserRoleService userRoleService;

    @Override
    public User findByUserName(String userName) {
        return userMapper.findByUserName(userName);
    }

    @Override
    public LayuiPageInfo findPageBySpec(User user) {
        Page pageContext = getPageContext();
        IPage page = this.baseMapper.customPageList(pageContext, user);
        return LayuiPageFactory.createPageInfo(page);
    }

    @Override
    public User findUserById(String id) {
        User user = baseMapper.selectById(id);
        user.setPassword(null);
        return user;
    }

    @Override
    public void setRoleAssign(String userId, String roleIds) {
        baseMapper.deleteRoleAssignById(userId);
        String[] ids = roleIds.split(",");
        for(String roleId:ids){
            UserRole userRole = new UserRole();
            userRole.setUid(userId);
            userRole.setRid(roleId);
            userRoleService.save(userRole);
        }
    }

    @Override
    public List<String> getRole(String userId) {
        return baseMapper.getRole(userId);
    }

    private Page getPageContext() {
        return LayuiPageFactory.defaultPage();
    }
}
