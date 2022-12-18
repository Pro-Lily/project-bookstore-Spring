package com.triple.webapp.dto;

public class PurchaseDTO {
	private int purchase_no;
	private int order_no; // order 테이블
	
	public int getPurchase_no() {
		return purchase_no;
	}
	public void setPurchase_no(int purchase_no) {
		this.purchase_no = purchase_no;
	} 
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}	
}
