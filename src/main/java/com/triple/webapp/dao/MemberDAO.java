package com.triple.webapp.dao;

import javax.servlet.http.HttpSession;

import com.triple.webapp.dto.MemberDTO;

public interface MemberDAO {
	public boolean login(MemberDTO memberDTO);
	public MemberDTO viewMember(MemberDTO memberDTO);
	public void logout(HttpSession session);
	public int insert(MemberDTO member);
	public MemberDTO getMyInfo(String id);
	public int updateMyInfo(MemberDTO memberDTO);
	public int deleteMyInfo(MemberDTO memberDTO);
	public Object findUserById(String id);
}
