package com.letearth.notice.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.notice.domain.NoticeVO;
import com.letearth.notice.service.NoticeService;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.prodetail.domain.PageVO;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger mylog = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService noticeService;

	/**
	 * 공지사항 / 이벤트 글쓰기
	 */
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void noticeRegistGET() throws Exception{
		mylog.debug(" /notice/regist(GET) 호출 -> 페이지 이동 ");
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String noticeRegistPOST(NoticeVO vo, RedirectAttributes rttr,HttpSession session) throws Exception{
		mylog.debug(" /notice/regist(POST) 호출 ");
		mylog.debug(" GET방식의 데이터 전달 -> DB 저장 -> 페이지 이동 ");
		
		mylog.debug(vo.toString());
		
		noticeService.insertNotice(vo);		
		
		mylog.debug(" 공지사항 글쓰기 완료 ");
		
		rttr.addFlashAttribute("result", "createOK");
		
		return "redirect:/notice/main";

	}
	
	// http://localhost:8080/notice/main
	
	/**
	 * 메인 페이지 - list (main)
	 */
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String noticeMainGET(HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{
	
		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);
		
		List<NoticeVO> noticeList = noticeService.getNoticeList();	
		
		model.addAttribute("noticeList", noticeList);
		
		return "/notice/main";
	}
	
	/**
	 * 메인 페이지 - listPage (main)
	 */
//	@RequestMapping(value="/main", method=RequestMethod.GET)
//	public String listPageMainGET(Criteria cri, HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{
//	
//		// 세션객체 - 글 조회수 증가 체크정보
//		session.setAttribute("updateCheck", true);
//		
//		List<NoticeVO> noticeList = noticeService.getListPage(cri);
//		PageVO pvo = new PageVO();
//		pvo.setCri(cri);
//		pvo.setTotalCount(20);
//		model.addAttribute("pvo", pvo);		
//		
//		model.addAttribute("noticeList", noticeList);
//		
//		return "/notice/main";
//	}
	
	
	/**
	 * 상세 페이지
	 */
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void readGET(Model model, @RequestParam("not_no") int not_no, HttpSession session) throws Exception{
		boolean isUpdateCheck = (boolean) session.getAttribute("updateCheck");
		
		if(isUpdateCheck) {
			noticeService.updateViewcnt(not_no);
			session.setAttribute("updateCheck", !isUpdateCheck);
		}
		
		NoticeVO vo = noticeService.getNotice(not_no);
		model.addAttribute("vo", vo);
	}
	
	/**
	 * 수정 페이지
	 */
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int not_no, Model model) throws Exception{
		
		model.addAttribute("vo", noticeService.getNotice(not_no));

	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(NoticeVO vo, RedirectAttributes rttr) throws Exception{
		Integer result = noticeService.updateNotice(vo);
		mylog.debug("수정결과 : "+ result);
		
		if(result > 0) {
			rttr.addFlashAttribute("result", "modOK");
		}
		
		return "redirect:/notice/main";
	}
	
	/**
	 * 글 삭제하기
	 */
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String removePOST(int not_no, RedirectAttributes rttr) throws Exception{
		noticeService.deleteNotice(not_no);
		rttr.addFlashAttribute("result", "delOK");
		
		return "redirect:/notice/main";
	}
	
	/**
	 * 메인 페이지 - 공지 (all)
	 */
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public void noticeAllGET(Criteria cri, HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{
		
		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);
		
		List<NoticeVO> noticeAllList = noticeService.getAllListPage(cri);
		PageVO pvo = new PageVO();
		pvo.setCri(cri);
		pvo.setTotalCount(10);
		model.addAttribute("pvo", pvo);
		
		model.addAttribute("noticeAllList", noticeAllList);

	}
	
	/**
	 * 메인 페이지 - 이벤트 (event)
	 */
	@RequestMapping(value="/event", method=RequestMethod.GET)
	public void noticeEventGET(Criteria cri, HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{

		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);
		
		List<NoticeVO> noticeEventList = noticeService.getEventListPage(cri);
		PageVO pvo = new PageVO();
		pvo.setCri(cri);
		pvo.setTotalCount(10);
		model.addAttribute("pvo", pvo);
		
		model.addAttribute("noticeEventList", noticeEventList);
				
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
