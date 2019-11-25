package com.sweet.modular.menu.entity;import com.baomidou.mybatisplus.annotation.*;import com.baomidou.mybatisplus.extension.activerecord.Model;import java.time.LocalDateTime;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> * 菜单表 * </p> * * @author wxl * @since 2019-11-22 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("t_menu")@ApiModel(value="Menu对象", description="菜单表")public class Menu extends Model<Menu> {    private static final long serialVersionUID = 1L;    @ApiModelProperty(value = "菜单/按钮ID")    @TableId(value = "MENU_ID")    private String menuId;    @ApiModelProperty(value = "上级菜单ID")    @TableField("PARENT_ID")    private String parentId;    @ApiModelProperty(value = "菜单/按钮名称")    @TableField("MENU_NAME")    private String menuName;    @ApiModelProperty(value = "菜单URL")    @TableField("URL")    private String url;    @ApiModelProperty(value = "权限标识")    @TableField("PERMS")    private String perms;    @ApiModelProperty(value = "图标")    @TableField("ICON")    private String icon;    @ApiModelProperty(value = "类型 0菜单 1按钮")    @TableField("TYPE")    private Integer type;    @ApiModelProperty(value = "排序")    @TableField("ORDER_NUM")    private Long orderNum;    @ApiModelProperty(value = "创建时间")    @TableField(value = "CREATE_TIME", fill = FieldFill.INSERT)    private Date createTime;    @ApiModelProperty(value = "修改时间")    @TableField(value = "MODIFY_TIME", fill = FieldFill.UPDATE)    private Date modifyTime;    @Override    protected Serializable pkVal() {        return null;    }}