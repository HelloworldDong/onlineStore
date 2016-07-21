package com.onlineStore.entity;

import java.sql.Timestamp;

public class Orders {
private int orderID;
private int userID;
private int goodsID;
private int number;
private int installment;
private double perIns;
private Timestamp orderTime;
private Timestamp lastTime;
private int status;
private String address;
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public int getOrderID() {
	return orderID;
}
public void setOrderID(int orderID) {
	this.orderID = orderID;
}
public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public int getGoodsID() {
	return goodsID;
}
public void setGoodsID(int goodsID) {
	this.goodsID = goodsID;
}
public int getNumber() {
	return number;
}
public void setNumber(int number) {
	this.number = number;
}
public int getInstallment() {
	return installment;
}
public void setInstallment(int installment) {
	this.installment = installment;
}
public double getPerIns() {
	return perIns;
}
public void setPerIns(double perIns) {
	this.perIns = perIns;
}
public Timestamp getOrderTime() {
	return orderTime;
}
public void setOrderTime(Timestamp orderTime) {
	this.orderTime = orderTime;
}
public Timestamp getLastTime() {
	return lastTime;
}
public void setLastTime(Timestamp lastTime) {
	this.lastTime = lastTime;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}


}
