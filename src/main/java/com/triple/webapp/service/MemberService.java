package com.triple.webapp.service;

import javax.servlet.http.HttpSession;

import com.triple.webapp.dto.MemberDTO;

public interface MemberService {
	public boolean login(MemberDTO memberDTO, HttpSession session);
	public MemberDTO viewMember(MemberDTO memberDTO);
	public void logout(HttpSession session);
	public MemberDTO getMyInfo(String id);
	public int updateMyInfo(MemberDTO memberDTO);
	public int deleteMyInfo(MemberDTO memberDTO);
}
