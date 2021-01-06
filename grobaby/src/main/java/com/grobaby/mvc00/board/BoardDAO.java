package com.grobaby.mvc00.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public int insert(BoardVO vo) {
		return mybatis.insert("board.create", vo);
	}
	
	public List<BoardVO> list(){
		List<BoardVO> list = mybatis.selectList("board.list");
		return list;
	}
	
	public BoardVO one(String BCODE) {
		return mybatis.selectOne("board.one",BCODE);
	}
	
	public void delete(String BCODE) {
		mybatis.delete("board.delete",BCODE);
	}

	public void update(BoardVO vo) {
		mybatis.update("board.update",vo);
	}
	
}
