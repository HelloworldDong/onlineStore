package com.service.impl;

import java.util.List;

import com.bean.User;
import com.dao.UserDAO;
import com.service.UserService;

public class UserServiceImpl implements UserService {

	public UserServiceImpl() {
	}

	private UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void addUser(User user) {
		this.userDAO.addUser(user);
	}

	public void deleteUser(User user) {
		this.userDAO.deleteUser(user);
	}

	public void updateUser(User user) {
		this.userDAO.updateUser(user);
	}

	public User searchUserByName(String name) {
		return this.userDAO.searchUserByName(name);
	}

	public User searchUserById(int id) {
		return this.userDAO.searchUserById(id);
	}

	public List<User> listAllUsers() {
		return this.userDAO.listAllUsers();
	}

	public boolean isUser(String username, String password) {
		User userTmp = userDAO.searchUserByName(username);
		if (userTmp != null){
			if (password.equals(userTmp.getPassword()))
				return true;
			else
				return false;
		}
		else return false;
	}
}
