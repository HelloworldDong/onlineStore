package com.bean;

public class OrderDetail {
	int orderid;
	int bookid;
	int number;
	public OrderDetail() {
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	@Override
	public String toString() {
		return "OrderDetail [orderid=" + orderid + ", bookid=" + bookid + "]";
	}

	

	

}
