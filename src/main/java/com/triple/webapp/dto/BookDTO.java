package com.triple.webapp.dto;

import java.util.Date;

public class BookDTO {
	private int book_no;
	private String book_title;
	private String book_contents;
	private String book_image;
	private String author;
	private String publisher;
	private int price;
	private Date pub_date;
	private int book_hit;
	private int category_no; // category 테이블
	private int book_count;
	private String member_id;
	
	
	

	@Override
	public String toString() {
		return "BookDTO [book_no=" + book_no + ", book_title=" + book_title + ", book_contents=" + book_contents
				+ ", book_image=" + book_image + ", author=" + author + ", publisher=" + publisher + ", price=" + price
				+ ", pub_date=" + pub_date + ", book_hit=" + book_hit + ", category_no=" + category_no + ", book_count="
				+ book_count + ", member_id=" + member_id + "]";
	}

	public int getBook_count() {
		return book_count;
	}

	public void setBook_count(int book_count) {
		this.book_count = book_count;
	}

	public int getBook_hit() {
		return book_hit;
	}

	public void setBook_hit(int book_hit) {
		this.book_hit = book_hit;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	
	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_contents() {
		return book_contents;
	}

	public void setBook_contents(String book_contents) {
		this.book_contents = book_contents;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPub_date() {
		return pub_date;
	}

	public void setPub_date(Date pub_date) {
		this.pub_date = pub_date;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
