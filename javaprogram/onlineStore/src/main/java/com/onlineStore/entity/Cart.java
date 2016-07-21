package com.onlineStore.entity;

public class Cart {
private int userID;
private int goodsID;
private int number;
private int installment;
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


}
