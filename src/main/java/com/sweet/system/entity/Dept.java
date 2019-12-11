package com.sweet.system.entity;import com.baomidou.mybatisplus.annotation.FieldFill;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.baomidou.mybatisplus.annotation.TableId;import com.baomidou.mybatisplus.annotation.TableField;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> * 部门表 * </p> * * @author wxl * @since 2019-11-28 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("t_dept")@ApiModel(value="Dept对象", description="部门表")public class Dept extends Model<Dept> {    private static final long serialVersionUID = 1L;    @ApiModelProperty(value = "部门ID")    @TableId("DEPT_ID")    private String deptId;    @ApiModelProperty(value = "上级部门ID")    @TableField("PARENT_ID")    private String parentId;    @ApiModelProperty(value = "上级部门ID集合")    @TableField("PARENT_IDS")    private String parentIds;    @ApiModelProperty(value = "部门名称")    @TableField("DEPT_NAME")    private String deptName;    @ApiModelProperty(value = "排序")    @TableField("ORDER_NUM")    private Long orderNum;    @ApiModelProperty(value = "创建时间")    @TableField(value = "CREATE_TIME", fill = FieldFill.INSERT)    private Date createTime;    @ApiModelProperty(value = "修改时间")    @TableField(value = "MODIFY_TIME", fill = FieldFill.UPDATE)    private Date modifyTime;    @Override    protected Serializable pkVal() {        return null;    }}