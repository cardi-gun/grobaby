package com.grobaby.mvc00.board;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO dao;
	
	public int insert(BoardVO vo) throws ParseException {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		Date dates = format1.parse(time1);
		
		vo.setBDATE(dates);
		
		return dao.insert(vo);
	}
	
	public List<BoardVO> list(){
		List<BoardVO> list = dao.list();
		return list;
	}
	
	public BoardVO one(String BCODE) {
		return dao.one(BCODE);
	}
	
	public void delete(String BCODE) {
		dao.delete(BCODE);
	}
	
	public void update(BoardVO vo){
		dao.update(vo);
	}
}
