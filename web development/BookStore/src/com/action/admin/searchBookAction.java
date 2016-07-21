package com.action.admin;

import java.util.Map;
import java.util.List;

import com.bean.Book;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BookService;

public class searchBookAction extends ActionSupport{
	private BookService bookService;
	private String bookname;
	private int bookid;
	public BookService getbookService() {
		return bookService;
	}
	public void setbookService(BookService bookService) {
		this.bookService = bookService;
	}
	
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	
	public String byName() throws Exception {
		Map request = (Map) ActionContext.getContext().get("request");
		List<Book>	list=this.bookService.searchBookByName(bookname);
		request.put("bookn", list);
		return SUCCESS;
	}
	public String byId() throws Exception {
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("Book", this.bookService.searchBookById(bookid));	
		
		return SUCCESS;
	}
}
