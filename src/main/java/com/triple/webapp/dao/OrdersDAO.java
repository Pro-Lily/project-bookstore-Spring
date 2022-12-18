package com.triple.webapp.dao;

import java.util.List;

import com.triple.webapp.dto.OrdersDTO;

public interface OrdersDAO {

	List<OrdersDTO> readOrders(String id);

	OrdersDTO readOrderDetail(String id);

	void insertOrders(OrdersDTO ordersDTO);

}
