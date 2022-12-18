package com.triple.webapp.dto;

import java.util.Date;

public class MemberDTO {
	private String member_id;
	private String member_pwd;
	private String member_pwd_ck;
	private String member_name;
	private String member_email;
	private int member_postno;
	private String member_address;
	private String member_detail_address;
	private String member_tel;
	private String member_role;
	private boolean member_enabled;
	private Date regdate; 
	private Date updatedate;

	
	public String getMember_detail_address() {
		return member_detail_address;
	}

	public void setMember_detail_address(String member_detail_address) {
		this.member_detail_address = member_detail_address;
	}

	public boolean isMember_enabled() {
		return member_enabled;
	}

	public void setMember_enabled(boolean member_enabled) {
		this.member_enabled = member_enabled;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_pwd_ck() {
		return member_pwd_ck;
	}

	public void setMember_pwd_ck(String member_pwd_ck) {
		this.member_pwd_ck = member_pwd_ck;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_postno() {
		return member_postno;
	}

	public void setMember_postno(int member_postno) {
		this.member_postno = member_postno;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_pwd_ck=" + member_pwd_ck
				+ ", member_name=" + member_name + ", member_email=" + member_email + ", member_postno=" + member_postno
				+ ", member_address=" + member_address + ", member_tel=" + member_tel + ", member_role=" + member_role
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	
}
