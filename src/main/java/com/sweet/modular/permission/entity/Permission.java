package com.sweet.modular.permission.entity;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.baomidou.mybatisplus.annotation.TableId;import com.baomidou.mybatisplus.annotation.TableField;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> *  * </p> * * @author wxl * @since 2019-11-20 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("t_permission")@ApiModel(value="Permission对象", description="")public class Permission extends Model<Permission> {    private static final long serialVersionUID = 1L;    @TableId("ID")    private String id;    @TableField("NAME")    private String name;    @TableField("URL")    private String url;    @Override    protected Serializable pkVal() {        return null;    }}