package com.sweet.modular.FileInfo.mapper;import com.sweet.modular.FileInfo.entity.FileInfo;import com.baomidou.mybatisplus.core.mapper.BaseMapper;import org.apache.ibatis.annotations.Param;import org.apache.ibatis.annotations.Select;/** * <p> * 文件信息表 Mapper 接口 * </p> * * @author wxl * @since 2019-12-06 */public interface FileInfoMapper extends BaseMapper<FileInfo> {    @Select("select * from t_file_info where file_name=#{fileName} and file_type = '0'")    FileInfo getFileDirByName(@Param("fileName")String fileName);}