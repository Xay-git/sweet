package com.sweet.system.service;import com.sweet.system.entity.Dict;import com.baomidou.mybatisplus.extension.service.IService;import com.sweet.core.model.system.LayuiPageInfo;/** * <p> * 基础字典 服务类 * </p> * * @author admin * @since 2019-12-16 */public interface DictService extends IService<Dict> {    public LayuiPageInfo findPageBySpec(Dict dict);}