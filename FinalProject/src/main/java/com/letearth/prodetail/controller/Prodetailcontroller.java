package com.letearth.prodetail.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.prodetail.domain.ProReplyVO;
import com.letearth.prodetail.domain.ProReportVO;
import com.letearth.prodetail.service.ProDetailService;

@Controller
@RequestMapping("/prodetail/*")
public class Prodetailcontroller {
	
	@Inject
	private ProDetailService pdservice;

	private static final Logger mylog = LoggerFactory.getLogger(Prodetailcontroller.class);

	// http://localhost:8080/prodetail/info?pro_no=1
	/**
	 * prodetailGET
	 * 프로젝트 소개
	 * @param pro_no
	 * @throws Exception
	 */
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String prodetailGET(RedirectAttributes redirect, HttpSession session, Model model, HttpServletRequest request) throws Exception {		
		
		//파라미터, 세션값 받기
		Integer pro_no = Integer.parseInt(request.getParameter("pro_no"));
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
		
		return "prodetail/info";
	}
	
	/**
	 * infoPOST
	 * 알림, 커뮤니티 등
	 * @param redirect
	 * @param prvo
	 * @param rpvo
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public String infoPOST(RedirectAttributes redirect, ProReplyVO prvo, ProReportVO rpvo,HttpServletRequest request) throws Exception{
				
			Integer pro_no = Integer.parseInt(request.getParameter("pro_no"));
				
			if(prvo.getReply_classify() != null) {
				if(prvo.getReply_classify() == 0) {
					//판매자 공지, 사용자 댓글
					pdservice.sellNotice(prvo);
					
				}else {
					//판매자 답글 update
					pdservice.reReply(prvo);
				}
				redirect.addAttribute("pro_no", prvo.getPro_no()); 
			}
			System.out.println("@@@@@@@@@@@@@@@@" + prvo);
				
			System.out.println("@@@@@@@@@@@@@@@@" + rpvo);
				
			if(rpvo.getRep_cat() != null) {
				if(rpvo.getRep_cat() == 2) {
					//프로젝트 신고하기 insert
					pdservice.reporter(rpvo);
				}else {
					//댓글 신고하기 insert
					pdservice.reporterRp(rpvo);
				}
				redirect.addAttribute("pro_no", rpvo.getPro_no()); 					
			}
				
			return "redirect:/prodetail/info";
	}
	
	
	/**
	 * 좋아요 눌 안 눌
	 * findLike(GET)
	 */
	// http://localhost:8080/prodetail/findLike?pro_no=2&mem_id=a
	@RequestMapping(value="/findLike", method=RequestMethod.GET)
	public String findLike(Model model, HttpServletRequest request) throws Exception {
		Integer pro_no = Integer.parseInt(request.getParameter("pro_no"));
		String mem_id = request.getParameter("mem_id");
		
			LikeyVO lvo = new LikeyVO();
			lvo.setMem_id(mem_id);
			lvo.setPro_no(pro_no);
			
			Integer resultLike = pdservice.findLike(lvo);
			System.out.println(resultLike);
			model.addAttribute("resultLike", resultLike);
			// 결과가 1이 오면 좋아요 취소를 보여주고, 0이면 좋아요 버튼을 보여주면 된다. 
			
			return "/prodetail/likeAjax";
	}
	
	/**
	 * insertLike
	 * 좋아요 눌렀을 때
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	// http://localhost:8080/prodetail/insertLike?pro_no=2&mem_id=a
	@RequestMapping(value="/insertLike", method=RequestMethod.GET)
	public String insertLike(HttpServletRequest request) throws Exception {
		String mem_id = request.getParameter("mem_id");
		Integer pro_no = Integer.parseInt(request.getParameter("pro_no"));
		
			LikeyVO lvo = new LikeyVO();
			lvo.setMem_id(mem_id);
			lvo.setPro_no(pro_no);
			
			pdservice.insertLike(lvo); // 좋아요 누름
			
			return "/prodetail/likeAjax";
	}
	
	/**
	 * deleteLike
	 * 좋아요 취소
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteLike", method=RequestMethod.GET)
	public String deleteLike(HttpServletRequest request) throws Exception {
		String mem_id = request.getParameter("mem_id");
		Integer pro_no = Integer.parseInt(request.getParameter("pro_no"));
		
		LikeyVO lvo = new LikeyVO();
		lvo.setMem_id(mem_id);
		lvo.setPro_no(pro_no);
		
		pdservice.deleteLike(lvo); // 좋아요 누름
		
		return "/prodetail/likeAjax";
	}
	
	
	
	/**
	 * prodetailGET
	 * 프로젝트 소개
	 * @param pro_no
	 * @throws Exception
	 */
	// http://localhost:8080/prodetail/infoPreview?pro_no=2
	@RequestMapping(value="/infoPreview", method=RequestMethod.GET)
	public String infoPreviewGET(RedirectAttributes redirect, HttpSession session, Model model, HttpServletRequest request) throws Exception {		
		
		//파라미터, 세션값 받기
		Integer pro_no = Integer.parseInt(request.getParameter("pro_no"));
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
		
		return "prodetail/infoPreview";
	}
	
	
}
