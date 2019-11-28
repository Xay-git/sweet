package com.sweet.modular.user.service;

import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.dept.entity.Dept;
import com.sweet.modular.user.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

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

    public LayuiPageInfo findPageBySpec(User user);


}
