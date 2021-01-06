package com.grobaby.mvc00.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@Autowired
	UserService	service;
	
	@RequestMapping("user/create.do")
	public void create(UserVO vo) {
		service.create(vo);
	}
	@RequestMapping("user/checkID.do")
	public void check(String MID, Model model) {
		int result = service.check(MID);
		System.out.println("컨트롤러"+result);
		model.addAttribute("result", result);
	}
	@RequestMapping("user/login.do")
	public void login(UserLoginVO vo, Model model, HttpSession session) {
		if(service.login(vo)) {
			//로그인 성공 시 아이디 세션으로 넘기기
			session.setAttribute("MID", vo.getMID());
			model.addAttribute("result", "true");
		}else {
			//로그인 실패 시 null 세션으로 넘기기
			session.setAttribute("MID", "null");
			model.addAttribute("result", "false");
		}
	}
	
	@RequestMapping("user/LoginHome.do")
	public void list(HttpSession session, Model model) throws Exception {
		String MID = (String)session.getAttribute("MID");
	}
	@RequestMapping("user/SessionRemove.do")
	public void SessionRevome() {

	}
	
}
