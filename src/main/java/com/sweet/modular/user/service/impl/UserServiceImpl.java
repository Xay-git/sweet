package com.sweet.modular.user.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.core.model.system.LayuiPageFactory;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.dept.entity.Dept;
import com.sweet.modular.user.entity.User;
import com.sweet.modular.user.mapper.UserMapper;
import com.sweet.modular.user.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    private Page getPageContext() {
        return LayuiPageFactory.defaultPage();
    }
}
