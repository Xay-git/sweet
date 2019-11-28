package com.sweet.modular.dept.mapper;import com.baomidou.mybatisplus.extension.plugins.pagination.Page;import com.sweet.core.model.system.layTree;import com.sweet.modular.dept.entity.Dept;import com.baomidou.mybatisplus.core.mapper.BaseMapper;import org.apache.ibatis.annotations.Param;import org.apache.ibatis.annotations.Select;import java.util.ArrayList;/** * <p> * 部门表 Mapper 接口 * </p> * * @author wxl * @since 2019-11-28 */public interface DeptMapper extends BaseMapper<Dept> {    @Select("select DEPT_ID id,DEPT_NAME title,PARENT_ID pid from t_dept order by ORDER_NUM asc")    public ArrayList<layTree> deptTree();    Page<Dept> customPageList(Page page, @Param("param") Dept dept);}