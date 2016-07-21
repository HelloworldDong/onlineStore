package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.Book;
import com.dao.BookDAO;

public class BookDAOImpl implements BookDAO {
	
	public BookDAOImpl(){}
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void addBook(Book book) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(book);
		tx.commit();
		session.close();		
	}
	@Override
	public void deleteBook(Book book) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(book);
		tx.commit();
		session.close();		
	}
	@Override
	public void updateBook(Book book) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(book);
		tx.commit();
		session.close();		
	}
	@Override
	public List<Book> searchBookByName(String bookname) {
		Session session = sessionFactory.openSession();		
		Transaction tx = session.beginTransaction();
		String sql="from Book where name like '%"+bookname+"%'";
		List<Book> list = session.createQuery(sql).list();
		tx.commit();
		session.close();
		return list;
	}
	@Override
	public Book searchBookById(int bookid) {
		Book book = null;			
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		book = (Book) session.get(Book.class, bookid);
		tx.commit();
		session.close();
		return book;
	}
	@Override
	public List<Book> listAllBooks() {
		Session session = sessionFactory.openSession();
		List<Book> list = session.createQuery("from Book").list();
		session.close();
		return list;
	}
}
