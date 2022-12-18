package com.triple.webapp.dao.impl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.triple.webapp.dao.MemberDAO;
import com.triple.webapp.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String ns = "MemberMapper.";

	@Override
	public boolean login(MemberDTO memberDTO) {
		String id = sqlSession.selectOne(ns+"login", memberDTO);
		return (id == null) ? false : true;
	}

	@Override
	public MemberDTO viewMember(MemberDTO memberDTO) {
		return sqlSession.selectOne(ns+"viewMember", memberDTO);
	}

	
	@Override
	public void logout(HttpSession session) {
	}
	
	// 회원가입
	@Override
	public int insert(MemberDTO member) {
		int row = sqlSession.insert(ns+"insert", member);
		return row;
	}

	@Override
	public MemberDTO getMyInfo(String id) {
		return sqlSession.selectOne(ns+"getMyInfo", id);
	}

	@Override
	public int updateMyInfo(MemberDTO memberDTO) {
		return sqlSession.update(ns+"updateMyInfo", memberDTO);
	}

	@Override
	public int deleteMyInfo(MemberDTO memberDTO) {
		return sqlSession.delete(ns+"deleteMyInfo", memberDTO);
	}
	
	@Override
	public Object findUserById(String id) {
		return sqlSession.selectOne(ns +"findUserById", id);
	}


}
