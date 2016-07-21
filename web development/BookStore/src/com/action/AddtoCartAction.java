package com.action;

import java.util.Map;

import com.bean.Cart;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddtoCartAction extends ActionSupport {
	private int id;
	private int number;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
	@Override
	public String execute(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		Cart cart=(Cart)session.get("cart");
		cart.addToCart(id, number);
		session.put("cart", cart);
		return "success";
	}
	
}
