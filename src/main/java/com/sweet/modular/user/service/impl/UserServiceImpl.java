package com.sweet.modular.user.service.impl;

import com.sweet.modular.user.entity.User;
import com.sweet.modular.user.mapper.UserMapper;
import com.sweet.modular.user.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jobob
 * @since 2019-06-17
 */
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements  IUserService{

}
