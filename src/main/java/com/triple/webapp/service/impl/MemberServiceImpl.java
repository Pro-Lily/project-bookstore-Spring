package com.triple.webapp.service.impl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.triple.webapp.dao.MemberDAO;
import com.triple.webapp.dto.MemberDTO;
import com.triple.webapp.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;

	@Override
	public boolean login(MemberDTO memberDTO, HttpSession session) {
		boolean result = memberDAO.login(memberDTO);
		if(result) {
			MemberDTO memberDTO2 = viewMember(memberDTO);
			session.setAttribute("member_id", memberDTO2.getMember_id());
			session.setAttribute("member_name", memberDTO2.getMember_name());
		}
		return result;
	}
	
	@Override
	public MemberDTO viewMember(MemberDTO memberDTO) {
		return memberDAO.viewMember(memberDTO);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public MemberDTO getMyInfo(String id) {
		return memberDAO.getMyInfo(id);
	}

	@Override
	public int updateMyInfo(MemberDTO memberDTO) {
		return memberDAO.updateMyInfo(memberDTO);
	}

	@Override
	public int deleteMyInfo(MemberDTO memberDTO) {
		return memberDAO.deleteMyInfo(memberDTO);
	}


}
