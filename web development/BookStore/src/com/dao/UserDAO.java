package com.dao;

import java.util.List;

import com.bean.User;

public interface UserDAO {
	public void addUser(User user);

	public void deleteUser(User user);

	public void updateUser(User user);

	public User searchUserByName(String username);

	public User searchUserById(int id);

	public List<User> listAllUsers();
}
