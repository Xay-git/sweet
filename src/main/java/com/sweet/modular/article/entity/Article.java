package com.sweet.modular.article.entity;import com.baomidou.mybatisplus.annotation.*;import com.baomidou.mybatisplus.annotation.TableField;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.baomidou.mybatisplus.annotation.Version;import com.baomidou.mybatisplus.annotation.TableId;import java.time.LocalDateTime;import com.baomidou.mybatisplus.annotation.TableField;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> * 文章 * </p> * * @author admin * @since 2020-01-15 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("business_article")@ApiModel(value="Article对象", description="文章")public class Article extends Model<Article> {    private static final long serialVersionUID = 1L;    @TableId("ARTICLE_ID")    private String articleId;    @ApiModelProperty(value = "文章名称")    @TableField(value = "ARTICLE_NAME")    private String articleName;    @ApiModelProperty(value = "文章摘要")    @TableField(value = "SNIPPET")    private String snippet;    @ApiModelProperty(value = "文章类型")    @TableField(value = "ARTICLE_TYPE")    private String articleType;    @ApiModelProperty(value = "作者")    @TableField(value = "AUTHOR")    private String author;    @ApiModelProperty(value = "内容")    @TableField(value = "CONTENT")    private String content;    @ApiModelProperty(value = "创建时间")    @TableField(value = "CREATE_TIME", fill = FieldFill.INSERT)    private Date createTime;    @ApiModelProperty(value = "修改时间")    @TableField(value = "MODIFY_TIME", fill = FieldFill.INSERT_UPDATE)    private Date modifyTime;    @ApiModelProperty(value = "乐观锁保留字段")    @TableField(value = "VERSION", fill = FieldFill.INSERT)    @Version    private Long version;   /** -----------字典装换数据----------- **/    @TableField(exist = false)    private String articleTypeName;    /** -----------END 字典装换数据----------- **/    @Override    protected Serializable pkVal() {        return null;    }}