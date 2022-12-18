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

import com.triple.webapp.dto.CartDTO;
import com.triple.webapp.dto.MemberDTO;
import com.triple.webapp.dto.OrdersDTO;
import com.triple.webapp.service.CartService;
import com.triple.webapp.service.MemberService;
import com.triple.webapp.service.OrdersService;

@Controller
@RequestMapping("orders")
public class OrdersController {
	
	@Inject
	private OrdersService ordersService;
	@Inject
	private CartService cartService;
	@Inject
	private MemberService memberService;
	
	@RequestMapping("/order_detail/{id}")
	public String order(@PathVariable(value="id") String id, Model model) {
		OrdersDTO order = ordersService.readOrderDetail(id);
		List<CartDTO> cartDTO = cartService.readCart(id);
		MemberDTO memberDTO = memberService.getMyInfo(id);
		model.addAttribute("order", order);
		model.addAttribute("cardRead", cartDTO);
		model.addAttribute("readMyInfo", memberDTO);
		return "orders/order_detail";
	}
	
	@RequestMapping("/myOrders/{id}")
	public String myOrders(@PathVariable(value="id") String id, Model model) {
		List<OrdersDTO> ordersDTO = ordersService.readOrders(id);
		model.addAttribute("MyOrders", ordersDTO);
		return "orders/myOrders";
	}
	
	// 주문서 등록
		@RequestMapping(value="/insertOrders/{id}", method=RequestMethod.POST)
		public String insertOrders(OrdersDTO ordersDTO, @PathVariable(value="id") String id) {
			ordersService.insertOrders(ordersDTO);
			return "redirect:/orders/order_detail/" + id;
		}
}
