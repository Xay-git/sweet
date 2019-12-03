package com.sweet.modular.base;import com.sweet.core.model.system.layTree;import org.springframework.stereotype.Service;import java.util.ArrayList;@Servicepublic class BaseServiceImpl implements BaseService {    @Override    public  ArrayList<layTree> coverLayuiTree(ArrayList<layTree> trees, ArrayList<layTree> tempTrees){        if(trees.size()==0)return trees;        if(tempTrees.size()==0)return tempTrees;        ArrayList<layTree> layTrees = new ArrayList<layTree>();        ArrayList<layTree> tempLayTrees = (ArrayList<layTree>) tempTrees.clone();        for(layTree node:trees){            for(layTree temp:tempTrees){                if(temp.getPid().equals(node.getId())){                    if(node.getChildren()==null){                        node.setChildren(new ArrayList<layTree>());                    }                    if(temp.getPid().equals("0")){                        temp.setSpread(true);                    }                    node.getChildren().add(temp);                    layTrees.add(temp);                    tempLayTrees.remove(temp);                }            }        }        coverLayuiTree(layTrees,tempLayTrees);        return trees;    }}