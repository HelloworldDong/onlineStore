package com.dao.impl;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.OrderDetail;
import com.dao.OrderDetailDAO;

public class OrderDetailDAOImpl implements OrderDetailDAO {
	
	public OrderDetailDAOImpl(){}
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addOrderDetail(OrderDetail orderDetail) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(orderDetail);
		tx.commit();
		session.close();	
		
	}
	
	
}
