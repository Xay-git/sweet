package com.sweet.core.shiro;import com.fasterxml.jackson.annotation.JsonFormat;import lombok.Data;import lombok.experimental.Accessors;import java.util.Date;@Data@Accessors(chain = true)public class UserOnline {    private static final long serialVersionUID = 1L;    // session id    private String id;    // 用户id    private String userId;    // 用户名称    private String userName;    // 用户所在地址    private String address;    // 用户主机地址    private String host;    // 状态    private String status;    // session创建时间    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")    private Date startTimestamp;    // session最后访问时间    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")    private Date lastAccessTime;    // 超时时间    private Long timeout;}