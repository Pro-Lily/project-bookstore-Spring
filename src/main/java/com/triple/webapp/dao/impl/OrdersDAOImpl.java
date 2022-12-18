package com.triple.webapp.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.triple.webapp.dao.OrdersDAO;
import com.triple.webapp.dto.OrdersDTO;

@Repository
public class OrdersDAOImpl implements OrdersDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String ns = "OrdersMapper.";

	@Override
	public List<OrdersDTO> readOrders(String id) {
		return sqlSession.selectList(ns+"readOrders", id);
	}

	@Override
	public OrdersDTO readOrderDetail(String id) {
		return sqlSession.selectOne(ns+"readOrderDetail", id);
	}

	@Override
	public void insertOrders(OrdersDTO ordersDTO) {
		sqlSession.insert(ns+"insertOrders", ordersDTO);
	}
	
	
}
