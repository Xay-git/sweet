package com.sweet.modular.blog.controller;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.RequestMapping;@Controller@RequestMapping("/blog")public class BlogController {    @RequestMapping("")    public String index(){        return "/modular/blog/index";    }    @RequestMapping("/detail")    public String detail(){        return "/modular/blog/detail";    }}