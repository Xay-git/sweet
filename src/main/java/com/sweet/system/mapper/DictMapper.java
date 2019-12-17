package com.sweet.system.mapper;import com.sweet.system.entity.Dict;import com.baomidou.mybatisplus.core.mapper.BaseMapper;import com.baomidou.mybatisplus.extension.plugins.pagination.Page;import org.apache.ibatis.annotations.Param;import org.apache.ibatis.annotations.Select;import java.util.List;/** * <p> * 基础字典 Mapper 接口 * </p> * * @author admin * @since 2019-12-16 */public interface DictMapper extends BaseMapper<Dict> {    Page<Dict> customPageList(Page page, @Param("param") Dict dict);    @Select("select * from t_dict where dict_type_id = #{dictTypeId}")    List<Dict> findByTypeId(@Param("dictTypeId") String dictTypeId);}