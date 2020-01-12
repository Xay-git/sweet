package com.sweet.modular.wxmenu.service.impl;import com.baomidou.mybatisplus.core.metadata.IPage;import com.baomidou.mybatisplus.extension.plugins.pagination.Page;import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;import com.sweet.core.model.system.LayuiPageFactory;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.core.util.RedisUtil;import com.sweet.modular.wxmenu.entity.Wxmenu;import com.sweet.modular.wxmenu.mapper.WxmenuMapper;import com.sweet.modular.wxmenu.service.WxmenuService;import com.sweet.wxmp.util.WxMpUtil;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.beans.factory.annotation.Value;import org.springframework.core.env.Environment;import org.springframework.stereotype.Service;import javax.annotation.PostConstruct;import java.util.ArrayList;import java.util.List;/** * <p> * 微信菜单 服务实现类 * </p> * * @author admin * @since 2020-01-08 */@Servicepublic class WxmenuServiceImpl extends ServiceImpl<WxmenuMapper, Wxmenu> implements WxmenuService {    @Autowired    RedisUtil redisUtil;    @Value("${system.domain}")    public String domain;    @Override    public LayuiPageInfo findPageBySpec(Wxmenu wxmenu) {        Page pageContext = LayuiPageFactory.defaultPage();        IPage page = this.baseMapper.customPageList(pageContext, wxmenu);        return LayuiPageFactory.createPageInfo(page);    }    @Override    public List<Wxmenu> getMenuByAppId(String appId) {        List<Wxmenu> temp = baseMapper.getMenuByAppId(appId);        List<Wxmenu> list = new ArrayList<>();        temp.stream().forEach(wxmenu -> {            if (wxmenu.getTier()==1){                list.add(wxmenu);            }        });        list.stream().forEach(wxmenu -> {            temp.stream().forEach(wxmenu1 -> {                if(wxmenu1.getTier()==2){                    if(wxmenu1.getParentId().indexOf(wxmenu.getButtonId())>-1){                        if(wxmenu.getSub_button()==null){                            wxmenu.setSub_button(new ArrayList<>());                        }                        wxmenu.getSub_button().add(wxmenu1);                    }                }            });        });        return list;    }    @Override    public int delButtonsById(String buttonId) {        return baseMapper.delButtonsById(buttonId);    }    @Override    public void saveButton(List<Wxmenu> wxmenuList) {        wxmenuList.stream().forEach(button -> {            saveButtonData(button);            if(button.getSub_button()!=null){                button.getSub_button().stream().forEach(sub->{                    saveButtonData(sub);                });            }        });    }    public void saveButtonData(Wxmenu button){        //缓存自定义文字        if(button.getType().equals("text")){            redisUtil.set("text:"+button.getButtonId(),button.getContent());        }        updateById(button);        //如果是跳转页面        if(button.getType().equals("view")){            String url = button.getUrl();            //如果需要跳转的是业务域名            if(url.startsWith(domain)){                url = WxMpUtil.buildWxUrl(url);                button.setUrl(url);            }        }    }}