package com.sweet.modular.wxmenu.service.impl;import com.sweet.modular.wxmenu.entity.Wxmenu;import com.sweet.modular.wxmenu.mapper.WxmenuMapper;import com.sweet.modular.wxmenu.service.WxmenuService;import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;import org.springframework.stereotype.Service;import com.baomidou.mybatisplus.core.metadata.IPage;import com.baomidou.mybatisplus.extension.plugins.pagination.Page;import com.sweet.core.model.system.LayuiPageFactory;import com.sweet.core.model.system.LayuiPageInfo;import java.util.ArrayList;import java.util.List;/** * <p> * 微信菜单 服务实现类 * </p> * * @author admin * @since 2020-01-08 */@Servicepublic class WxmenuServiceImpl extends ServiceImpl<WxmenuMapper, Wxmenu> implements WxmenuService {    @Override    public LayuiPageInfo findPageBySpec(Wxmenu wxmenu) {        Page pageContext = LayuiPageFactory.defaultPage();        IPage page = this.baseMapper.customPageList(pageContext, wxmenu);        return LayuiPageFactory.createPageInfo(page);    }    @Override    public List<Wxmenu> getMenuByAppId(String appId) {        List<Wxmenu> temp = baseMapper.getMenuByAppId(appId);        List<Wxmenu> list = new ArrayList<>();        temp.stream().forEach(wxmenu -> {            if (wxmenu.getTier()==1){                list.add(wxmenu);            }        });        list.stream().forEach(wxmenu -> {            temp.stream().forEach(wxmenu1 -> {                if(wxmenu1.getTier()==2){                    if(wxmenu1.getParentId().indexOf(wxmenu.getButtonId())>-1){                        if(wxmenu.getSub_button()==null){                            wxmenu.setSub_button(new ArrayList<>());                        }                        System.out.println(wxmenu1);                        wxmenu.getSub_button().add(wxmenu1);                    }                }            });        });        return list;    }    @Override    public int delButtonsById(String buttonId) {        return baseMapper.delButtonsById(buttonId);    }}