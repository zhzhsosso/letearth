package com.letearth.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.admin.domain.AdminVO;
import com.letearth.admin.domain.SearchCriteria;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.prodetail.domain.PageVO;
import com.letearth.admin.service.AdReportService;
import com.letearth.member.domain.MemberVO;
import com.letearth.project.domain.ProjectVO;

@Controller
@RequestMapping("/report/*")
public class AdReportController {

	private static final Logger mylog 
	= LoggerFactory.getLogger(AdBoardController.class);
	
	@Inject
	private AdReportService adReportService;
	
	// http://localhost:8080/report/adRepList
	
	/**
	 * 블랙리스트 처리/리스트
	 *  adBlackModifyGET / adBlackListGET
	 */
	// http://localhost:8080/report/adBlackModify?member_id=blackmem6
	// member_status => 0: 구매회원 1: 판매회원 2: 관리자 3: 블랙리스트
	// 회원목록에서 블랙리스트 선택후에 등록하면 해당 컨트롤러로 이동
	
	@RequestMapping(value = "/adBlackModify", method = RequestMethod.GET)
	//public String adBlackModifyPOST(@RequestParam("rep_no") int rep_no,@RequestParam("rep_cat") int rep_cat, RedirectAttributes rttr) throws Exception{
	public String adBlackModifyPOST(HttpSession session, AdminVO vo, RedirectAttributes rttr) throws Exception{
								// rep_cat, pro_no, reped_id
		
		// 관리자 로그인제어
		String id = (String)session.getAttribute("mem_id");
		if(id==null) {
			return "redirect:/member/login";
		} else if(!id.equals("admin")) {
			return "redirect:/member/main";
		}
		
		Integer result;
		
		if(vo.getRep_cat() == 1) { // 타입이 회원일 때
			result = adReportService.updateBlackMem(vo);		
			if(result > 0) {
				rttr.addFlashAttribute("result", "블랙리스트회원추가");
			}
			
		}else if(vo.getRep_cat() == 2) { // 타입이 프로젝트일 때
			result = adReportService.updateBlackPro(vo);
			if(result > 0) {
				rttr.addFlashAttribute("result", "블랙리스트프젝추가");
			}
		}
		
		return "redirect:/report/adBlackList";
	}
	
	
	// 리스트 GET
	@RequestMapping(value = "/adBlackList",method = RequestMethod.GET)
	public String adBlackListGET(Criteria cri,HttpSession session,Model model) throws Exception{
		
		// 관리자 로그인제어
		String id = (String)session.getAttribute("mem_id");
		if(id==null) {
			return "redirect:/member/login";
		} else if( !id.equals("admin")) {
			return "redirect:/member/main";
		}
		
		session.setAttribute("updateCheck", true); // => 세션 존재하면 true
		
		List<AdminVO> adBlackList = adReportService.getListBlack(cri);
		
		mylog.debug("adBlackList #########$@%@%$#^$&%: " + adBlackList);
		
		// 페이징처리 하단부 정보 준비
		PageVO pvo = new PageVO();
		pvo.setCri(cri);
		mylog.debug("totalBlackCnt : " + adReportService.totalBlackCnt());
		pvo.setTotalCount(adReportService.totalBlackCnt()); // 작성되어있는 글 전체 개수
		
		model.addAttribute("pvo", pvo);
		
		// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
		model.addAttribute("adBlackList", adBlackList);
		
		// 페이지 이동(/report/adBlackList)	
		return "/report/adBlackList";
		
	}
	
	
	
