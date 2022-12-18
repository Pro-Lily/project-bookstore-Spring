package com.triple.webapp.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.triple.webapp.dto.MemberDTO;
import com.triple.webapp.dto.ScriptDTO;
import com.triple.webapp.service.MemberService;
import com.triple.webapp.service.ScriptService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Inject
	private MemberService memberService;
	@Inject
	private ScriptService scriptService;

	@RequestMapping("/mypage_detail")
	public String mypage() {
		logger.info("실행");
		return "mypage/mypage_detail";
	}

	@RequestMapping("/myInfo/{id}")
	public String myInfo(@PathVariable(value = "id") String id, Model model) {
		logger.info("myInfo 실행");
		MemberDTO memberDTO = memberService.getMyInfo(id);
		model.addAttribute("readMyInfo", memberDTO);
		return "mypage/myInfo";
	}

	@RequestMapping("/update_myInfo/{id}")
	public String update_myInfo(@PathVariable(value = "id") String id, Model model) {
		logger.info("update_myInfo 실행");
		MemberDTO memberDTO = memberService.getMyInfo(id);
		model.addAttribute("readMyInfo", memberDTO);
		return "mypage/update_myInfo";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberDTO memberDTO, Model model) {
		logger.info("update 실행");

		String my_pwd = memberService.getMyInfo(memberDTO.getMember_id()).getMember_pwd();
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if (passwordEncoder.matches(memberDTO.getMember_pwd(), my_pwd)) {
			int ok = memberService.updateMyInfo(memberDTO);
			if (ok == 1)
				return "redirect:/mypage/myInfo/"+memberDTO.getMember_id();
		} else {
			logger.info("비밀번호 불일치");
		}
		return "mypage/fail";
	}

	@RequestMapping("/delete_myInfo/{id}")
	public String delete_myInfo(@PathVariable(value = "id") String id) {
		logger.info("delete_myInfo 실행");
		return "mypage/delete_myInfo";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberDTO memberDTO, HttpSession session) {
		logger.info("delete 실행");
		String my_pwd = memberService.getMyInfo(memberDTO.getMember_id()).getMember_pwd();
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if (passwordEncoder.matches(memberDTO.getMember_pwd(), my_pwd)) {
			int ok = memberService.deleteMyInfo(memberDTO);
			if (ok == 1) {
				session.invalidate();
				return "redirect:delete_ok";
			}
		} else {
			logger.info("비밀번호 불일치");
		}
		return "mypage/fail";
	}

	@RequestMapping("/delete_ok")
	public String delete_ok() {
		return "mypage/delete_ok";
	}
	
	@RequestMapping("/myScript/{id}")
	public String myScript(@PathVariable(value = "id") String id, Model model) {
		logger.info("myScript 실행");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<ScriptDTO> myScripts = scriptService.getMyScripts(map);
		model.addAttribute("myScripts", myScripts);
		return "mypage/myScript";
	}

}
