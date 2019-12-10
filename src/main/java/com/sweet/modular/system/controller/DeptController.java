package com.sweet.modular.system.controller;import com.sweet.core.exception.ServiceException;import com.sweet.core.model.ResultBean;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.core.model.system.layTree;import com.sweet.modular.system.service.BaseService;import com.sweet.modular.system.entity.Dept;import com.sweet.modular.system.service.DeptService;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.ResponseBody;import java.util.ArrayList;/** * <p> * 部门表 前端控制器 * </p> * * @author wxl * @since 2019-11-28 */@Controller@RequestMapping("/admin/dept")public class DeptController {    @Autowired    private BaseService baseService;    @Autowired    private DeptService deptService;    @RequestMapping("")    public String dept(){        return "/admin/dept/dept";    }    @RequestMapping("/dept_edit")    public String dept_edit(){        return "/admin/dept/dept_edit";    }    /**     * 添加机构节点     * @param deptId     * @return     */    @RequestMapping("/addDeptNode")    @ResponseBody    public ResultBean addDeptNode(String deptId){        Dept dept = deptService.addDept(deptId);        return ResultBean.success(dept);    }    /**     * 获得机构详情     * @param deptId     * @return     */    @RequestMapping("/getDeptDetail")    @ResponseBody    public ResultBean getDeptDetail(String deptId){        Dept dept = deptService.getById(deptId);        return ResultBean.success(dept);    }    /**     * 修改机构     * @param deptId     * @return     */    @RequestMapping("/editDept")    @ResponseBody    public ResultBean editDept(Dept dept){        deptService.updateById(dept);        return ResultBean.success(dept);    }    @RequestMapping("/delDept")    @ResponseBody    public ResultBean delDept(Dept dept){        Integer i = deptService.getDeptUserCount(dept.getDeptId());        if(i>0){            throw new ServiceException(500,"该机构下有"+i+"名用户，无法删除！");        }        deptService.removeById(dept);        return ResultBean.success(dept);    }    /**     * 获得     * @param deptId     * @return     */    @RequestMapping("/list")    @ResponseBody    public ResultBean list(){        return ResultBean.success(deptService.list());    }    /**     * 获得机构分页数据     * @param deptId     * @return     */    @RequestMapping("/getDeptList")    @ResponseBody    public LayuiPageInfo getDeptList(Dept dept){        LayuiPageInfo layuiPageInfo = deptService.findPageBySpec(dept);        return layuiPageInfo;    }    @RequestMapping("/tree")    @ResponseBody    public ResultBean tree(){        ArrayList<layTree> trees = deptService.deptTree();        ArrayList<layTree> cloneTree = (ArrayList<layTree>) trees.clone();        ArrayList<layTree> newtrees = new ArrayList<layTree>();        //创建父级节点        newtrees.add(new layTree().createParent());        if(cloneTree.size()>0){            newtrees = baseService.coverLayuiTree(newtrees,cloneTree);        }        return ResultBean.success(newtrees);    }}