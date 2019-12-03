package com.sweet.modular.system.service;

import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.modular.system.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sweet.modular.system.entity.RoleMenu;
import com.sweet.modular.system.entity.User;
import com.sweet.modular.system.model.XmSelect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    Integer deleteRolesById(String roleId);

    List<String> getMenusByRoleId(String roleId);

    List<XmSelect> getXmSelect();





}
