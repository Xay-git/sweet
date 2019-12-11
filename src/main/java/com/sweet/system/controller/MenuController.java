package com.sweet.system.controller;


import com.sweet.core.exception.ServiceException;
import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.layTree;
import com.sweet.system.entity.Menu;
import com.sweet.system.model.MenuResult;
import com.sweet.system.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author wxl
 * @since 2019-11-22
 */
@Controller
@RequestMapping("/admin/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("")
    public String menu(){
        return "/system/menu/menu";
    }

    @RequestMapping("/menu_edit")
    public String menu_edit(String menuId){
        return "/system/menu/menu_edit";
    }

    /**
     * 获得顶级菜单列表
     * @return
     */
    @RequestMapping("/menulist")
    @ResponseBody
    public ResultBean menulist(){
        ArrayList<layTree> list = menuService.getParentMenu();
        return ResultBean.success(list);
    }

    /**
     * 添加修改菜单
      * @param menu
     * @return
     */
    @RequestMapping("/editMenu")
    @ResponseBody
    public ResultBean editMenu(Menu menu){
        menuService.saveOrUpdate(menu);
        return ResultBean.success(menu);
    }
    /**
     * 删除菜单
     * @param menu
     * @return
     */
    @RequestMapping("/delMenu")
    @ResponseBody
    @Transactional
    public ResultBean delMenu(Menu menu){
        Integer i = menuService.getMenuChildrenCount(menu.getMenuId());
        if(i>0){
            throw new ServiceException(500,"该菜单下级有子节点，请删除后重试！");
        }else{
            menuService.deleteMenu(menu);
        }
        return ResultBean.success(menu);
    }

    /**
     * 获得菜单详情
     * @param menu
     * @return
     */
    @RequestMapping("/getMenuDetail")
    @ResponseBody
    public ResultBean getMenu(String menuId){
        Menu menu = menuService.getById(menuId);
        return ResultBean.success(menu);
    }

    /**
     * 获得菜单表格树 配置权限
     * @return
     */
    @RequestMapping("/tableTree")
    @ResponseBody
    public ResultBean tableTree(){
        List<MenuResult> trees = menuService.getMenuTableTree();
        return ResultBean.success(trees);
    }

    /**
     * 获得菜单树 配置权限
     * @return
     */
    @RequestMapping("/tree")
    @ResponseBody
    public ResultBean tree(){
        List<layTree> trees = menuService.getMenuTree();
        return ResultBean.success(trees);
    }

}
