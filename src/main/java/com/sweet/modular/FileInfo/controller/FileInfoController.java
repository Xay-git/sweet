package com.sweet.modular.FileInfo.controller;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.stereotype.Controller;/** * <p> * 文件信息表 前端控制器 * </p> * * @author wxl * @since 2019-12-06 */@Controller@RequestMapping("/admin/file")public class FileInfoController {    @RequestMapping("")    public String file(){        return "/admin/file/file";    }}