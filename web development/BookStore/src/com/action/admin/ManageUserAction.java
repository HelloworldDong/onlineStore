package com.action.admin;

import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

public class ManageUserAction extends ActionSupport {
	private int id;
	private String username;
	private String password;
	private UserService userService;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	
	public String  add() throws Exception {
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		this.userService.addUser(user);
		return SUCCESS;
	}
	public String delete() throws Exception {
		User user=new User();
		user=this.userService.searchUserById(id);
		this.userService.deleteUser(user);
		return SUCCESS;
	}
	
	public String update() throws Exception {
		User user=new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		this.userService.updateUser(user);
		return SUCCESS;
	}
}
