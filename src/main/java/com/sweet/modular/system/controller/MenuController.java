package com.sweet.modular.system.controller;


import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.layTree;
import com.sweet.core.util.StringUtil;
import com.sweet.modular.system.entity.Menu;
import com.sweet.modular.system.model.MenuResult;
import com.sweet.modular.system.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

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
        return "/admin/menu/menu";
    }

    @RequestMapping("/menu_add")
    public String menu_add(){
        return "/admin/menu/menu_add";
    }

    @RequestMapping("/menu_edit")
    public String menu_edit(String menuId){
        return "/admin/menu/menu_edit";
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
     * 获得菜单树
     * @return
     */
    @RequestMapping("/tableTree")
    @ResponseBody
    public ResultBean tableTree(){
        ArrayList<MenuResult> trees = (ArrayList<MenuResult>) menuService.getMenuTree();
        ArrayList<MenuResult> cloneTree = (ArrayList<MenuResult>) trees.clone();
        ArrayList<MenuResult> newtrees = new ArrayList<MenuResult>();

        if(trees.size()>0){
            for (int i= 0;i<trees.size();i++){
                MenuResult menu = trees.get(i);
                if(menu.getParentId().equals("0")){
                    newtrees.add(menu);
                    cloneTree.remove(menu);
                }
            }
            if(cloneTree.size()>0){
                newtrees = coverMenu(newtrees,cloneTree);
            }
        }
        return ResultBean.success(newtrees);
    }

    public  ArrayList<MenuResult> coverMenu(ArrayList<MenuResult> trees, ArrayList<MenuResult> tempTrees){
        if(trees.size()==0)return trees;
        if(tempTrees.size()==0)return tempTrees;
        ArrayList<MenuResult> layTrees = new ArrayList<MenuResult>();
        ArrayList<MenuResult> tempLayTrees = (ArrayList<MenuResult>) tempTrees.clone();
        for(MenuResult node:trees){
            for(MenuResult temp:tempTrees){
                if(temp.getParentId().equals(node.getMenuId())){
                    if(node.getChildren()==null){
                        node.setChildren(new ArrayList<MenuResult>());
                    }
                    node.getChildren().add(temp);
                    layTrees.add(temp);
                    tempLayTrees.remove(temp);
                }
            }
        }
        coverMenu(layTrees,tempLayTrees);
        return trees;
    }

}
