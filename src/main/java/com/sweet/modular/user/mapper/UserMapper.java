package com.sweet.modular.user.mapper;import com.sweet.modular.user.entity.User;import com.baomidou.mybatisplus.core.mapper.BaseMapper;import java.util.List;import java.util.Map;/** * <p> *  Mapper 接口 * </p> * * @author wxl * @since 2019-06-18 */public interface UserMapper extends BaseMapper<User> {    List<User> getUserList();}