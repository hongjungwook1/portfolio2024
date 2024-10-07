package com.spring.eppstest.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardDto {

	private int board_id;
	private String board_company;
	private String board_title;
	private String board_contents;
	private String board_register;
	private String board_password;
	private Date board_date;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_company() {
		return board_company;
	}
	public void setBoard_company(String board_company) {
		this.board_company = board_company;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public String getBoard_register() {
		return board_register;
	}
	public void setBoard_register(String board_register) {
		this.board_register = board_register;
	}
	public String getBoard_password() {
		return board_password;
	}
	public void setBoard_password(String board_password) {
		this.board_password = board_password;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	@Override
	public String toString() {
		return "BoardDto [board_id=" + board_id + ", board_company=" + board_company + ", board_title=" + board_title
				+ ", board_contents=" + board_contents + ", board_register=" + board_register + ", board_password="
				+ board_password + ", board_date=" + board_date + "]";
	}
	
}
