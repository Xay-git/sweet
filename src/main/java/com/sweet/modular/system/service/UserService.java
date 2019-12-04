package com.sweet.modular.system.service;

import com.sweet.core.model.system.LayuiPageInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sweet.modular.system.entity.User;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wxl
 * @since 2019-06-20
 */
public interface UserService extends IService<User> {

    User findByUserName(String userName);

    LayuiPageInfo findPageBySpec(User user);

    User findUserById(String id);

    void setRoleAssign(String userId,String roleIds);

    List<String> getRole(String userId);

    Set<String> getUserRole(String userName);

    Set<String> getUserMenu(String userName);



}
