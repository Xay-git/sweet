package com.sweet.core.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class ResultBean<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String DEFAULT_SUCCESS_MESSAGE = "success";

	public static final String DEFAULT_ERROR_MESSAGE = "error";

	public static final Integer DEFAULT_SUCCESS_CODE = 200;

	public static final Integer DEFAULT_ERROR_CODE = 500;

	@ApiModelProperty("返回的状态码")
	private int code;
	@ApiModelProperty("返回的信息")
	private String msg;
	@ApiModelProperty("返回的数据")
	private T data;


	public ResultBean( int code, String msg,T data) {
		this.msg = msg;
		this.code = code;
		this.data = data;
	}

	public static ResultSuccess success() {
		return new ResultSuccess();
	}

	public static ResultSuccess success(Object object) {
		return new ResultSuccess(object);
	}

	public static ResultSuccess success(Integer code, String message, Object object) {
		return new ResultSuccess(code, message, object);
	}

	public static ResultError error(String message) {
		return new ResultError(message);
	}

	public static ResultError error(Integer code, String message) {
		return new ResultError(code, message);
	}

	public static ResultError error(Integer code, String message, Object object) {
		return new ResultError(code, message, object);
	}







}
