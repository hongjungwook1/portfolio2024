package com.spring.eppstest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.eppstest.dto.BoardDto;
import com.spring.eppstest.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	// 메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() throws Exception {
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("/main"); 
	    mv.addObject("boardList", boardService.getBoardList());
	    
	    return mv;
	    
	}
	
	
	// 검색 화면
	@RequestMapping(value="/searchBoard" , method=RequestMethod.GET)
	public ModelAndView searchBoard(@RequestParam("board_company")		String board_company , 
									@RequestParam("startDate")			String startDate , 
									@RequestParam("endDate")			String endDate , 
									@RequestParam(value = "board_register" , required = false)	String board_register , 
									@RequestParam(value = "board_title" , required = false)		String board_title) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("board_company : " + board_company);
		System.out.println("startDate : " + startDate);
		System.out.println("endDate  : " + endDate);
		System.out.println("board_register  : " + board_register);
		System.out.println("board_title  : " + board_title);
		
		Map<String, Object> searchMap = new HashMap<String , Object>();
		searchMap.put("board_company", board_company);
		searchMap.put("startDate", startDate);
		searchMap.put("endDate", endDate);
        
        if (board_register != null) {
        	searchMap.put("board_register", board_register);
        }
        
        if (board_title != null) {
        	searchMap.put("board_title", board_title);
        }
        
        List<BoardDto> searchResults = boardService.searchBoard(searchMap);
        
        mv.addObject("searchResults", searchResults);
        mv.setViewName("/searchBoard");
		return mv;
		
		
		
		
	}
 	
	
	// 게시글 등록 화면
	@RequestMapping(value="/register" , method =RequestMethod.GET)
	public ModelAndView register() throws Exception {
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("/register"); 
	    return mv;
	}
	
	
	// 게시글 등록 화면 POST
	@RequestMapping(value="/register" , method =RequestMethod.POST)
	public ResponseEntity<Object> register(MultipartHttpServletRequest request) throws Exception {
		
		BoardDto boardDto = new BoardDto();
		
		request.setCharacterEncoding("utf-8");
		
		boardDto.setBoard_company(request.getParameter("board_company"));
		boardDto.setBoard_title(request.getParameter("board_title"));
		boardDto.setBoard_contents(request.getParameter("board_contents"));
		boardDto.setBoard_register(request.getParameter("board_register"));
		boardDto.setBoard_password(request.getParameter("board_password"));
		
		boardService.addBoard(boardDto);
		
		String jsScript = "";
		jsScript = "<script>";
		jsScript += "alert('게시판이 등록 되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
	
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
	}
	
	
	// 게시글 상세 화면	
	@RequestMapping(value="/boardDetails" , method=RequestMethod.GET)
	public ModelAndView boardDetails(@RequestParam("board_id") int board_id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/boardDetails");
		mv.addObject("boardDto", boardService.getOneBoard(board_id));
		
		return mv;
	}
	
	// 게시글 수정 화면	
	@RequestMapping(value="/updateBoard" , method=RequestMethod.GET)
	public ModelAndView updateBoard(@RequestParam("board_id") int board_id , 
									@RequestParam("board_password") String board_password) throws Exception {
		ModelAndView mv = new ModelAndView();
		String pW = boardService.checkPassword(board_id);
		
		if (!board_password.equals(pW)) {
			mv.setViewName("/errorPage");
			return mv; 
		}
		
		mv.setViewName("/updateBoard");
		mv.addObject("boardDto", boardService.getOneBoard(board_id));
		return mv;
	}
	
	
	// 게시글 수정 화면 POST
	@RequestMapping(value="/updateBoard" , method=RequestMethod.POST)
	public ResponseEntity<Object> updateBoard(MultipartHttpServletRequest request) throws Exception {
		
		BoardDto boardDto = new BoardDto();
		
		request.setCharacterEncoding("utf-8");
		
		boardDto.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
		boardDto.setBoard_title(request.getParameter("board_title"));
		boardDto.setBoard_contents(request.getParameter("board_contents"));
		
		boardService.updateBoard(boardDto);
		
		String jsScript = "";
		jsScript = "<script>";
		jsScript += "alert('게시판이 수정 되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
	
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
	}
	
	
	// 게시글 삭제
	@RequestMapping(value="deleteBoard" , method=RequestMethod.GET)
	public ModelAndView deleteBoard(@RequestParam("board_id") int board_id , 
									@RequestParam("board_password") String board_password , 
									BoardDto boardDto) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		String pW = boardService.checkPassword(board_id);
		
		if (!board_password.equals(pW)) {
			mv.setViewName("/errorPage");
			return mv; 
		}
		boardService.deleteBoard(boardDto);
		
		mv.setViewName("/delectBoard");
		return mv;
	}
	
	
}
