package com.sweet.core.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class ResultBean<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty("返回的信息")
	private String msg = "success";
	@ApiModelProperty("返回的状态码")
	private int code = 200;
	@ApiModelProperty("返回的数据")
	private T data;

	public ResultBean() {
		super();
	}

	public ResultBean(T data) {
		super();
		this.data = data;
	}

	public ResultBean(Throwable e) {
		super();
		this.msg = e.toString();
		this.code = 200;
	}
}
