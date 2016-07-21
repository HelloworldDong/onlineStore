package com.onlineStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineStore.dao.CartDao;
import com.onlineStore.entity.Cart;
import com.onlineStore.entity.Showcart;
import com.onlineStore.service.CartService;

@Service(value = "cartService")
@Transactional
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao cartDao;
	
	public void add(Cart cart) {
		cartDao.add(cart);
		
	}

	public Cart search(Cart cart) {
		
		return cartDao.search(cart);
	}

	public void update(Cart cart) {
		cartDao.update(cart);
		
	}

	public List<Showcart> show(int userid) {
		
		return cartDao.show(userid);
	}

	public void delete(int goodsID) {
		cartDao.delete(goodsID);
		
	}

	public List<Cart> findAll(int userID) {
		return cartDao.findAll(userID);
		 
	}

	public void clear(int userID) {
		cartDao.clear(userID);
		
	}

}
