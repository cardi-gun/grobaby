package com.grobaby.mvc00.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//유저 회원가입
	public void create(UserVO vo) {
		mybatis.insert("user.create",vo);
	}
	//유저 아이디 체크
	public int check(String MID) {
		return mybatis.selectOne("user.check",MID);
	}
	//유저 로그인
	public String login(String MID) {
		return mybatis.selectOne("user.login", MID);
	}
	
	
}
