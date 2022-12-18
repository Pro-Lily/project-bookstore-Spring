package com.triple.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("intro")
public class IntroController {
	private static final Logger logger = LoggerFactory.getLogger(IntroController.class);
	
	@RequestMapping("/intro_detail")
	public String intro() {
		logger.info("실행");
		return "intro/intro_detail";
	}
}
