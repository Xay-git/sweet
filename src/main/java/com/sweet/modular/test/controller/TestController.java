package com.sweet.modular.test.controller;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.model.ResultBean;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.modular.test.entity.Test;import com.sweet.modular.test.service.TestService;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.stereotype.Controller;/** * <p> * 用户表 前端控制器 * </p> * * @author admin * @since 2019-12-11 */@Controller@RequestMapping("/test/test")public class TestController {    @Autowired    TestService testService;    /**     * 列表页     */    @RequestMapping("/test_list")    public String list(){        System.out.println("${package.Entity}.${entity}");        return "/modular/test/test_list";    }    /**     * 编辑页     */    @RequestMapping("/test_edit")    public String edit(){        return "/modular/test/test_edit";    }    /**     * 添加/编辑     */    @RequestMapping("/editTest")    @ResponseBody    public ResultBean editTest(Test test){        testService.saveOrUpdate(test);        return ResultBean.success(test);    }    /**     * 删除     */    @RequestMapping("/delTest")    @ResponseBody    public ResultBean delTest(Test test){        testService.removeById(test);        return ResultBean.success(test);    }    /**     * 添加修改菜单     * @param menu     * @return     */    @RequestMapping("/getTestDetail")    @ResponseBody    public ResultBean getTestDetail(String userId){        Test test = testService.getById(userId);        return ResultBean.success(test);    }    /**     * 列表数据     */    @RequestMapping("/getTestList")    @ResponseBody    public LayuiPageInfo getTestList(Test Test){        LayuiPageInfo pageInfo = testService.findPageBySpec(Test);        return pageInfo;    }}