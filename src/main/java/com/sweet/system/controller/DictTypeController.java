package com.sweet.system.controller;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.model.ResultBean;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.system.entity.DictType;import com.sweet.system.service.DictTypeService;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.ResponseBody;/** * <p> * 字典类型表 前端控制器 * </p> * * @author admin * @since 2019-12-16 */@Controller@RequestMapping("/admin/dict")public class DictTypeController {    @Autowired    DictTypeService dictTypeService;    /**     * 列表页     */    @RequestMapping("/dictType_list")    public String list(){        return "/system/dictType/dictType_list";    }    /**     * 编辑页     */    @RequestMapping("/dictType_edit")    public String edit(){        return "/system/dictType/dictType_edit";    }    /**     * 添加/编辑     */    @RequestMapping("/editDictType")    @ResponseBody    public ResultBean editDictType(DictType dictType){        dictTypeService.saveOrUpdate(dictType);        return ResultBean.success(dictType);    }    /**     * 删除     */    @RequestMapping("/delDictType")    @ResponseBody    public ResultBean delDictType(DictType dictType){        dictTypeService.removeById(dictType);        return ResultBean.success(dictType);    }    /**     * 添加修改菜单     * @param menu     * @return     */    @RequestMapping("/getDictTypeDetail")    @ResponseBody    public ResultBean getDictTypeDetail(String dictTypeId){        DictType dictType = dictTypeService.getById(dictTypeId);        return ResultBean.success(dictType);    }    /**     * 列表数据     */    @RequestMapping("/getDictTypeList")    @ResponseBody    public LayuiPageInfo getDictTypeList(DictType DictType){        LayuiPageInfo pageInfo = dictTypeService.findPageBySpec(DictType);        return pageInfo;    }}