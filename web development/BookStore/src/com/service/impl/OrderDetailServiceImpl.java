package com.service.impl;

import com.bean.OrderDetail;
import com.dao.OrderDetailDAO;
import com.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService {
	
	public OrderDetailServiceImpl(){}
	
	private OrderDetailDAO OrderDetailDAO;
	
	public OrderDetailDAO getOrderDetailDAO() {
		return OrderDetailDAO;
	}
	public void setOrderDetailDAO(OrderDetailDAO OrderDetailDAO) {
		this.OrderDetailDAO = OrderDetailDAO;
	}
	
	public void addOrderDetail(OrderDetail OrderDetail) {
		this.OrderDetailDAO.addOrderDetail(OrderDetail);
	}

	
}
