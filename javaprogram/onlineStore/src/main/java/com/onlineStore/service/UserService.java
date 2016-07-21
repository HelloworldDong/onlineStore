package com.onlineStore.service;

import java.util.List;

import com.onlineStore.entity.User;
import com.onlineStore.page.Page;

public interface UserService {
	public  User findByName(String userName);
	public  User findByID(Integer userID);
	public void add(User user);
	public void update(User user);
	public List<User> findAll();
	public void validate(int userID);
	public void reject(int userID);
	public User search(int userID);
	public Page<User> findPage(Page<User> page);
	
}
