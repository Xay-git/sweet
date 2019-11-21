package com.sweet.demo;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.modular.sysLog.entity.SysLog;
import com.sweet.modular.sysLog.mapper.SysLogMapper;
import com.sweet.modular.sysLog.service.SysLogService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SweetApplicationTests {

	@Autowired
	SysLogMapper sysLogMapper;

	@Test
	public void test() {
		QueryWrapper<SysLog> queryWrapper =  new QueryWrapper<>();

		Page<SysLog> list = new Page<>(0,5);
		IPage<SysLog> iPage =  sysLogMapper.selectPage(list,queryWrapper);
		System.out.println(iPage.getRecords());
	}

}
