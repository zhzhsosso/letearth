package com.letearth.prodetail.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.prodetail.service.MainService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	private static final Logger mylog = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private MainService mainService;
	
	/**
	 * 메인 페이지 (main)
	 */
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public void mainGET(Model model) throws Exception{

		List<ProDetailVO> projectList = mainService.getProjectList();
		List<ProDetailVO> popularList = mainService.getPopularProject();
		model.addAttribute("projectList", projectList);
		model.addAttribute("popularList", popularList);

	}
	/**
	 * 오픈 예정 메인 페이지 (scheall)
	 */
	@RequestMapping(value="/scheall", method=RequestMethod.GET)
	public void scheallGET(Model model) throws Exception{
		List<ProDetailVO> scheList = mainService.getScheList();
		model.addAttribute("scheList", scheList);

	}
	
	/**
	 * 오픈 예정 클래스 페이지 (scheclass)
	 */
	@RequestMapping(value="/scheclass", method=RequestMethod.GET)
	public void scheclassGET(Model model) throws Exception{
		List<ProDetailVO> scheclassList = mainService.getScheclassList();
		model.addAttribute("scheclassList", scheclassList);

	}
	
	/**
	 * 오픈 예정 상품 페이지 (scheprod)
	 */
	@RequestMapping(value="/scheprod", method=RequestMethod.GET)
	public void scheprodGET(Model model) throws Exception{
		List<ProDetailVO> scheprodList = mainService.getScheprodList();
		model.addAttribute("scheprodList", scheprodList);

	}
	
	/**
	 * 진행 중 메인 페이지 (nowall)
	 */
	@RequestMapping(value="/nowall", method=RequestMethod.GET)
	public void nowallGET(Model model) throws Exception{
		List<ProDetailVO> nowList = mainService.getNowList();
		model.addAttribute("nowList", nowList);

	}
	
	/**
	 * 진행 중 클래스 페이지 (nowclass)
	 */
	@RequestMapping(value="/nowclass", method=RequestMethod.GET)
	public void nowclassGET(Model model) throws Exception{
		List<ProDetailVO> nowclassList = mainService.getNowclassList();
		model.addAttribute("nowclassList", nowclassList);

	}
	
	/**
	 * 진행 중 상품 페이지 (nowprod)
	 */
	@RequestMapping(value="/nowprod", method=RequestMethod.GET)
	public void nowprodGET(Model model) throws Exception{
		List<ProDetailVO> nowprodList = mainService.getNowprodList();
		model.addAttribute("nowprodList", nowprodList);

	}
	
	/**
	 * 마감 메인 페이지 (endall)
	 */
	@RequestMapping(value="/endall", method=RequestMethod.GET)
	public void endallGET(Model model) throws Exception{
		List<ProDetailVO> endList = mainService.getEndList();
		model.addAttribute("endList", endList);

	}
	
	/**
	 * 마감 클래스 페이지 (endclass)
	 */
	@RequestMapping(value="/endclass", method=RequestMethod.GET)
	public void endclassGET(Model model) throws Exception{
		List<ProDetailVO> endclassList = mainService.getEndclassList();
		model.addAttribute("endclassList", endclassList);

	}
	
	/**
	 * 마감 상품 페이지 (endprod)
	 */
	@RequestMapping(value="/endprod", method=RequestMethod.GET)
	public void endprodGET(Model model) throws Exception{
		List<ProDetailVO> endprodList = mainService.getEndprodList();
		model.addAttribute("endprodList", endprodList);

	}
}
