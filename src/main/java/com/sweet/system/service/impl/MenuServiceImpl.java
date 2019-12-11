package com.sweet.system.service.impl;

import com.sweet.core.model.system.layTree;
import com.sweet.core.sweetConst;
import com.sweet.system.entity.Menu;
import com.sweet.system.mapper.MenuMapper;
import com.sweet.system.model.MenuResult;
import com.sweet.system.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;


/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author wxl
 * @since 2019-11-22
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {


    @Override
    public ArrayList<layTree> getMenuTree() {
        ArrayList<layTree> trees = baseMapper.getMenuList();
        ArrayList<layTree> cloneTree = (ArrayList<layTree>) trees.clone();
        ArrayList<layTree> newtrees = new ArrayList<layTree>();

        //创建父级节点
        newtrees.add(new layTree().createParent());

        if(cloneTree.size()>0){
            newtrees = coverLayuiTree(newtrees,cloneTree);
        }

        return newtrees;
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
                    if(temp.getPid().equals("0")){
                        temp.setSpread(true);
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
    @Override
    public ArrayList<MenuResult> getMenuTableTree() {
        ArrayList<MenuResult> trees = (ArrayList<MenuResult>) baseMapper.getMenuTree();
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
        return newtrees;
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

    @Override
    public Menu addMenu(String menuId) {
        Menu menu = new Menu();
        menu.setMenuName("未命名");
        menu.setParentId(menuId);
        menu.setType(sweetConst.MENU);
        this.save(menu);
        return menu;
    }

    @Override
    public ArrayList<layTree> getParentMenu() {
        return baseMapper.getParentMenu();
    }

    @Override
    @Transactional
    public void deleteMenu(Menu menu) {
         baseMapper.delRoleMenuByMenuId(menu.getMenuId());
         removeById(menu);
    }

    @Override
    public Integer getMenuChildrenCount(String menuId) {
        return baseMapper.getMenuChildrenCount(menuId);
    }
}
