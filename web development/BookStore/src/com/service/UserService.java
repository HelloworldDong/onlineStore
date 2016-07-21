package com.service;

import java.util.List;

import com.bean.User;

public interface UserService {
	public void addUser(User user);

	public void deleteUser(User user);

	public void updateUser(User user);

	public User searchUserByName(String username);

	public User searchUserById(int id);

	public List<User> listAllUsers();

	public boolean isUser(String username, String password);
}
