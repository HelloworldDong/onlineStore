package com.action;

import java.util.*;
import java.io.*;

import com.bean.User;
import com.bean.Cart;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

public class UserAction extends ActionSupport {

	private String username;
	private String password;
	private UserService userService;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String login() {
		String adminname = "admin";
		String value=null;
		if (userService.isUser(username, password)) {
			User user =new User();
			user=this.userService.searchUserByName(username);
			Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("username",username );
			session.put("userid", user.getId());
			if (username.equals(adminname))
				value= "admin";
			else{
				value= "success";
				Cart cart=new Cart();
				session.put("cart",cart);
			}
		} else
			value= "fail";
		return value;
	}
	
	public String logout() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("username","" );
		return "success";
	}
	
	public String register() {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		this.userService.addUser(user);
		return "success";
	}
	
}
