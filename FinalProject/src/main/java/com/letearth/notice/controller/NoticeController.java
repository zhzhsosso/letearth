package com.letearth.notice.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sonatype.aether.spi.io.FileProcessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.notice.domain.NoticeCriteria;
import com.letearth.notice.domain.NoticePageVO;
import com.letearth.notice.domain.NoticeVO;
import com.letearth.notice.service.NoticeService;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	
	private static final String FILE_PATH = "e:\\FileAdd";
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
	public ModelAndView uploadPro(MultipartHttpServletRequest multi) throws Exception {
		
		// 한글처리
		multi.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장
		Map map = new HashMap();
		
		// 전달된 파라미터의 이름들을 모두 저장
		Enumeration enu = multi.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			//mylog.debug(name);
			String value = multi.getParameter(name);
			map.put(name, value);
		}
		mylog.debug(map+"");
		// 파일정보 제외한 파라미터 정보 모두 저장
		///////////////////////////////////////////////////////
		// 파일정보 처리 
		List<String> fileList = fileProcess(multi);
		map.put("fileList", fileList);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("result");
		mav.addObject("map"	,map);
		
		return mav;
	} //uploadPro

	// 업로드시 전달되는 파일정보 처리 메서드
	private List<String> fileProcess(MultipartHttpServletRequest multi) throws Exception{
		mylog.debug(" 업로드 파일 처리 시작 ");
		
		// 업로드 파일명을 저장하는 리스트
		List<String> fileList = new ArrayList<String>();
		
		// 전달받은 파라미터(파일) 정보 저장
		Iterator<String> fileNames 
		             = multi.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			//mylog.debug(fileName);
			// 전달받은 파일의 정보를 저장(데이터)
			MultipartFile mFile = multi.getFile(fileName);
			// 전달받은 파일의 이름정보를 저장
			String oFileName = mFile.getOriginalFilename();
			
			fileList.add(oFileName);
			
			// 업로드 처리
			File file = new File(FILE_PATH+"\\"+fileName);
			
			if(mFile.getSize() != 0) { //업로드된 파일정보가 있으면
				if(!file.exists()) { // 기존에 업로드 폴더가 존재여부
					if(file.getParentFile().mkdirs()) {
						// 부모역활을 하는 폴더 생성
						file.createNewFile();
						// 임시파일을 생성
					}
				}
			}
//				file.createNewFile();
			mFile.transferTo(new File(FILE_PATH+"\\"+oFileName));
			// -> 임시저장파일의 정보를 업로드된 실제파일로 변경
		}
		
		mylog.debug(" 업로드 파일 처리 끝 ");
		return fileList;
	}
	
	
	
	
	
	
	// http://localhost:8080/notice/main
	
	/**
	 * 메인 페이지 - list (main)
	 */
//	@RequestMapping(value="/main", method=RequestMethod.GET)
//	public String noticeMainGET(HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{
//	
//		// 세션객체 - 글 조회수 증가 체크정보
//		session.setAttribute("updateCheck", true);
//		
//		List<NoticeVO> noticeList = noticeService.getNoticeList();	
//		
//		model.addAttribute("noticeList", noticeList);
//		
//		return "/notice/main";
//	}
	
	/**
	 * 메인 페이지 - listPage (main)
	 */
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String listPageMainGET(NoticeCriteria cri, HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{
	
//		String mem_id = (String) session.getAttribute("mem_id");
		
		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);
		
//		session.setAttribute("mem_id", mem_id);
		
		List<NoticeVO> noticeList = noticeService.getListPage(cri);
//		List<NoticeVO> noticeList = noticeService.getNoticeList();
		NoticePageVO pvo = new NoticePageVO();
		pvo.setCri(cri);
		pvo.setTotalCount(noticeService.totalCnt());
		model.addAttribute("pvo", pvo);		
		
		model.addAttribute("noticeList", noticeList);
//		model.addAttribute("noticePageList", noticePageList);
		
		return "/notice/main";
	}
	
	
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
	public void noticeAllGET(NoticeCriteria cri, HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{
		
		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);
		
		List<NoticeVO> noticeAllList = noticeService.getAllListPage(cri);
		NoticePageVO pvo = new NoticePageVO();
		pvo.setCri(cri);
		pvo.setTotalCount(noticeService.totalACnt());
		model.addAttribute("pvo", pvo);
		
		model.addAttribute("noticeAllList", noticeAllList);

	}
	
	/**
	 * 메인 페이지 - 이벤트 (event)
	 */
	@RequestMapping(value="/event", method=RequestMethod.GET)
	public void noticeEventGET(NoticeCriteria cri, HttpSession session, Model model, @ModelAttribute("result") String result) throws Exception{

		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);
		
		List<NoticeVO> noticeEventList = noticeService.getEventListPage(cri);
		NoticePageVO pvo = new NoticePageVO();
		pvo.setCri(cri);
		pvo.setTotalCount(noticeService.totalECnt());
		model.addAttribute("pvo", pvo);
		
		model.addAttribute("noticeEventList", noticeEventList);
				
	}
	
	
	
	
}
