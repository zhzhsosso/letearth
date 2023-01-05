package com.letearth.prodetail.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.letearth.prodetail.service.MainService;

@RestController
@RequestMapping("/mains/*")
public class MainRestController {

	@Inject
	private MainService mservice;
	
	
	/**
	 * 현재 진행 중인 프로젝트 - 최신순 정렬
	 */
	@RequestMapping(value="/recent", method=RequestMethod.GET)
	public String nowRecent(Model model) throws Exception{
		List nowList = mservice.getNowList();
		model.addAttribute("nowList", nowList);
		
		return null;
	}
	
}
