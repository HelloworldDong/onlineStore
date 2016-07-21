package com.action.admin;

import java.util.Map;

import com.bean.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

public class searchUserAction extends ActionSupport{
	private UserService userService;
	private int id;
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

	public String ById() throws Exception {
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("User", this.userService.searchUserById(id));	
		
		return SUCCESS;
	}

}
