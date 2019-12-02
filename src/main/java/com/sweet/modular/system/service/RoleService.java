package com.sweet.modular.system.service;

import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.system.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sweet.modular.system.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wxl
 * @since 2019-11-20
 */
public interface RoleService extends IService<Role> {

    LayuiPageInfo findPageBySpec(Role role);


}
