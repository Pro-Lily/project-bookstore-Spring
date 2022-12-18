package com.triple.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signin")
public class SigninController {
	private static final Logger logger = LoggerFactory.getLogger(SigninController.class);
	
	@RequestMapping("/content")
	public String content() {
		return "signin/content";
	}
	
	@GetMapping("/login")
	public String login() {
		return "signin/content";
	}
	
	@RequestMapping("/change")
	public String change() {
		return "signin/change";
	}
	
}
