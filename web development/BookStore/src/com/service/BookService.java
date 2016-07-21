package com.service;

import java.util.List;

import com.bean.Book;
import com.bean.User;

public interface BookService {
	public void deleteBook(Book book);

	public void updateBook(Book book);

	public List<Book> searchBookByName(String bookname);

	public Book searchBookById(int bookid);

	public void addBook(Book book);

	public List<Book> listAllBooks();
}
