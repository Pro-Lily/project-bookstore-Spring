package com.triple.webapp.service;

import java.util.List;

import com.triple.webapp.dto.OrdersDTO;

public interface OrdersService {

	List<OrdersDTO> readOrders(String id);

	OrdersDTO readOrderDetail(String id);

	void insertOrders(OrdersDTO ordersDTO);

}
