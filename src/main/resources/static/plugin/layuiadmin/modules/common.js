/**

 @Name：layuiAdmin 公共业务
 @Author：贤心
 @Site：http://www.layui.com/admin/
 @License：LPPL
    
 */
 
layui.define(function(exports){
  var $ = layui.$
  ,layer = layui.layer
  ,laytpl = layui.laytpl
  ,setter = layui.setter
  ,view = layui.view
  ,admin = layui.admin
  
  //公共业务的逻辑处理可以写在此处，切换任何页面都会执行
  //……
  
  
  
  //退出
  admin.events.logout = function(){
    location.href = '/admin/logout';

    //执行退出接口
/*    admin.req({
      url: '/admin/logout'
      ,type: 'get'
      ,data: {}
      ,done: function(res){ //这里要说明一下：done 是只有 response 的 code 正常才会执行。而 succese 则是只要 http 为 200 就会执行

          location.href = 'user/login.html';
      }
    });*/
  };

  //刷新左侧菜单
  admin.events.refreshLeftMenu = function(data,defaultPage){
    var id = 'LAY-system-side-menu',
        getTpl = document.getElementById('leftMenuTpl').innerHTML
        ,view = document.getElementById(id);


    laytpl(getTpl).render(data,function(html){
      view.innerHTML = html;

      //默认打开的标签逻辑start，如不需要可整段删除
      var defaultElem = defaultPage ? $('#'+id+' a[lay-href="'+defaultPage+'"]') : {};
      if (defaultElem.length) {
        for (var i = 1; i < defaultElem.parent().attr('myDir'); i++) {
          defaultElem.parents('[myDir="'+i+'"]').addClass('layui-nav-itemed');
        }
        defaultElem.trigger('click');
      }
      //默认打开的标签逻辑end

      layui.element.render();
    });
  }
  
  //对外暴露的接口
  exports('common', {});
});