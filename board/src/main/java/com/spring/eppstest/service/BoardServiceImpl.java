package com.spring.eppstest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.eppstest.dao.BoardDao;
import com.spring.eppstest.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void addBoard(BoardDto boardDto) throws Exception {
		boardDao.insertGoods(boardDto);
		
	}

	@Override
	public List<BoardDto> getBoardList() throws Exception {
		return boardDao.getBoardList();
	}

	@Override
	public BoardDto getOneBoard(int board_id) throws Exception {
		return boardDao.getOneBoard(board_id);
	}

	@Override
	public void updateBoard(BoardDto boardDto) throws Exception {
		boardDao.updateBoard(boardDto);
	}

	@Override
	public void deleteBoard(BoardDto boardDto) throws Exception {
		boardDao.deleteBoard(boardDto);
	}

	@Override
	public String checkPassword(int board_id) throws Exception {
		return boardDao.checkPassword(board_id);
	}

	@Override
	public List<BoardDto> searchBoard(Map<String, Object> searchMap) throws Exception {
		return boardDao.searchBoard(searchMap);
	}



}
