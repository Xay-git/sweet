package com.sweet.system.entity;import com.baomidou.mybatisplus.annotation.TableName;import lombok.Data;import java.util.Date;@Data@TableName("t_user")public class User {    private String id;    private String name;    private Date birthday;}