package com.onlineStore.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onlineStore.entity.Orders;
import com.onlineStore.entity.Showorder;

@Repository(value="orderDao")

public interface OrderDao {
public void add(Orders order);
public List<Showorder> show(int userID);
public Orders search(int userID);
public List<Orders> findAll();
public void validate(int id);
public void reject(int id);
public void cancel(int orderID);

}
