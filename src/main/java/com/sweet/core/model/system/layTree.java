package com.sweet.core.model.system;import lombok.Data;import lombok.experimental.Accessors;import java.util.ArrayList;@Data@Accessors(chain = true)public class layTree {    private String id;    private String pid;    private String title;    private  boolean spread = false;    private ArrayList<layTree> children;    /**     * 创建layTree的父级节点     *     * @author fengshuonan     * @Date 2018/12/23 4:51 PM     */    public layTree createParent() {        layTree tree = new layTree();        tree.setId("0");        tree.setTitle("顶级");        tree.setSpread(true);        return tree;    }}