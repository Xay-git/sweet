package com.sweet.system.service.impl;import com.sweet.core.util.RedisUtil;import com.sweet.system.entity.Dict;import com.sweet.system.mapper.DictMapper;import com.sweet.system.service.DictService;import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;import org.apache.ibatis.cache.CacheKey;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.cache.annotation.Cacheable;import org.springframework.stereotype.Service;import com.baomidou.mybatisplus.core.metadata.IPage;import com.baomidou.mybatisplus.extension.plugins.pagination.Page;import com.sweet.core.model.system.LayuiPageFactory;import com.sweet.core.model.system.LayuiPageInfo;import java.util.List;/** * <p> * 基础字典 服务实现类 * </p> * * @author admin * @since 2019-12-16 */@Servicepublic class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {    @Autowired    RedisUtil redisUtil;    @Override    public LayuiPageInfo findPageBySpec(Dict dict) {        Page pageContext = LayuiPageFactory.defaultPage();        IPage page = this.baseMapper.customPageList(pageContext, dict);        return LayuiPageFactory.createPageInfo(page);    }    @Override    public List<Dict> findByTypeId(String dictTypeId) {        List<Dict> list = (List<Dict>) redisUtil.get("dictTypeId:"+dictTypeId);        if(list==null){            list = baseMapper.findByTypeId(dictTypeId);            redisUtil.set("dictTypeId:"+dictTypeId,list);        }        return list;    }}