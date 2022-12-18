package com.triple.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.triple.webapp.dto.MemberDTO;
import com.triple.webapp.service.SignupService;

@Controller
@RequestMapping("/signup")
public class SignupController {
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	@Inject
	private SignupService service;
	
	@RequestMapping("/signup")
	public String signup() {
		return "signup/signup";
	}
	
	@PostMapping("/signupform")
	public String signupform(MemberDTO member, Model model) {
		// PasswordEncoding
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodePassword = passwordEncoder.encode(member.getMember_pwd());
		
		member.setMember_pwd(encodePassword);
		member.setMember_pwd_ck(encodePassword);
		
		member.setMember_role("ROLE_USER");
		member.setMember_enabled(true); // 값이 1 (계정 활성화)
		
		model.addAttribute("member", member);
		service.join(member);
		
		return "redirect:/";
	}
	
	@GetMapping("idCheck")
	public void idck(String id, HttpServletResponse response) throws IOException {
		System.out.println(id);
		String str = service.idCheck(id);
		System.out.println(str);
		
		JSONObject json = new JSONObject();
		json.put("result", "success");
		json.put("str", str);
		String jsonstr = json.toString();
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonstr);
		out.flush();
		out.close();
	}
}
