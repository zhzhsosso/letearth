package com.letearth.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.member.domain.MemberVO;
import com.letearth.member.domain.PlusVO;
import com.letearth.member.service.MemberService;
import com.letearth.notice.domain.NoticeVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProReplyVO;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Inject
	private MemberService memService;
	
	private static final Logger mylog = LoggerFactory.getLogger(MemberController.class);
	
	// http://localhost:8080/mypage/mypage
	// http://localhost:8080/member/login
	/**
	 * 마이페이지 이동
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageGET(HttpSession session, Model model, PlusVO plusVO, MemberVO memVO) throws Exception {
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "/member/login";
		}
		
		memVO.setMem_id(mem_id);
		plusVO.setMem_id(mem_id);
		memVO = memService.getMember(memVO);
		
		model.addAttribute("memVO", memVO);
		
		mylog.debug("마이페이지 이동!");

		return "/mypage/mypage";
	}

	/**
	 * 내정보 이동
	 */
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public void myInfoGet(HttpSession session, Model model, PlusVO plusVO, MemberVO memVO) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		
		memVO.setMem_id(mem_id);
		memVO = memService.getMember(memVO);
		mylog.debug("myInfo: 회원정보 저장 완료!");
		mylog.debug("myInfo: 내 정보 탭 이동!");
		
		model.addAttribute("memVO", memVO);
	}
	
	/**
	 * 회원정보 수정 (GET)
	 */
	@RequestMapping(value = "/myModify", method = RequestMethod.GET)
	public void myModifyGET(HttpSession session, MemberVO memVO, Model model) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
				
		memVO.setMem_id(mem_id);
		memVO = memService.getMember(memVO);
		mylog.debug("myModify: 회원정보 저장 완료!");
		mylog.debug("myModify: 회원 정보 수정 페이지 이동!");
		
		model.addAttribute("memVO", memVO);		
	}
	
	/**
	 * 회원정보 수정 (POST)
	 */
	@ResponseBody
	@RequestMapping(value = "/myModify", method = RequestMethod.POST)
	public void myModifyPOST(@RequestParam("mem_id") String mem_id,
								@RequestParam("mem_phone") String mem_phone,
								@RequestParam("mem_name") String mem_name,
								@RequestParam("mem_email") String mem_email,
								MemberVO memVO) throws Exception {
		
		mylog.debug("휴대폰: " + mem_phone);
		
		memVO.setMem_id(mem_id);
		memVO.setMem_phone(mem_phone);
		memVO.setMem_name(mem_name);
		memVO.setMem_email(mem_email);
		
		memService.myModify(memVO);
		mylog.debug("myModify: 회원정보 수정 완료!");
	}
	
	/**
	 * 비밀번호 확인
	 */
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public Integer passChk(@RequestParam("mem_pw") String mem_pw, HttpSession session, MemberVO memVO) throws Exception {
		
		memVO.setMem_id((String) session.getAttribute("mem_id"));
		memVO.setMem_pw(mem_pw);
		
		Integer result = memService.passChk(memVO);
		mylog.debug("passChk: 비밀번호 확인 완료 ! : " + result);
		
		return result;
	}
	
	/**
	 * 회원 탈퇴
	 */
	@ResponseBody
	@RequestMapping(value = "/myDelete", method = RequestMethod.POST)
	public void myDeletePOST(@RequestParam("mem_pw") String mem_pw,RedirectAttributes rttr,HttpSession session, MemberVO memVO) throws Exception {
		
		String mem_id = (String) session.getAttribute("mem_id");
		memVO.setMem_pw(mem_pw);
		memVO.setMem_id(mem_id);
		
		memService.myDelete(memVO);
		session.invalidate();
		mylog.debug("myDelete: 회원 탈퇴 완료! + 세션 초기화 완료!");
	}
	
	// http://localhost:8080/mypage/myProject
	/**
	 * 나의 프로젝트 이동
	 */
	@RequestMapping(value = "/myProject", method = RequestMethod.GET)
	public void myProjectGet(HttpSession session, Model model, PlusVO plusVO, MemberVO memVO) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		
		plusVO.setMem_id(mem_id);
		model.addAttribute("proList", memService.getProject(plusVO));
		mylog.debug("myProject: 나의 프로젝트 조회 완료!");
		mylog.debug("myProject: 나의 프로젝트 탭 이동!");
	}
	
	/**
	 * 펀딩 프로젝트 이동
	 */
	@RequestMapping(value = "/myFunding", method = RequestMethod.GET)
	public void myFundingGET(HttpSession session, PlusVO plusVO, Model model) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		
		plusVO.setMem_id(mem_id);
		model.addAttribute("ordList", memService.getOrder(plusVO));
		mylog.debug("myFunding: 펀딩 프로젝트 조회 완료!");
		mylog.debug("myFunding: 펀딩 프로젝트 탭 이동!");
	}
	
	/**
	 * 주문 상세내역
	 */
	@RequestMapping(value = "/myFunDetail", method = RequestMethod.GET)
	public void myFunDetailGET(HttpSession session, OrderVO ordVO, Model model) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		
		mylog.debug("주문번호: " + ordVO.getOrder_no());
		ordVO.setMem_id(mem_id);
		model.addAttribute("detailOrder", memService.detailOrder(ordVO));
		
		mylog.debug("myFunDetail: 주문 상세내역 조회 완료! + 상세내역 이동");
	}
	
	/**
	 * 주문취소
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public void deleteOrderPOST(@RequestParam("order_no") Integer order_no,
								HttpSession session, OrderVO ordVO) throws Exception {
	
		String mem_id = (String) session.getAttribute("mem_id");
		
		mylog.debug("주문번호: " + ordVO.getOrder_no());
		ordVO.setMem_id(mem_id);
		ordVO.setOrder_no(order_no);
		
		memService.deleteOrder(ordVO);
		
		mylog.debug("deleteOrder: 주문 취소 완료!");
		
	}
	
	/**
	 * 관심 프로젝트 불러오기
	 */
	@RequestMapping(value = "/myLike", method = RequestMethod.GET)
	public void myLikeGET(HttpSession session, PlusVO plusVO, Model model) throws Exception {
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		plusVO.setMem_id(mem_id);
		
		model.addAttribute("likey", memService.getLikey(plusVO));
		mylog.debug("myLike: 관심 프로젝트 저장 완료!");
		mylog.debug("myLike: 관심 프로젝트 탭 이동!");
	}
	
	/**
	 * 관심 프로젝트 삭제
	 */
	@ResponseBody
	@RequestMapping(value = "/myLike", method = RequestMethod.POST)
	public void deleteMyLikeGET(@RequestParam("like_no") Integer like_no, LikeyVO likVO) throws Exception {
		likVO.setLike_no(like_no);
		
		memService.deleteMyLike(likVO);
		mylog.debug("myLike: 관심 프로젝트 삭제 완료!");
		mylog.debug("myLike: 관심 프로젝트 탭 이동!");
	}
	
	/**
	 * 댓글 불러오기
	 */
	@RequestMapping(value = "/myReply", method = RequestMethod.GET)
	public void myReplyGET(HttpSession session, ProReplyVO repVO, Model model) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		
		repVO.setMem_id(mem_id);
		
		model.addAttribute("reply", memService.getReply(repVO));
		model.addAttribute("cnt",memService.getReplyCnt(repVO));
		mylog.debug("myReply: 댓글 정보 저장 완료!");
		mylog.debug("myReply: 댓글 탭 이동!");
	}
	
	/**
	 * 댓글 삭제 
	 */
	@RequestMapping(value = "/myReply", method = RequestMethod.POST)
	public void myReplyPOST(@RequestParam("reply_no") Integer reply_no, ProReplyVO repVO) throws Exception {
		repVO.setReply_no(reply_no);
		
		memService.deleteMyReply(repVO);
		mylog.debug("myReply: 댓글 삭제 완료!");
		mylog.debug("myReply: 댓글 탭 이동!");
	}
	
	/**
	 * qna (GET)
	 */
	@RequestMapping(value = "/myQna", method = RequestMethod.GET)
	public void myQnaGET(HttpSession session, NoticeVO notVO, Model model) throws Exception {
		
		String mem_id = (String) session.getAttribute("mem_id");
		notVO.setMem_id(mem_id);
		
		model.addAttribute("notVO", memService.getQna(notVO));
		model.addAttribute("cnt", memService.getQnaCnt(notVO));
		
		mylog.debug("myQna: 1:1 문의 저장 완료!");
		mylog.debug("myQna: 1:1 문의 탭 이동!");

	}
	
	/**
	 * qna (POST)
	 */
	@ResponseBody
	@RequestMapping(value = "/myQna", method = RequestMethod.POST)
	public void myQnaPOST(@RequestParam("not_middle") Integer not_middle,
							@RequestParam("not_title") String not_title,
							@RequestParam("not_content") String not_content,
							HttpSession session, NoticeVO notVO) throws Exception {
		
		String mem_id = (String) session.getAttribute("mem_id");
		notVO.setMem_id(mem_id);
		notVO.setNot_middle(not_middle);
		notVO.setNot_title(not_title);
		notVO.setNot_content(not_content);
		
		memService.insertQna(notVO);
		
		mylog.debug("myQna: 1:1 문의 작성 완료!");
		mylog.debug("myQna: 생성된 qna 번호: " + notVO.getNot_no());
		
		memService.updateQna(notVO);
	}
	
	/**
	 * qna 삭제
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteQna", method = RequestMethod.POST)
	public void deleteQnaPOST(@RequestParam("not_no") Integer not_no,HttpSession session, NoticeVO notVO) throws Exception {
		
		String mem_id = (String) session.getAttribute("mem_id");
		notVO.setNot_no(not_no);
		
		memService.deleteQna(notVO);
		
		mylog.debug("myQna: 1:1 문의 삭제 완료!");
	}
	
}
