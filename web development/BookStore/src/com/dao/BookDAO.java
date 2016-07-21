package com.dao;

import java.util.List;

import com.bean.Book;

public interface BookDAO {
	public void addBook(Book book);

	public void deleteBook(Book book);

	public void updateBook(Book book);

	public List<Book> searchBookByName(String bookname);

	public Book searchBookById(int bookid);

	public List<Book> listAllBooks();
}
