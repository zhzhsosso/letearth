package com.letearth.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.admin.domain.MemOrdVO;
import com.letearth.admin.service.AdMemproService;
import com.letearth.member.domain.MemberVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.prodetail.domain.PageVO;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.prodetail.domain.ProReplyVO;
import com.letearth.prodetail.service.ProDetailService;
import com.letearth.project.domain.ProjectVO;

@Controller
@RequestMapping("/mempro/*")
public class AdMemproController {
	
	private static final Logger mylog 
	= LoggerFactory.getLogger(AdBoardController.class);
	
	@Inject
	private AdMemproService adMemproService;
	private ProDetailService pdservice;
	
	
	/**
	 * 프로젝트 리스트 조회 1(상태2-4)
	 */
	//http://localhost:8080/mempro/adProList1
	@RequestMapping(value="/adProList1", method=RequestMethod.GET)
	public String adProList1GET(HttpSession session, Model model, Criteria cri) throws Exception{
		// session - id값 가져오기
		// 관리자 로그인제어
//		String id = (String)session.getAttribute("id");
//		if(id==null || !id.equals("admin")) {
//			return "redirect:member/login";
//		}
		
		// 서비스 -dao 프로젝트 목록 가져오기
		List<ProjectVO> proList = adMemproService.getListPro1(cri);
		
		
		// 페이징처리 하단부 정보 준비 -> 뷰페이지로 전달
		PageVO pvo = new PageVO();
		pvo.setCri(cri);
		mylog.debug("totalPro : "+adMemproService.totalPro1());
		System.out.println("totalPro : "+adMemproService.totalPro1());
		pvo.setTotalCount(adMemproService.totalPro1()); // 프로젝트 전체 개수
	
		
		model.addAttribute("proList",proList);
		model.addAttribute("pvo", pvo);
		
		return "/mempro/adProList1";
	}
	
	
	
	/**
	 * 프로젝트 상세조회 1
	 */
	//http://localhost:8080/mempro/adProDetail1
	@RequestMapping(value="/adProDetail1", method=RequestMethod.GET)
	public void adProDetail1GET(Model model, @RequestParam("pro_no") int pro_no, HttpSession session, OrderVO ordVO) throws Exception{
		
		ProjectVO proVO = adMemproService.getDetailPro1(pro_no);
		int memOrd = adMemproService.totalMemOrd();
		int memPro = adMemproService.totalMemPro();
		
		model.addAttribute("proVO", proVO);
		model.addAttribute("memOrd", memOrd);
		model.addAttribute("memPro", memPro);
		
		
		
	}
	
	
	
	/**
	 * 프로젝트 상세조회 1 + 프로젝트 프리뷰
	 */
	//http://localhost:8080/mempro/adProDetail1
//	@RequestMapping(value="/adProDetail1", method=RequestMethod.GET)
//	public void adProDetail1GET(RedirectAttributes redirect, HttpServletRequest request, Model model, @RequestParam("pro_no") int pro_no, HttpSession session, OrderVO ordVO) throws Exception{
//		
////		//파라미터, 세션값 받기
////		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
////		String mem_id = (String)session.getAttribute("mem_id");
////				
//		pdservice.getProIntro(pro_no);
//		pdservice.getProInfo(pro_no);
//		pdservice.getReward(pro_no);
//		
//		//특정 글번호에 해당하는 정보 가져오기
//		ProDetailVO pdvo = pdservice.getProjectDetail(pro_no);
//					
//		//판매자 공지사항, 사용자 댓글, 판매자 답글 정보 가져오기
//		List<ProReplyVO> sellNoticeList = pdservice.getsnListAll(pro_no);
//		List<ProReplyVO> userReplyList = pdservice.geturListAll(pro_no);
//		
//		
//		ProjectVO proVO = adMemproService.getDetailPro1(pro_no);
//		int memOrd = adMemproService.totalMemOrd();
//		int memPro = adMemproService.totalMemPro();
//		
//		
//		
//		// 연결된 뷰페이지로 정보 전달(model)	
//		model.addAttribute("pdvo", pdvo);
//		model.addAttribute("sellNoticeList", sellNoticeList);
//		model.addAttribute("userReplyList", userReplyList);
//		model.addAttribute("pro_no", pro_no);
//					
//		model.addAttribute("info", pdservice.getProInfo(pro_no));
//		model.addAttribute("intro", pdservice.getProIntro(pro_no));
//		model.addAttribute("reward", pdservice.getReward(pro_no));
//		
//		model.addAttribute("proVO", proVO);
//		model.addAttribute("memOrd", memOrd);
//		model.addAttribute("memPro", memPro);
//		
//		
//		
//		
//		
//	}
	
	
	
