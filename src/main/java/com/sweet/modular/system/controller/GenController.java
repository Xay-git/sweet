package com.sweet.modular.system.controller;import cn.hutool.json.JSONArray;import cn.hutool.json.JSONUtil;import com.baomidou.mybatisplus.annotation.DbType;import com.baomidou.mybatisplus.core.toolkit.StringPool;import com.baomidou.mybatisplus.extension.plugins.pagination.Page;import com.baomidou.mybatisplus.generator.AutoGenerator;import com.baomidou.mybatisplus.generator.InjectionConfig;import com.baomidou.mybatisplus.generator.config.*;import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;import com.baomidou.mybatisplus.generator.config.po.TableInfo;import com.baomidou.mybatisplus.generator.config.rules.FileType;import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;import com.baomidou.mybatisplus.generator.engine.BeetlTemplateEngine;import com.sweet.core.model.ResultBean;import com.sweet.core.model.system.DatabaseInfo;import com.sweet.core.model.system.LayuiForm;import com.sweet.core.model.system.LayuiPageFactory;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.core.util.DbUtil;import com.sweet.core.util.RedisUtil;import com.sweet.core.util.StringUtil;import com.sweet.modular.system.BeetlEngine;import com.sweet.modular.system.model.LayFromDto;import org.beetl.core.GroupTemplate;import org.beetl.core.Template;import org.beetl.core.resource.ClasspathResourceLoader;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.RequestParam;import org.springframework.web.bind.annotation.ResponseBody;import javax.servlet.http.HttpServletRequest;import java.io.File;import java.io.IOException;import java.util.*;@Controller@RequestMapping("/admin/gen")public class GenController {    @Autowired    DatabaseInfo databaseInfo;    public static String CONDITION_FIELDS = "CONDITION_FIELDS";    @Autowired    RedisUtil redisUtil;    @RequestMapping("")    public String gen(){      return "/admin/gen/gen";    }    @RequestMapping("/tableList")    @ResponseBody    public LayuiPageInfo tableList(){        List<Map<String, Object>> maps = DbUtil.selectTables(databaseInfo);        Page<Map<String, Object>> objectPage = new Page<>();        objectPage.setRecords(maps);        return LayuiPageFactory.createPageInfo(objectPage);    }    @RequestMapping("/tableFields")    public String tableFields(){        return "/admin/gen/tableFields";    }    /**     * 获取表的字段列表     *     * @author fengshuonan     * @Date 2019/1/30 2:49 PM     */    @RequestMapping("/getTableFields")    @ResponseBody    public LayuiPageInfo getTableFields(String tableName) {        //获取对应表的所有字段        List<Map<String, Object>> tableFields = DbUtil.getTableFields(databaseInfo, tableName);        Page<Map<String, Object>> objectPage = new Page<>();        objectPage.setRecords(tableFields);        return LayuiPageFactory.createPageInfo(objectPage);    }    @RequestMapping("/setConditionFields")    @ResponseBody    public ResultBean setTableFields(String tableName, LayFromDto layFromDto,String searchFields) {        //设置redis缓存条件字段        String[] fieldArray = searchFields.split(",");        Map<String, String[]> fieldMap =  new HashMap<>();        fieldMap.put(tableName,fieldArray);        redisUtil.set(CONDITION_FIELDS,fieldMap);        List<LayuiForm> list = layFromDto.getLayuiForm();        for(LayuiForm LayuiForm:list){            //字符串转驼峰            String columnName = StringUtil.underlineToCamel(LayuiForm.getColumnName());            if(columnName.equals("createTime")){                continue;            }            LayuiForm.setColumnName(columnName);        }        redisUtil.set("fieldList", JSONUtil.toJsonStr(list));        return ResultBean.success();    }    @RequestMapping("/execute")    public void execute(String modularName,String tableName,String author,String removePrefix){        doExecute( modularName, tableName ,author,removePrefix);    }    private static GroupTemplate groupTemplate;    public void doExecute(String moduleName,String tableName,String author,String removePrefix){        // 代码生成器        AutoGenerator mpg = new AutoGenerator();        // 全局配置        GlobalConfig gc = new GlobalConfig();        String projectPath = System.getProperty("user.dir");        gc.setOutputDir(projectPath + "/src/main/java");        gc.setAuthor(author);        gc.setOpen(false);        gc.setSwagger2(true); //实体属性 Swagger2 注解        gc.setBaseColumnList(true);        gc.setBaseResultMap(true);        gc.setServiceName("%sService");        gc.setFileOverride(true);//是否覆盖        gc.setActiveRecord(true);        mpg.setGlobalConfig(gc);        // 数据源配置        DataSourceConfig dsc = new DataSourceConfig();        dsc.setDbType(DbType.MYSQL);        dsc.setTypeConvert(new MySqlTypeConvert() {        });        dsc.setUrl(databaseInfo.getUrl());        dsc.setDriverName(databaseInfo.getDriverClassName());        dsc.setUsername(databaseInfo.getUsername());        dsc.setPassword(databaseInfo.getPassword());        mpg.setDataSource(dsc);        // 包配置        PackageConfig pc = new PackageConfig();        pc.setModuleName(moduleName);        pc.setParent("com.sweet.modular");        mpg.setPackageInfo(pc);        // 自定义配置        InjectionConfig cfg = new InjectionConfig() {            @Override            public void initMap() {                Map<String, Object> map = new HashMap<String, Object>();                map.put(CONDITION_FIELDS,redisUtil.get(CONDITION_FIELDS));                JSONArray array = JSONUtil.parseArray(redisUtil.get("fieldList"));                map.put("begin","<% layout(\"/common/_container.html\"){ %>");                map.put("end","<% } %>");                map.put("fieldList",JSONUtil.toList(array,LayuiForm.class));                this.setMap(map);            }        };        // 自定义输出配置        List<FileOutConfig> focList = new ArrayList<>();        String listTemp = "/templates/list.html.btl";        focList.add(new FileOutConfig(listTemp) {            @Override            public String outputFile(TableInfo tableInfo) {                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！                return projectPath + "/src/main/resources/pages/modular/" + pc.getModuleName()                        + "/" + tableInfo.getEntityName().toLowerCase()  + "_list.html";            }        });        String editTemp = "/templates/edit.html.btl";        focList.add(new FileOutConfig(editTemp) {            @Override            public String outputFile(TableInfo tableInfo) {                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！                return projectPath + "/src/main/resources/pages/modular/" + pc.getModuleName()                        + "/" + tableInfo.getEntityName().toLowerCase()  + "_edit.html";            }        });        cfg.setFileCreate(new IFileCreate() {            @Override            public boolean isCreate(ConfigBuilder configBuilder, FileType fileType, String filePath) {                // 判断自定义文件夹是否需要创建,这里调用默认的方法                checkDir(filePath);                //对于已存在的文件，只需重复生成 entity 和 mapper.xml                File file = new File(filePath);                boolean exist = file.exists();                if(exist){                    if (filePath.endsWith("Mapper.xml")||FileType.ENTITY==fileType||FileType.OTHER==fileType){                        return true;                    }else {                        return false;                    }                }                //不存在的文件都需要创建                return  true;            }        });        cfg.setFileOutConfigList(focList);        mpg.setCfg(cfg);        // 配置模板        TemplateConfig templateConfig = new TemplateConfig();        // 配置自定义输出模板        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别        mpg.setTemplate(templateConfig);        // 策略配置        StrategyConfig strategy = new StrategyConfig();        strategy.setNaming(NamingStrategy.underline_to_camel);        strategy.setColumnNaming(NamingStrategy.underline_to_camel);//        strategy.setSuperEntityClass("com.sweet.modular.common.BaseEntity");        strategy.setEntityLombokModel(true);        strategy.setRestControllerStyle(false);//        strategy.setSuperControllerClass("com.sweet.modular.common.BaseController");        strategy.setInclude(tableName);        strategy.setSuperEntityColumns("id");        strategy.setControllerMappingHyphenStyle(true);        strategy.setTablePrefix(removePrefix);        mpg.setStrategy(strategy);        mpg.setTemplateEngine(new BeetlTemplateEngine());        mpg.execute();    }}