	/**
	 * 신고리스트 -adRepListGET
	 * 신고상세 - adRepReadGET
	 */
	// 전체 리스트
	@RequestMapping(value = "/adRepListAll",method = RequestMethod.GET)
	public String adRepListAllGET(HttpSession session,Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		// 관리자 로그인제어
		String id = (String)session.getAttribute("mem_id");
		if(id==null) {
			return "redirect:/member/login";
		} else if( !id.equals("admin")) {
			return "redirect:/member/main";
		}
		
		session.setAttribute("updateCheck", true); // => 세션 존재하면 true
		
			List<AdminVO> adRepList = adReportService.getListAllReport(scri);
			
			// 페이징처리 하단부 정보 준비
			PageVO pvo = new PageVO();
			pvo.setCri(scri);
			mylog.debug("totalRepCnt : " + adReportService.totalRepCntAll(scri));
			pvo.setTotalCount(adReportService.totalRepCntAll(scri)); // 작성되어있는 글 전체 개수
			
			model.addAttribute("pvo", pvo);
			
			// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
			model.addAttribute("adRepList", adRepList);
			
		
		// 페이지 이동(/report/adRepList)	
		return "redirect:/report/adRepList2";
		
	}
	
	
	// http://localhost:8080/report/adRepList
	// 조회 GET
	@RequestMapping(value = "/adRepList",method = RequestMethod.GET)
	public String adRepListGET(HttpSession session,Model model, @RequestParam("rep_cat") int rep_cat,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		// 관리자 로그인제어
		String id = (String)session.getAttribute("mem_id");
		if(id==null) {
			return "redirect:/member/login";
		} else if( !id.equals("admin")) {
			return "redirect:/member/main";
		}
		
		session.setAttribute("updateCheck", true); // => 세션 존재하면 true
			
		mylog.debug("$$$$$$$$$$@@@@@@@@@@@@@@@@@@@@@@@@rep_cat 번호는 => " + rep_cat);
		
			List<AdminVO> adRepList = adReportService.getListReport(scri, rep_cat);
		
		// 페이징처리 하단부 정보 준비
				PageVO pvo = new PageVO();
				pvo.setCri(scri);
				mylog.debug("totalRepCnt : " + adReportService.totalRepCnt(scri));
				pvo.setTotalCount(adReportService.totalRepCnt(scri)); // 작성되어있는 글 전체 개수
				
				model.addAttribute("pvo", pvo);
				
				// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
				model.addAttribute("adRepList", adRepList);
		
	
		// 페이지 이동(/report/adRepList)	
		return "/report/adRepList";
		
	}

	
	// 신고상세GET
	@RequestMapping(value = "/adRepRead", method = RequestMethod.GET)
	public String adFaqReadGET(Model model, @RequestParam("rep_no") int rep_no, HttpSession session) throws Exception{
		
		// 관리자 로그인제어
		String id = (String)session.getAttribute("mem_id");
		if(id==null) {
			return "redirect:/member/login";
		} else if( !id.equals("admin")) {
			return "redirect:/member/main";
		}
		
		
		// 서비스 -> DAO (특정 글번호에 해당하는 정보 가져오기)
		AdminVO vo = adReportService.getReport(rep_no);
				
		// 연결된 뷰페이지로 정보 전달		
		model.addAttribute("vo", vo);
		
		return "/report/adRepRead";
		
	}

	// http://localhost:8080/report/adRepList
	// 검색 GET
//	@RequestMapping(value = "/adRepsList",method = RequestMethod.GET)
//	public String adRepsListGET(Criteria cri,HttpSession session,Model model, @RequestAttribute("keyword") String keyword, @RequestAttribute("type") String type) throws Exception{
//		
//		session.setAttribute("updateCheck", true); // => 세션 존재하면 true
//		
//		List<AdminVO> adRepsList = adReportService.getListReport(type, keyword, cri);
//		
//		// 페이징처리 하단부 정보 준비
//		PageVO pvo = new PageVO();
//		pvo.setCri(cri);
//		mylog.debug("totalRepCnt : " + adReportService.totalRepCnt());
//		pvo.setTotalCount(adReportService.totalRepCnt()); // 작성되어있는 글 전체 개수
//		
//		model.addAttribute("pvo", pvo);
//		
//		// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
//		model.addAttribute("adRepsList", adRepsList);
//		model.addAttribute("keyword", keyword);
//		model.addAttribute("type", type);
//		
//		
//		// 페이지 이동(/report/adRepsList)	
//		return "/report/adRepsList";
//		
//	}
	
}
