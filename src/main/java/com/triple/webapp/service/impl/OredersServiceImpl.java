package com.triple.webapp.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.triple.webapp.dao.OrdersDAO;
import com.triple.webapp.dto.OrdersDTO;
import com.triple.webapp.service.OrdersService;

@Service
public class OredersServiceImpl implements OrdersService {
	
	@Inject
	private OrdersDAO ordersDAO;

	@Override
	public List<OrdersDTO> readOrders(String id) {
		return ordersDAO.readOrders(id);
	}

	@Override
	public OrdersDTO readOrderDetail(String id) {
		return ordersDAO.readOrderDetail(id);
	}

	@Override
	public void insertOrders(OrdersDTO ordersDTO) {
		ordersDAO.insertOrders(ordersDTO);
	}
	
	
}
