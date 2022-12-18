package com.triple.webapp.service;

import com.triple.webapp.dto.MemberDTO;

public interface SignupService {

	public void join(MemberDTO member);

	public String idCheck(String id);


}
