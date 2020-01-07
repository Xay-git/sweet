 package com.sweet.core.model.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.core.util.HttpContext;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * Layui Table默认的分页参数创建
 *
 * @author fengshuonan
 * @date 2017-04-05 22:25
 */
public class LayuiPageFactory {

    /**
     * 获取layui table的分页参数
     *
     * @author fengshuonan
     * @Date 2019/1/25 22:13
     */
    public static Page defaultPage() {
        HttpServletRequest request = HttpContext.getRequest();
      //第几页
        int page;
        String pg = request.getParameter("page");
        if(StringUtils.isEmpty(pg)){
            page = 1;
        }else{
            page= Integer.valueOf(pg);

        }
       //每页显示多少条数据
        int limit;
        String lim  = request.getParameter("limit");
        if(StringUtils.isEmpty(lim)){
            limit = 99999;
        }else{
            limit = Integer.valueOf(lim);
        }

        return new Page(page, limit);
    }

    /**
     * 创建layui能识别的分页响应参数
     *
     * @author fengshuonan
     * @Date 2019/1/25 22:14
     */
    public static LayuiPageInfo createPageInfo(IPage page) {
        LayuiPageInfo result = new LayuiPageInfo();
        result.setCount(page.getTotal());
        result.setData(page.getRecords());
        return result;
    }
}
