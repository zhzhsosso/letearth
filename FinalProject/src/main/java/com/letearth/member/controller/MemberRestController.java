package com.letearth.member.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.letearth.member.domain.MemberVO;
import com.letearth.member.service.MemberService;

@RestController
@RequestMapping("/members/*")
public class MemberRestController {
	
	@Inject
	private MemberService memservice;
	
	@RequestMapping(value="/chkID", method=RequestMethod.GET)
	public String checkId(MemberVO vo, @ModelAttribute("mem_id") String mem_id) throws Exception {
		System.out.println(vo + "");
		System.out.println(mem_id + "");
		
		MemberVO resultVO = memservice.getMember(mem_id);
		System.out.println(resultVO);
		
		if(resultVO == null) {
			// 해당 아이디 사용 가능
			return "OK";
		} else {
			// 해당 아이디 사용 불가능
			return "NO";
		}
		
	}
}
