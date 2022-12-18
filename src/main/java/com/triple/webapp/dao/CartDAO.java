package com.triple.webapp.dao;

import java.util.List;

import com.triple.webapp.dto.CartDTO;

public interface CartDAO {

	List<CartDTO> readCart(String id);

	int deleteCart(CartDTO cartDTO);

	int totalPrice(String id);

}
