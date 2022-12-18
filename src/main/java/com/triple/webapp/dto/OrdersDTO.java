package com.triple.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrdersDTO {
	private int order_no;
	private String order_type;
	private int price;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date order_date;
	private String member_id; // member 테이블

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getOrder_type() {
		return order_type;
	}

	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "OrdersDTO [order_no=" + order_no + ", order_type=" + order_type + ", price=" + price + ", order_date="
				+ order_date + ", member_id=" + member_id + "]";
	}
	
}
