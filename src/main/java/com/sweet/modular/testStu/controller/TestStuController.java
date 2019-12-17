package com.sweet.modular.testStu.controller;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.model.ResultBean;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.modular.testStu.entity.TestStu;import com.sweet.modular.testStu.service.TestStuService;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.util.StringUtil;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.stereotype.Controller;/** * <p> * 用户表 前端控制器 * </p> * * @author admin * @since 2019-12-17 */@Controller@RequestMapping("/testStu")public class TestStuController {    @Autowired    TestStuService testStuService;    /**     * 列表页     */    @RequestMapping("/testStu_list")    public String list(){        return "/modular/testStu/testStu_list";    }    /**     * 编辑页     */    @RequestMapping("/testStu_edit")    public String edit(){        return "/modular/testStu/testStu_edit";    }    /**     * 添加/编辑     */    @RequestMapping("/editTestStu")    @ResponseBody    public ResultBean editTestStu(TestStu testStu){        testStuService.saveOrUpdate(testStu);        return ResultBean.success(testStu);    }    /**     * 删除     */    @RequestMapping("/delTestStu")    @ResponseBody    public ResultBean delTestStu(TestStu testStu){        testStuService.removeById(testStu);        return ResultBean.success(testStu);    }    /**     * 添加修改菜单     * @param menu     * @return     */    @RequestMapping("/getTestStuDetail")    @ResponseBody    public ResultBean getTestStuDetail(String userId){        TestStu testStu = testStuService.getById(userId);        return ResultBean.success(testStu);    }    /**     * 列表数据     */    @RequestMapping("/getTestStuList")    @ResponseBody    public LayuiPageInfo getTestStuList(TestStu TestStu){        LayuiPageInfo pageInfo = testStuService.findPageBySpec(TestStu);        return pageInfo;    }}