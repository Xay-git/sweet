/** EasyWeb iframe v3.1.5 date:2019-10-05 License By http://easyweb.vip */// 以下代码是配置layui扩展模块的目录，每个页面都需要引入layui.config({    base: '/plugin/module/'}).extend({    formSelects: 'formSelects/formSelects-v4',    dropdown: 'dropdown/dropdown',    notice: 'notice/notice',    step: 'step-lay/step',    dtree: 'dtree/dtree',    citypicker: 'city-picker/city-picker',    tableSelect: 'tableSelect/tableSelect',    Cropper: 'Cropper/Cropper',    zTree: 'zTree/zTree',    introJs: 'introJs/introJs',    fileChoose: 'fileChoose/fileChoose',    tagsInput: 'tagsInput/tagsInput',    Drag: 'Drag/Drag',    CKEDITOR: 'ckeditor/ckeditor',    Split: 'Split/Split',    cascader: 'cascader/cascader',    treeTable: 'treeTable/treeTable',    xmSelect : 'xm-select'}).use(['layer', 'admin'], function () {    var $ = layui.jquery;    var layer = layui.layer;    var admin = layui.admin;    // 移除loading动画    setTimeout(function () {        admin.removeLoading();    }, window == top ? 600 : 100);    //单击行勾选checkbox事件    $(document).on("click",".layui-table-body table.layui-table tbody tr", function () {        var index = $(this).attr('data-index');        var tableBox = $(this).parents('.layui-table-box');        //存在固定列        if (tableBox.find(".layui-table-fixed.layui-table-fixed-l").length>0) {            tableDiv = tableBox.find(".layui-table-fixed.layui-table-fixed-l");        } else {            tableDiv = tableBox.find(".layui-table-body.layui-table-main");        }        var checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox I");        if (checkCell.length>0) {            checkCell.click();        }    });    $(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox", function (e) {        e.stopPropagation();    });    //单击行勾选radio事件    $(document).on("click",".layui-table-body table.layui-table tbody tr", function () {        var index = $(this).attr('data-index');        var tableBox = $(this).parents('.layui-table-box'); //存在固定列        if (tableBox.find(".layui-table-fixed.layui-table-fixed-l").length>0) {            tableDiv = tableBox.find(".layui-table-fixed.layui-table-fixed-l");        } else {            tableDiv = tableBox.find(".layui-table-body.layui-table-main"); }        var checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-radio div.layui-form-radio I");        if (checkCell.length>0) {            checkCell.click();        } });    $(document).on("click", "td div.laytable-cell-radio div.layui-form-radio", function (e) {        e.stopPropagation();    });});var app = {    isEmpty: function (obj) {        if (typeof obj == "undefined" || obj == null || obj == "" || obj == undefined || obj == " ") {            return true;        } else {            return false;        }    },    isNotEmpty: function (obj) {        if (typeof obj == "undefined" || obj == null || obj == "" || obj == undefined || obj == " ") {            return false;        } else {            return true;        }    },    confirm:function (tip, ensure) {        top.layer.confirm(tip, {            skin: 'layui-layer-admin',            title: "提示"        }, function (layerIndex) {            ensure(layerIndex);        });    },    success:function (info) {        top.layer.msg(info, {icon: 1,  time: 1200});    },    getUrlParam:function (name) {        //  获取地址栏的参数        var url = window.location.search;        //正则表达式筛选        var reg = new RegExp("(^|&)"+name+"=([^&]*)(&|$)");        //匹配参数        var result = url.substr(1).match(reg);        return result ? decodeURIComponent(result[2]):null;    },    closeTopLayer:function(index){        top.layer.close(index)    },    deleteImg:function (index,imageList) {        app.confirm("确定删除该图片吗?",function (layerIndex) {            imageList.splice(index,1)            app.closeTopLayer(layerIndex);        })    }}