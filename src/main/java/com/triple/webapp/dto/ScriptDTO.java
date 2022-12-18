package com.triple.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class ScriptDTO {
	private int script_no;
	private String script_title;
	private String script_contents;
	private String script_image;
	private String author;
	private int category_no; // category 테이블
	private String member_id; // member 테이블
	private int script_hit;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date script_date;
	private MultipartFile uploadFile;

	public Date getScript_date() {
		return script_date;
	}

	public void setScript_date(Date script_date) {
		this.script_date = script_date;
	}

	public int getScript_hit() {
		return script_hit;
	}

	public void setScript_hit(int script_hit) {
		this.script_hit = script_hit;
	}

	public int getScript_no() {
		return script_no;
	}

	public void setScript_no(int script_no) {
		this.script_no = script_no;
	}

	public String getScript_title() {
		return script_title;
	}

	public void setScript_title(String script_title) {
		this.script_title = script_title;
	}

	public String getScript_contents() {
		return script_contents;
	}

	public void setScript_contents(String script_contents) {
		this.script_contents = script_contents;
	}

	public String getScript_image() {
		return script_image;
	}

	public void setScript_image(String script_image) {
		this.script_image = script_image;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
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

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "ScriptDTO [script_no=" + script_no + ", script_title=" + script_title + ", script_contents="
				+ script_contents + ", script_image=" + script_image + ", author=" + author + ", category_no="
				+ category_no + ", member_id=" + member_id + ", script_hit=" + script_hit + ", script_date="
				+ script_date + "]";
	}
	
}
