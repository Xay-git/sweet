package com.sweet.system.entity;import com.baomidou.mybatisplus.annotation.FieldFill;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.baomidou.mybatisplus.annotation.TableId;import com.baomidou.mybatisplus.annotation.TableField;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> * 字典类型表 * </p> * * @author admin * @since 2019-12-16 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("t_dict_type")@ApiModel(value="DictType对象", description="字典类型表")public class DictType extends Model<DictType> {    private static final long serialVersionUID = 1L;    @ApiModelProperty(value = "字典类型id")    @TableId(value = "DICT_TYPE_ID")    private String dictTypeId;    @ApiModelProperty(value = "字典类型编码")    @TableField(value = "CODE")    private String code;    @ApiModelProperty(value = "字典类型名称")    @TableField(value = "NAME")    private String name;    @ApiModelProperty(value = "字典描述")    @TableField(value = "DESCRIPTION")    private String description;    @ApiModelProperty(value = "排序")    @TableField(value = "ORDER_NUM")    private Integer orderNum;    @ApiModelProperty(value = "添加时间")    @TableField(value = "CREATE_TIME",fill = FieldFill.INSERT)    private Date createTime;    @Override    protected Serializable pkVal() {        return null;    }    /**     * <p>     * 文件信息表     * </p>     *     * @author admin     * @since 2019-12-16     */    @Data    @EqualsAndHashCode(callSuper = false)    @Accessors(chain = true)    @TableName("t_file_info")    @ApiModel(value="FileInfo对象", description="文件信息表")    public static class FileInfo extends Model<FileInfo> {        private static final long serialVersionUID = 1L;        @ApiModelProperty(value = "主键id")        @TableId("FILE_ID")        private String fileId;        @TableField(value = "PARENT_ID")        private String parentId;        @ApiModelProperty(value = "文件仓库（oss仓库）")        @TableField(value = "FILE_BUCKET")        private String fileBucket;        @ApiModelProperty(value = "文件名称")        @TableField(value = "FILE_NAME")        private String fileName;        @ApiModelProperty(value = "文件后缀")        @TableField(value = "FILE_SUFFIX")        private String fileSuffix;        @ApiModelProperty(value = "文件大小kb")        @TableField(value = "FILE_SIZE_KB")        private Long fileSizeKb;        @ApiModelProperty(value = "文件唯一标识id")        @TableField(value = "FINAL_NAME")        private String finalName;        @ApiModelProperty(value = "存储路径")        @TableField(value = "FILE_PATH")        private String filePath;        @ApiModelProperty(value = "创建时间")        @TableField(value = "CREATE_TIME")        private Date createTime;        @ApiModelProperty(value = "修改时间")        @TableField(value = "UPDATE_TIME")        private Date updateTime;        @ApiModelProperty(value = "创建用户")        @TableField(value = "CREATE_USER")        private String createUser;        @ApiModelProperty(value = "修改用户")        @TableField(value = "UPDATE_USER")        private String updateUser;        @ApiModelProperty(value = "0文件夹 1文件")        @TableField(value = "FILE_TYPE")        private Integer fileType;        @ApiModelProperty(value = "存放的系统路径")        @TableField(value = "FILE_SYS_PATH")        private String fileSysPath;        @Override        protected Serializable pkVal() {            return null;        }    }}