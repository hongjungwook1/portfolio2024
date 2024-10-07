package com.spring.eppstest.dao;

import java.util.List;
import java.util.Map;

import com.spring.eppstest.dto.BoardDto;

public interface BoardDao {
	
	public void insertGoods(BoardDto boardDto) throws Exception;
	public List<BoardDto> getBoardList() throws Exception;
	public BoardDto getOneBoard(int board_id) throws Exception;
	public void updateBoard(BoardDto boardDto) throws Exception;
	public void deleteBoard(BoardDto boardDto) throws Exception;
	public String checkPassword(int board_id) throws Exception;
	public List<BoardDto> searchBoard(Map<String , Object> searchMap) throws Exception;
}
