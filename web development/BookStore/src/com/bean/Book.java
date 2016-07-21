package com.bean;

public class Book {
	int book_id;
	String name;
	String author;
	int price;
	
	public Book(){}
	



	public int getBook_id() {
		return book_id;
	}



	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}


	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Book [bookid=" + book_id + ", bookname=" + name + ", author=" + author + ", price=" + price+ "]";
	}


}
