package com.onlineStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineStore.dao.OrderDao;
import com.onlineStore.entity.Orders;
import com.onlineStore.entity.Showorder;
import com.onlineStore.service.OrderService;

@Service(value = "orderService")
@Transactional
public class OrderServiceImpl  implements OrderService{

	@Autowired
	private OrderDao orderDao;
	
	public void add(Orders order) {
		orderDao.add(order);
		
	}

	public List<Showorder> show(int userID) {
		
		return orderDao.show(userID);
	}

	public Orders search(int orderID) {
		
		return orderDao.search(orderID);
	}

	public List<Orders> findAll() {
		
		return orderDao.findAll();
	}

	public void validate(int id) {
		orderDao.validate(id);
		
	}

	public void reject(int id) {
		orderDao.reject(id);
		
	}

	public void cancel(int orderID) {
		orderDao.cancel(orderID);
		
	}

}
