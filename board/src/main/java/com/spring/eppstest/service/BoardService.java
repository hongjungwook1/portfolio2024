package com.spring.eppstest.service;

import java.util.List;
import java.util.Map;

import com.spring.eppstest.dto.BoardDto;

public interface BoardService {
	
	public void addBoard(BoardDto boardDto) throws Exception;
	public List<BoardDto> getBoardList() throws Exception;
	public BoardDto getOneBoard(int board_id) throws Exception;
	public void updateBoard(BoardDto boardDto) throws Exception;
	public void deleteBoard(BoardDto boardDto) throws Exception;
	public String checkPassword(int board_id) throws Exception;
	public List<BoardDto> searchBoard(Map<String , Object> searchMap) throws Exception;
}
