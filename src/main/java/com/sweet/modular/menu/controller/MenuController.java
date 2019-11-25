package com.sweet.modular.menu.controller;


import com.sweet.core.exception.ServiceException;
import com.sweet.core.exception.UserNotExistException;
import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.layTree;
import com.sweet.modular.menu.entity.Menu;
import com.sweet.modular.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.rmi.ServerException;
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
        return "/admin/menu/menu";
    }

    @RequestMapping("/addMenu")
    @ResponseBody
    public ResultBean addMenu(String menuId){
        Menu menu = menuService.addMenu(menuId);
        return ResultBean.success(menu);
    }

    @RequestMapping("/tree")
    @ResponseBody
    public ResultBean tree(){
        ArrayList<layTree> trees = menuService.getParentMenu();
        ArrayList<layTree> cloneTree = (ArrayList<layTree>) trees.clone();
        ArrayList<layTree> newtrees = new ArrayList<layTree>();

        //创建父级节点
        newtrees.add(new layTree().createParent());

        if(cloneTree.size()>0){
            newtrees = coverLayuiTree(newtrees,cloneTree);
        }

        return ResultBean.success(newtrees);
    }


    public  ArrayList<layTree> coverLayuiTree(ArrayList<layTree> trees, ArrayList<layTree> tempTrees){
        if(trees.size()==0)return trees;
        if(tempTrees.size()==0)return tempTrees;
        ArrayList<layTree> layTrees = new ArrayList<layTree>();
        ArrayList<layTree> tempLayTrees = (ArrayList<layTree>) tempTrees.clone();
        for(layTree node:trees){
            for(layTree temp:tempTrees){
                if(temp.getPid().equals(node.getId())){
                   if(node.getChildren()==null){
                       node.setChildren(new ArrayList<layTree>());
                   }
                    node.getChildren().add(temp);
                    layTrees.add(temp);
                    tempLayTrees.remove(temp);
                }
            }
        }

        coverLayuiTree(layTrees,tempLayTrees);
        return trees;
    }

}