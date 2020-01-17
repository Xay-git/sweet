package com.sweet.modular.article.controller;import com.sweet.core.translationDict.DictParam;import com.sweet.core.translationDict.TranslationDict;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.model.ResultBean;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.modular.article.entity.Article;import com.sweet.modular.article.service.ArticleService;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.util.StringUtil;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.stereotype.Controller;/** * <p> * 文章 前端控制器 * </p> * * @author admin * @since 2020-01-14 */@Controller@RequestMapping("/admin/article")public class ArticleController {    @Autowired    ArticleService articleService;    /**     * 列表页     */    @RequestMapping("/article_list")    public String list(){        return "/modular/article/article_list";    }    /**     * 编辑页     */    @RequestMapping("/article_edit")    public String edit(){        return "/modular/article/article_edit";    }    /**     * 添加/编辑     */    @RequestMapping("/editArticle")    @ResponseBody    public ResultBean editArticle(Article article){        articleService.saveOrUpdate(article);        return ResultBean.success(article);    }    /**     * 删除     */    @RequestMapping("/delArticle")    @ResponseBody    public ResultBean delArticle(Article article){        articleService.removeById(article);        return ResultBean.success(article);    }    /**     * 添加修改菜单     * @param menu     * @return     */    @RequestMapping("/getArticleDetail")    @ResponseBody    @TranslationDict({            @DictParam(dictType = "100edb6ca33a00a5bf28d6592738523c",dictValueFiled = "articleType"),    })    public ResultBean getArticleDetail(String articleId){        Article article = articleService.getById(articleId);        return ResultBean.success(article);    }    /**     * 列表数据     */    @RequestMapping("/getArticleList")    @ResponseBody    public LayuiPageInfo getArticleList(Article Article){        LayuiPageInfo pageInfo = articleService.findPageBySpec(Article);        return pageInfo;    }}