package com.onlineStore.service;

import java.util.List;

import com.onlineStore.entity.Orders;
import com.onlineStore.entity.Showorder;

public interface OrderService {
public void add(Orders order);
public List<Showorder> show(int userID);
public Orders search(int orderID);
public List<Orders> findAll();
public void validate(int id);
public void reject(int id);
public void cancel(int orderID);
}