	/**
	 * 프로젝트 리스트 조회 2(상태5-7)
	 */
	//http://localhost:8080/mempro/adProList2
	@RequestMapping(value="/adProList2", method=RequestMethod.GET)
	public String adProList2GET(HttpSession session, Model model, Criteria cri) throws Exception{
		// session - id값 가져오기
		// 관리자 로그인제어
//		String id = (String)session.getAttribute("id");
//		if(id==null || !id.equals("admin")) {
//			return "redirect:member/login";
//		}
		
		// 서비스 -dao 프로젝트 목록 가져오기
		List<ProjectVO> proList = adMemproService.getListPro2(cri);
		
		// 페이징처리 하단부 정보 준비 -> 뷰페이지로 전달
		PageVO pvo = new PageVO();
		pvo.setCri(cri);
		mylog.debug("totalPro2 : "+adMemproService.totalPro2());
		pvo.setTotalCount(adMemproService.totalPro2()); // 결제리스트 전체 개수
		
		
		model.addAttribute("proList",proList);
		model.addAttribute("pvo", pvo);
		
		return "/mempro/adProList2";
	}
	
	
	
	/**
	 *  프로젝트 상세조회 2
	 */

	@RequestMapping(value="/adProDetail2", method=RequestMethod.GET)
	public void adProDetail2GET(Model model, @RequestParam("pro_no") int pro_no, HttpSession session, OrderVO ordVO) throws Exception{
		
		
		
		ProjectVO proVO = adMemproService.getDetailPro1(pro_no);
		int memOrd = adMemproService.totalMemOrd();
		int memPro = adMemproService.totalMemPro();
		List<OrderVO> ordList = adMemproService.proOrdMemList(ordVO); // 결제회원 리스트
		
		
		model.addAttribute("proVO", proVO);
		model.addAttribute("memOrd", memOrd);
		model.addAttribute("memPro", memPro);
		model.addAttribute("ordList",ordList);
		
		System.out.println("ordList  가 담기는가 확인해보자고 : 컨트롤러 "  + ordList);
		
	}	
	
	
	
	/**
	 * 배송현황 상세조회
	 */
	//http://localhost:8080/mempro/adShipDetail
	@RequestMapping(value="/adShipDetail", method=RequestMethod.GET)
	public void adShipDetailGET(HttpSession session, Model model,@RequestParam("pro_no") int pro_no) throws Exception{
		
	}
	
	
	//------------------------------------------------------------------------------------------------------------------------
	
	
	
	/**
	 * 회원 리스트
	 */
	//http://localhost:8080/mempro/adMemList
	@RequestMapping(value="/adMemList", method=RequestMethod.GET)
	public String adMemListGET(HttpSession session, Model model, Criteria cri) throws Exception{
			// session - id값 가져오기
			// 관리자 로그인제어
//			String id = (String)session.getAttribute("id");
//			if(id==null || !id.equals("admin")) {
//				return "redirect:member/login";
//			}
			///
			// 서비스 dao 회원 목록 가져오기
			List<MemberVO> memList = adMemproService.getMemList(cri);
			
			
			// 페이징처리 하단부 정보 준비
			PageVO pvo = new PageVO();
			pvo.setCri(cri);
			mylog.debug("totalMem : " + adMemproService.totalMem());
			pvo.setTotalCount(adMemproService.totalMem()); // 회원 전체 수
			
			model.addAttribute("pvo", pvo);
			model.addAttribute("memList",memList);
			System.out.println("memList : " + memList);
			
			return "/mempro/adMemList";
		
	}
	
	
	
