package com.triple.webapp.service;

import java.util.List;

import com.triple.webapp.dto.CartDTO;

public interface CartService {

	List<CartDTO> readCart(String id);

	int deleteCart(CartDTO cartDTO);

	int totalPrice(String id);

}
