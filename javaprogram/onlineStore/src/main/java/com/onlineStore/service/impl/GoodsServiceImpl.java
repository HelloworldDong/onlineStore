package com.onlineStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlineStore.dao.GoodsDao;

import com.onlineStore.entity.Goods;
import com.onlineStore.service.GoodsService;

@Service(value = "goodsService")
@Transactional
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDao goodsDao;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	 public List<Goods> show(String category){
		 return goodsDao.show(category);
	 }
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public List<Goods> search(String name) {
		
		return goodsDao.search(name);
	}

	public Goods searchById(int goodsID) {
		
		return goodsDao.searchById(goodsID);
	}

	public List<Goods> findAll() {
		
		return goodsDao.findAll();
	}

	public List<Goods> find(int goodsID) {
		
		return goodsDao.find(goodsID);
	}

	public void delete(int goodsID) {
		goodsDao.delete(goodsID);
		
	}

	public void add(Goods goods) {
		goodsDao.add(goods);

	}

	public void photo(Goods goods) {
	goodsDao.photo(goods);	
	}

	public void update(Goods goods) {
		goodsDao.update(goods);
		
	}
}
