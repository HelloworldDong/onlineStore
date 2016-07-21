package com.action;
import java.util.List;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.sql.Timestamp;
import java.util.Map;
import com.bean.Cart;
import com.bean.Order;
import com.bean.OrderDetail;
import com.service.OrderService;
import com.service.OrderDetailService;

public class OrderAction extends ActionSupport {
	private OrderService orderservice;
	private OrderDetailService orderdetailservice;
	
	public OrderService getOrderservice() {
		return orderservice;
	}

	public void setOrderservice(OrderService orderservice) {
		this.orderservice = orderservice;
	}

	public OrderDetailService getOrderdetailservice() {
		return orderdetailservice;
	}

	public void setOrderdetailservice(OrderDetailService orderdetailservice) {
		this.orderdetailservice = orderdetailservice;
	}
	public String pay(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		int userid=(int)session.get("userid");
		Cart cart=(Cart)session.get("cart");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Order order=new Order();
		order.setUserid(userid);
		order.setTime(time);
		int orderid=this.orderservice.addOrder(order);
		OrderDetail orderdetail=new OrderDetail();
		int i=0;
		while(i<cart.getItem()){
			orderdetail.setOrderid(orderid);
			orderdetail.setBookid(cart.getBook(i));
			orderdetail.setNumber(cart.getNum(i));
			orderdetailservice.addOrderDetail(orderdetail);
			i++;
		}
		cart.clear();
		session.put("cart",cart);
		return "success";
}
	
}
