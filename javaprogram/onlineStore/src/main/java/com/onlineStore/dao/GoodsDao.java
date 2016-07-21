package com.onlineStore.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onlineStore.entity.Goods;

@Repository(value="goodsDao")
public interface GoodsDao {
	public List<Goods> show(String category);
	public List<Goods> search(String name);
	public Goods searchById(int goodsID);
	public List<Goods> findAll();
	public List<Goods> find(int goodsID);
	public void delete(int goodsID);
	public void add(Goods goods);
	public void photo(Goods goods);
	public void update(Goods goods);
}
