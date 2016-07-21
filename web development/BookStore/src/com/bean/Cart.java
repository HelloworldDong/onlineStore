package com.bean;

public class Cart {
private int bookID[];
private int num[];
private int item;
private int limit;

 public Cart(){
	this.item=0;
	this.limit=100;
	this.bookID=new int[limit];
	this.num=new int[limit];
}
private  int exist(int id)
{
	for(int i =0;i<item;i++){
		if(bookID[i]==id)
			return i;
	}
	return -1;
	
}
public void addToCart(int id,int n){
	if(exist(id)>-1){
		num[exist(id)]+=n;
	}
	else{
	this.item+=1;
	this.bookID[item-1]=id;
	this.num[item-1]=n;
	}
}
public int getItem(){
	return item;
}

public int getBook(int i){
	return bookID[i];
}
public int getNum(int i){
	return num[i];
}

public void clear(){
	this.item=0;
}
}
