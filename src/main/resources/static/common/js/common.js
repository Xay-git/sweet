/** EasyWeb iframe v3.1.5 date:2019-10-05 License By http://easyweb.vip */// 以下代码是配置layui扩展模块的目录，每个页面都需要引入layui.config({    version: '315',    base: '/plugin/module/'}).extend({    formSelects: 'formSelects/formSelects-v4',    dropdown: 'dropdown/dropdown',    notice: 'notice/notice',    step: 'step-lay/step',    dtree: 'dtree/dtree',    citypicker: 'city-picker/city-picker',    tableSelect: 'tableSelect/tableSelect',    Cropper: 'Cropper/Cropper',    zTree: 'zTree/zTree',    introJs: 'introJs/introJs',    fileChoose: 'fileChoose/fileChoose',    tagsInput: 'tagsInput/tagsInput',    Drag: 'Drag/Drag',    CKEDITOR: 'ckeditor/ckeditor',    Split: 'Split/Split',    cascader: 'cascader/cascader',    treeTable: 'treeTable/treeTable',    xmSelect : 'xm-select'}).use(['layer', 'admin'], function () {    var $ = layui.jquery;    var layer = layui.layer;    var admin = layui.admin;    // 移除loading动画    setTimeout(function () {        admin.removeLoading();    }, window == top ? 600 : 100);});var app = {    isEmpty: function (obj) {        if (typeof obj == "undefined" || obj == null || obj == "" || obj == undefined) {            return true;        } else {            return false;        }    },    confirm:function (tip, ensure) {        top.layer.confirm(tip, {            skin: 'layui-layer-admin'        }, function () {            ensure();        });    }}