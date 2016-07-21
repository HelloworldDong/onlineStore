package com.service.impl;

import java.util.List;

import com.bean.Order;
import com.dao.OrderDAO;
import com.service.OrderService;

public class OrderServiceImpl implements OrderService {
	
	public OrderServiceImpl(){}
	
	private OrderDAO OrderDAO;
	
	public OrderDAO getOrderDAO() {
		return OrderDAO;
	}
	public void setOrderDAO(OrderDAO OrderDAO) {
		this.OrderDAO = OrderDAO;
	}
	
	public int addOrder(Order Order) {
		this.OrderDAO.addOrder(Order);
		return Order.getId();
	}
	
	
}
