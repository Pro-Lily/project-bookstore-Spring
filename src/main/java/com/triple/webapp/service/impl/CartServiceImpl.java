package com.triple.webapp.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.triple.webapp.dao.CartDAO;
import com.triple.webapp.dto.CartDTO;
import com.triple.webapp.service.CartService;

@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartDAO cartDAO;

	@Override
	public List<CartDTO> readCart(String id) {
		return cartDAO.readCart(id);
	}

	@Override
	public int deleteCart(CartDTO cartDTO) {
		return cartDAO.deleteCart(cartDTO);
	}

	@Override
	public int totalPrice(String id) {
		return cartDAO.totalPrice(id);
	}
	
	
}
