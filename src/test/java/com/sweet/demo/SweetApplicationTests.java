package com.sweet.demo;


import com.sweet.core.shiro.session.SessionService;
import com.sweet.core.util.RedisUtil;

import com.sweet.system.service.RoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

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
