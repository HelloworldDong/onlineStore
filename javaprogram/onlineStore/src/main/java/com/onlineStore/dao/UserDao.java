package com.onlineStore.dao;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.onlineStore.entity.User;
import com.onlineStore.page.Page;
@Repository(value="userDao")
public interface UserDao {
	 
	public  User findByName(String userName);
	public  User findByID(Integer userID);
	public  void add(User user);
	public  void update(User user);
	public List<User> findAll();
	public List<User> findpage(Page<User> page);
	public Integer conut(Page<User> page); 
	public void validate(int userID);
	public void reject(int userID);
	public User search(int userID);
}
