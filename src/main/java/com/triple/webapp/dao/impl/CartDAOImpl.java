package com.triple.webapp.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.triple.webapp.dao.CartDAO;
import com.triple.webapp.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String ns = "CartMapper.";

	@Override
	public List<CartDTO> readCart(String id) {
		return sqlSession.selectList(ns+"readCart", id);
	}

	@Override
	public int deleteCart(CartDTO cartDTO) {
		return sqlSession.delete(ns+"deleteCart", cartDTO);
	}

	@Override
	public int totalPrice(String id) {
		return sqlSession.selectOne(ns+"totalPrice", id);
	}
	
	
}
