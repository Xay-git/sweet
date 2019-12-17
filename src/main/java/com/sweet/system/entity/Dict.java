package com.sweet.system.entity;import com.baomidou.mybatisplus.annotation.FieldFill;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.baomidou.mybatisplus.annotation.TableId;import com.baomidou.mybatisplus.annotation.TableField;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> * 基础字典 * </p> * * @author admin * @since 2019-12-16 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("t_dict")@ApiModel(value="Dict对象", description="基础字典")public class Dict extends Model<Dict> {    private static final long serialVersionUID = 1L;    @ApiModelProperty(value = "字典id")    @TableId("DICT_ID")    private String dictId;    @ApiModelProperty(value = "所属字典类型的id")    @TableField(value = "DICT_TYPE_ID")    private String dictTypeId;    @ApiModelProperty(value = "字典编码")    @TableField(value = "CODE")    private String code;    @ApiModelProperty(value = "字典名称")    @TableField(value = "NAME")    private String name;    @ApiModelProperty(value = "排序")    @TableField(value = "ORDER_NUM")    private Integer orderNum;    @ApiModelProperty(value = "字典的描述")    @TableField(value = "DESCRIPTION")    private String description;    @ApiModelProperty(value = "创建时间")    @TableField(value = "CREATE_TIME",fill = FieldFill.INSERT)    private Date createTime;    @Override    protected Serializable pkVal() {        return null;    }}