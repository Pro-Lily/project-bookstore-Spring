package com.triple.webapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.triple.webapp.dto.CartDTO;
import com.triple.webapp.dto.OrdersDTO;
import com.triple.webapp.dto.ScriptDTO;
import com.triple.webapp.service.CartService;
import com.triple.webapp.service.OrdersService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Inject
	private CartService cartService;
	
	// 장바구니 목록 보기
	@RequestMapping("/cart_detail/{id}")
	public String cart(@PathVariable(value="id") String id, Model model) {
		List<CartDTO> cartDTO = cartService.readCart(id);
		int total_price = cartService.totalPrice(id);
		model.addAttribute("cardRead", cartDTO);
		model.addAttribute("total_price", total_price);
		return "cart/cart_detail";
	}
	
	// 장바구니 상품 삭제
	@RequestMapping("/cart_delete/{id}/{cart_no}")
	public String delete(CartDTO cartDTO, @PathVariable(value="cart_no") int cart_no, @PathVariable(value="id") String id, Model model) {
		int ok = cartService.deleteCart(cartDTO);
		if(ok == 1) {
			return "redirect:/cart/cart_detail/" + id;
		} else {
			return "redirect:/";
		}
	}
	
}
