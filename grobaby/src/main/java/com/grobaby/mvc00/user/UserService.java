package com.grobaby.mvc00.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	UserDAO dao;
	//유저 회원가입
	public void create(UserVO vo) {
		dao.create(vo);
	}
	//유저 아이디 체크
	public int check(String MID) {
		int result = dao.check(MID);
		//기존에 저장된 아이디가 검색이 안되면 생성가능으로 변경
		System.out.println("서비스"+result);
		return result;
	}
	//유저 로그인
	public boolean login(UserLoginVO vo) {
		String passWord = dao.login(vo.getMID());
		boolean result = false;
		//아이디로 검색해온 비밀번호가 일치하면 로그인 가능으로 변경
		if(passWord.equals(vo.getMPW())) {
			result = true;
		}
		return result;
	}
	
}
