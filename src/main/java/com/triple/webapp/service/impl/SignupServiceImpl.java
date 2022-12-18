package com.triple.webapp.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.triple.webapp.dao.MemberDAO;
import com.triple.webapp.dto.MemberDTO;
import com.triple.webapp.service.SignupService;

@Service
public class SignupServiceImpl implements SignupService {
	
	@Resource
	private MemberDAO memberDAO;
	
	@Override
	public void join(MemberDTO member) {
		memberDAO.insert(member);
	}
	
	@Override
	public String idCheck(String id) {
		if(memberDAO.findUserById(id) == null) {
			return "YES";
		}else {
			return "NO";
		}
	}
}