	/**
	 * 회원 상세조회
	 */
	//http://localhost:8080/mempro/adMemDetail
	@RequestMapping(value="/adMemDetail", method=RequestMethod.GET)
	public void adMemDetailGET(HttpSession session, Model model, @RequestParam("mem_id") String mem_id, MemOrdVO moVO, ProjectVO proVO, OrderVO ordVO) throws Exception{
		
		MemberVO memVO = adMemproService.getMemDetail(mem_id);
		List<MemOrdVO> ordList = adMemproService.memOrdList(moVO);
		List<ProjectVO> proList = adMemproService.memProList(proVO);
		int memOrd = adMemproService.totalMemOrd();
		int memPro = adMemproService.totalMemPro();
		
//		mylog.debug("memVO : 매퍼에서 다 넣어졌는지 확인해보기 " + memVO);
//		System.out.println("proVO : 매퍼에서 다 넣어졌는지 확인해보기 " + memVO);
//		System.out.println("ordList : ordList가 만들어졌는가...확인해보자 " + ordList);
//		System.out.println("proList : proList가 만들어졌는가...확인해보자 " + proList);
		System.out.println("memPro : memPro가 만들어졌는가...확인해보자 " + memPro);
		System.out.println("memOrd : memOrd가 만들어졌는가...확인해보자 " + memOrd);
		
		
		
		model.addAttribute("memVO", memVO);
		model.addAttribute("ordList", ordList);
		model.addAttribute("proList", proList);
		model.addAttribute("memOrd", memOrd);
		model.addAttribute("memPro", memPro);
		
		
	}
	

	/**
	 * 회원 탈퇴
	 * GET은 따로 만들지않고 모달창에서 removeForm받은 다음 post로 보내기
	 */
	//http://localhost:8080/mempro/adMemRemove
	@RequestMapping(value="/adMemRemove", method=RequestMethod.POST)
	public String adMemRemovePOST(MemberVO memVO) throws Exception{
		
		return "redirect:/mempro/adMemList";
	}
	
	
	
	
	
	/**
	 * prodetailGET
	 * 프로젝트 소개
	 * 
	 * Prodetailcontroller 에서 가져오기
	 * 
	 */
	@RequestMapping(value="/infoPreview", method=RequestMethod.GET)
	public String infoPreviewGET(RedirectAttributes redirect, HttpSession session, Model model, HttpServletRequest request) throws Exception {		
		// 프로젝트 번호에 해당하는 정보들이 보여짐!
		//파라미터, 세션값 받기
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		String mem_id = (String)session.getAttribute("mem_id");
		
		pdservice.getProIntro(pro_no);
		pdservice.getProInfo(pro_no);
		pdservice.getReward(pro_no);
		
		//특정 글번호에 해당하는 정보 가져오기
		ProDetailVO pdvo = pdservice.getProjectDetail(pro_no);
					
		//판매자 공지사항, 사용자 댓글, 판매자 답글 정보 가져오기
		List<ProReplyVO> sellNoticeList = pdservice.getsnListAll(pro_no);
		List<ProReplyVO> userReplyList = pdservice.geturListAll(pro_no);
		
		// 연결된 뷰페이지로 정보 전달(model)	
		model.addAttribute("pdvo", pdvo);
		model.addAttribute("sellNoticeList", sellNoticeList);
		model.addAttribute("userReplyList", userReplyList);
		model.addAttribute("pro_no", pro_no);
					
		model.addAttribute("info", pdservice.getProInfo(pro_no));
		model.addAttribute("intro", pdservice.getProIntro(pro_no));
		model.addAttribute("reward", pdservice.getReward(pro_no));
		
		return "/mempro/infoPreview";
	}
	
		
	
	
	
	
	
	
	
	
	
	
}
