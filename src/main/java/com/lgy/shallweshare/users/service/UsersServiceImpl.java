package com.lgy.shallweshare.users.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.users.dao.UsersDao;
import com.lgy.shallweshare.users.dto.UsersDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service("UserService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UsersDto login(int u_id) {
	log.info("@# UserServiceImpl.login() start");
	 UsersDao dao = sqlSession.getMapper(UsersDao.class);
	 log.info("@# UserServiceImpl.login() dao===="+dao);
	 
	 UsersDto dto = dao.login(u_id);
	log.info("@# UserServiceImpl.login() end");

	return dto;
		
	}
}
