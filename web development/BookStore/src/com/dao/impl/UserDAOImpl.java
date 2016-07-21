package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.User;
import com.dao.UserDAO;

import javassist.bytecode.Descriptor.Iterator;

public class UserDAOImpl implements UserDAO {

	public UserDAOImpl() {
	}

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
	}

	@Override
	public void deleteUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(user);
		tx.commit();
		session.close();
	}

	@Override
	public void updateUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(user);
		tx.commit();
		session.close();
	}

	@Override
	public User searchUserByName(String username) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		List<User> list = session.createQuery("from User").list();
		User searchUser = null;
		for (User user : list) {
			if ((user.getUsername()).equals(username)) {
				searchUser = user;
			}
		}
		tx.commit();
		session.close();
		return searchUser;
	}

	@Override
	public List<User> listAllUsers() {
		Session session = sessionFactory.openSession();
		List<User> list = session.createQuery("from User").list();
		session.close();
		return list;
	}

	@Override
	public User searchUserById(int id) {
		User user = null;
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		user = (User) session.get(User.class, id);
		tx.commit();
		session.close();
		return user;
	}
}
