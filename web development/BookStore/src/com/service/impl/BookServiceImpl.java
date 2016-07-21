package com.service.impl;

import java.util.List;

import com.bean.Book;
import com.bean.User;
import com.dao.BookDAO;
import com.service.BookService;

public class BookServiceImpl implements BookService {
	
	public BookServiceImpl(){}
	
	private BookDAO bookDAO;
	
	public BookDAO getBookDAO() {
		return bookDAO;
	}
	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}
	
	public void addBook(Book book) {
		this.bookDAO.addBook(book);
	}
	
	public void deleteBook(Book book) {
		this.bookDAO.deleteBook(book);
	}
	
	public void updateBook(Book book) {
		this.bookDAO.updateBook(book);
	}
	
	public List<Book> searchBookByName(String bookname) {
		return this.bookDAO.searchBookByName(bookname);
	}
	
	public Book searchBookById(int bookid) {
		return this.bookDAO.searchBookById(bookid);
	}
	
	public List<Book> listAllBooks() {
		return this.bookDAO.listAllBooks();
	}
}
