package com.sweet.system.model;import com.fasterxml.jackson.annotation.JsonFormat;import lombok.Data;import lombok.experimental.Accessors;import java.util.Date;@Data@Accessors(chain = true)public class UserDto {    private String userId;    private String userName;    private String accountStatus;    @JsonFormat(pattern = "yyyy-MM-dd")    private Date birthday;    private String deptId;    private String deptName;}