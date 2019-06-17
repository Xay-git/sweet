package com.sweet.modular.user.controller;


import com.sweet.modular.user.entity.User;
import com.sweet.modular.user.mapper.UserMapper;
import com.sweet.modular.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jobob
 * @since 2019-06-17
 */
@RestController
@RequestMapping("/user/user")
public class UserController {

  @Autowired
  UserMapper IUserService;

}
