package com.spring.eppstest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.eppstest.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertGoods(BoardDto boardDto) throws Exception {
		sqlSession.insert("insertBoardMapper.insertBoard" , boardDto);
	}

	@Override
	public List<BoardDto> getBoardList() throws Exception {
		return sqlSession.selectList("boardList.selectBoardList");
	}

	@Override
	public BoardDto getOneBoard(int board_id) throws Exception {
		return sqlSession.selectOne("boardList.selectGetOneBoard" , board_id);
	}

	@Override
	public void updateBoard(BoardDto boardDto) throws Exception {
		sqlSession.update("updateBoard.updateBoard" , boardDto);
	}

	@Override
	public void deleteBoard(BoardDto boardDto) throws Exception {
		sqlSession.delete("deleteBoard.deleteBoard" , boardDto);
	}

	@Override
	public String checkPassword(int board_id) throws Exception {
		return sqlSession.selectOne("checkPassword.checkPassword" , board_id);
	}

	@Override
	public List<BoardDto> searchBoard(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("boardList.searchBoard" , searchMap);
	}

}
