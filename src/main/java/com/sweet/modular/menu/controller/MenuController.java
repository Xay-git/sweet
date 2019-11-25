package com.sweet.modular.menu.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author wxl
 * @since 2019-11-22
 */
@Controller
@RequestMapping("/admin")
public class MenuController {

    @RequestMapping("/menu")
    public String menu(){
        return "/admin/menu/menu";
    }

}
