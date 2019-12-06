package com.sweet.demo;


import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.core.shiro.session.SessionService;
import com.sweet.core.util.HttpClientUtil;
import com.sweet.core.util.RedisUtil;

import com.sweet.modular.system.entity.RoleMenu;
import com.sweet.modular.system.service.RoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SweetApplicationTests {

	@Autowired
	RoleService roleService;

	@Autowired
	RedisUtil redisUtil;

	@Autowired
	SessionService sessionService;


	@Test
	public void test1() {
		List<String> list = roleService.getMenusByRoleId("1");
		System.out.println(list);
	}

	@Test
	public void redis() {
		redisUtil.set("aa","aa");
		sessionService.list();
		System.out.println(redisUtil.get("aa"));
	}

}
