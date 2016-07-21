package com.dao.impl;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.*;
import com.dao.*;

public class OrderDAOImpl implements OrderDAO {
	
	public OrderDAOImpl(){}
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addOrder(Order order) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(order);
		tx.commit();
		session.close();	
		
	}

}
