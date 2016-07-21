package com.action.admin;

import java.io.PrintWriter;
import java.util.List;
import net.sf.json.*;
import org.apache.struts2.ServletActionContext;

import com.bean.Book;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BookService;

public class listBookAction extends ActionSupport {
	private BookService bookService;
	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		List<Book> blist=bookService.listAllBooks();
		ServletActionContext.getRequest().setAttribute("books", blist);
		JSONArray array=JSONArray.fromObject(blist);
		PrintWriter out=ServletActionContext.getResponse().getWriter();
		out.println(array);
		out.flush();
		return null;
	}
}
