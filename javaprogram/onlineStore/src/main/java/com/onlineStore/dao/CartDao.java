package com.onlineStore.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onlineStore.entity.Cart;
import com.onlineStore.entity.Showcart;

@Repository(value="cartDao")
public interface CartDao {
	public void add(Cart cart);
	 public Cart search(Cart cart);
	 public void update(Cart cart);
	public List<Showcart> show(int userid);
	public void delete(int goodsID);
	public List<Cart> findAll(int userID);
	public void clear(int userID);
}
