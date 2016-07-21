package com.onlineStore.service;
import com.onlineStore.entity. Goods;

import java.util.List;
public interface GoodsService {
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
