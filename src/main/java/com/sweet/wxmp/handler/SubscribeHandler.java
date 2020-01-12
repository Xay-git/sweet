package com.sweet.wxmp.handler;

import com.sweet.wxmp.builder.TextBuilder;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author Binary Wang(https://github.com/binarywang)
 */
@Component
public class SubscribeHandler extends AbstractHandler {

    @Value("${system.domain}")
    public String domain;

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage,
                                    Map<String, Object> context, WxMpService weixinService,
                                    WxSessionManager sessionManager) throws WxErrorException {

        String url = domain+"/weixin";
        String DEFAULE_TEXT = "欢迎关注！<a href='"+url+"'>点此绑定</a>\uD83D\uDC4D";

        return new TextBuilder().build(DEFAULE_TEXT, wxMessage, weixinService);
    }


}
