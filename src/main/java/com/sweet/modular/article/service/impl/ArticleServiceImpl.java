package com.sweet.modular.article.service.impl;import com.sweet.modular.article.entity.Article;import com.sweet.modular.article.mapper.ArticleMapper;import com.sweet.modular.article.service.ArticleService;import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;import org.springframework.stereotype.Service;import com.baomidou.mybatisplus.core.metadata.IPage;import com.baomidou.mybatisplus.extension.plugins.pagination.Page;import com.sweet.core.model.system.LayuiPageFactory;import com.sweet.core.model.system.LayuiPageInfo;/** * <p> * 文章 服务实现类 * </p> * * @author admin * @since 2020-01-14 */@Servicepublic class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {    @Override    public LayuiPageInfo findPageBySpec(Article article) {        Page pageContext = LayuiPageFactory.defaultPage();        IPage page = this.baseMapper.customPageList(pageContext, article);        return LayuiPageFactory.createPageInfo(page);    }}