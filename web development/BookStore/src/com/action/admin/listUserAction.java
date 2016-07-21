package com.action.admin;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

public class listUserAction extends ActionSupport {
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("users", this.userService.listAllUsers());
		return SUCCESS;
	}
}
