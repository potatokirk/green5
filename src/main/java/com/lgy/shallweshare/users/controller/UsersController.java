package com.lgy.shallweshare.users.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UsersController {

	@Autowired
	private UsersService service;

	@RequestMapping("users/usersLogIn")
	public String usersLogIn(@RequestParam HashMap<String, String> param) {
		log.info("@# usersLogIn");
		return "users/usersLogIn";

	}

	@RequestMapping("users/login")
	public @ResponseBody String loginCheck(@RequestParam HashMap<String, String> param,
			HttpSession session) {
		log.info("@# loginCheck");
		log.info("@#@# loginCheck" + param);
		int u_id = Integer.parseInt(param.get("u_id"));
		int u_pwd = Integer.parseInt(param.get("u_pwd"));
		log.info("@#@# u_pwd====" + u_pwd);

		UsersDto dto = service.login(u_id);
		log.info("@@@###"+dto);

		int dto_id = dto.getU_id();
		int dto_pwd = dto.getU_pwd();
		
		log.info("@#@# if start");
		if(u_id != 0) {
			
			if(u_id == dto_id && u_pwd == dto_pwd) {
				log.info("@#===> 같은때");
				return "redirect:review/reviewList";
			}else {
				log.info("@#===> 다를때");
				return "redirect:usersLogin";
			}
			
		}
		log.info("@#===> 넘어간다!!!!");
		return "users/login";
	}
	
}