package com.action.admin;

import com.bean.Book;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BookService;

public class ManageBookAction extends ActionSupport {
	private int bookid;
	private String bookname;
	private String author;
	private int price;

	private BookService bookService;

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid =bookid;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	public String add() throws Exception {
		Book book=new Book();
		book.setBook_id(bookid);
		book.setName(bookname);
		book.setAuthor(author);
		book.setPrice(price);
		this.bookService.addBook(book);
		System.out.print(book);
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		Book book=new Book();
		book=this.bookService.searchBookById(bookid);
		this.bookService.deleteBook(book);
		return SUCCESS;
	}
	
	public String update() throws Exception {
		Book book=new Book();
		book.setBook_id(bookid);
		book.setName(bookname);
		book.setAuthor(author);
		book.setPrice(price);
		this.bookService.updateBook(book);
		return SUCCESS;
	}
}
