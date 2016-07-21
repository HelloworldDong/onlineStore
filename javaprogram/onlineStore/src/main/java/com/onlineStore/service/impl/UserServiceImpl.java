package com.onlineStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlineStore.dao.UserDao;
import com.onlineStore.entity.User;
import com.onlineStore.page.Page;
import com.onlineStore.service.UserService;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService{


	@Autowired
	private UserDao userDao;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public User findByName(String userName) {
		return userDao.findByName(userName);
	}

	public void add(User user) {
		userDao.add(user);
	}

	public void update(User user) {
		userDao.update(user);
	}
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public User findByID(Integer userID) {
	
		return userDao.findByID(userID);
	}

	public List<User> findAll() {
		
		return userDao.findAll();
	}

	public void validate(int userID) {
		userDao.validate(userID);
		
	}
	
	public void reject(int userID){
		userDao.reject(userID);
	}

	public User search(int userID) {
		
		return userDao.search(userID);
	}

	public Page<User> findPage(Page<User> page) {
		
		 Integer conut = userDao.conut(page);
		 List<User> findpage = userDao.findpage(page);
		 page.setDatas(findpage);
		 page.setTotalrecode(conut);
		 if(page!=null){
			 page.setQuery("&username="+page.getUsername());	
		 }
		return page;
	}

}
