package com.grobaby.mvc00.board;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping("board/BoardCreate.do")
	public void create(String MID, Model model) {
		model.addAttribute("MID",MID);
	}
	@RequestMapping("board/create.do")
	public void insert(BoardVO vo, Model model) throws ParseException {
		int result = service.insert(vo);
		model.addAttribute("result",result);
	}
	@RequestMapping("board/Board.do")
	public void list(BoardVO vo, Model model) {
		List<BoardVO> list = service.list();
		model.addAttribute("list",list);
	}
	@RequestMapping("board/BoardOne.do")
	public void one(String BCODE, Model model) {
		model.addAttribute("result", service.one(BCODE));
	}
	@RequestMapping("board/UpdateFormat.do")
	public void upform(String BCODE, Model model) {
		model.addAttribute("result", service.one(BCODE));
	}
	@RequestMapping("board/newUpdate.do")
	public void update(BoardVO vo){
		service.update(vo);
	}
	@RequestMapping("board/delete.do")
	public void delete(String BCODE) {
		service.delete(BCODE);
	}
	
}
