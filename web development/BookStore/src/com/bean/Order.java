package com.bean;

import java.sql.Timestamp;

public class Order {
	int id;
	int userid;
	Timestamp time;

	public Order(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", userid=" + userid + ", time=" + time + "]";
	}

}
