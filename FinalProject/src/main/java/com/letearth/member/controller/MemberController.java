package com.letearth.member.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import com.letearth.member.domain.MemberVO;
import com.letearth.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	private static final Logger mylog = LoggerFactory.getLogger(MemberController.class);
	
	
	/**
	 * 약관
	 * @throws Exception
	 */
	@RequestMapping(value="/beforeJoin", method=RequestMethod.GET)
	public void beforeJoin() throws Exception {
		
	}
	
	/**
	 * 회원가입join(GET, POST)
	 */
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET() throws Exception{
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO vo) throws Exception{
		service.memberJoin(vo);
		mylog.debug(vo + "정보");
		
		return "redirect:/member/login";
	}
	
	/**
	 * 로그인login(GET, POST)
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET() throws Exception{
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		System.out.println("loginPOST");
		
		int result = service.memberLogin(vo);
		if(result == 1) {
			// 로그인 성공
			System.out.println("로그인 결과? "+result);
			session.setAttribute("mem_id", vo.getMem_id());
			return "redirect:/main/all";
		} else {
			// 실패
			rttr.addFlashAttribute("message", "아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			return "redirect:/member/login";
		}

		
	}
	
	/**
	 * 아이디 찾기findId(GET,POST)
	 */
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public void findIdGET() throws Exception{
		 System.out.println("findIdGET()@@@@@@@@@@@@");
	
	}
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findIdPOST(HttpServletRequest request, MemberVO vo, Model model, RedirectAttributes rttr) throws Exception{
		System.out.println("findIdPOST()@@@@@@@@@@@@");
		String name = request.getParameter("mem_name");
		String email = request.getParameter("mem_email");
		
		String result = service.findID(vo);	
		
		String resultURI = "/member/findId";
		if(result != null) {
			// 회원임
			rttr.addFlashAttribute("id", result);
			resultURI = "redirect:/member/findIdAfter";
//			return resultURI;
		} 
		
		return resultURI;
//		return "redirect:/member/findIdAfter";
	
	}
	
	/**
	 * 아이디 찾은 후 findIdAfter(GET)
	 */
	@RequestMapping(value="/findIdAfter", method=RequestMethod.GET)
	public void findIdAfter() throws Exception {
		// 연결된 view에 db에 있는 id 출력
		
	}
	
	/**
	 * 비밀번호 찾기findPw(GET, POST)
	 */
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public void findPwGET() throws Exception {
		
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public String findPwPost(HttpServletRequest request, MemberVO vo) throws Exception {
		// 입력받은 아이디, 이름, 이메일을 DB로 가서 비교
		// 일치 -> findPwAfter / 불일치 -> "일치하지 않습니다"
		String id = request.getParameter("mem_id");
		String name = request.getParameter("mem_name");
		String email = request.getParameter("mem_email");
		
		MemberVO resultVO = service.findPw(vo);
		
		String resultURI = "/member/findPw";
		if(id.equals(resultVO.getMem_id()) && name.equals(resultVO.getMem_name()) && email.equals(resultVO.getMem_email())) {
			// 일치 -> findPwAfter
			resultURI = "redirect:/member/findPwAfter";
		}
		
		return resultURI;
	}
	
	/**
	 * 비밀번호 찾은 후 findPwAfter(GET, POST)
	 */
	@RequestMapping(value="/findPwAfter", method=RequestMethod.GET)
	public void findPwAfterGET() throws Exception {
		/* 
		 	비밀번호 찾은 후 보여지는 페이지
		 	- 아이디, 새 비밀번호, 새 비밀번호 확인 입력 후 (정보 수정 update) 로그인 페이지로 이동
		*/
	}
	
	@RequestMapping(value="/findPwAfter", method=RequestMethod.POST)
	public String findPwAfterPOST(MemberVO vo) throws Exception {
		service.changePw(vo);
		
		mylog.debug("비밀번호 변경 완! 로그인 페이지로 돌아갑니다,,,,");
		
		return "redirect:/member/login";
	}
	
	
	/** 
	 * 로그아웃
	 * logoutPOST()
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logoutPOST(HttpSession session, HttpServletRequest request) throws Exception{
		// 로그아웃 버튼을 클릭하면 세션 초기화
		// 세션 초기화 (로그아웃)
		session = request.getSession();
		session.invalidate();

		return "redirect:/main/all";
	
	}
	
	/**
	 * 카카오 회원인지 아닌지
	 * @param locale
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkKakaoAccountExist", method = RequestMethod.GET)
	public String checkKakaoAccountExist(Locale locale, Model model, HttpServletRequest request,  HttpSession session) throws Exception {		
		String kid = request.getParameter("kid");
		
		boolean result = service.checkKakao(kid);
		
		System.out.println(result + "@@@@@@@@@@@@@@@@");
		model.addAttribute("result", result);
		
		//이게맞는지는 확인이 필요합니다...................ㅠㅠㅠㅠㅠ
		if(result) {
			session.setAttribute("mem_id", kid);
		}
		
		return "/member/kakaoAccountProc";
	}
	
	/**
	 * 카카오 회원가입
	 * @param locale
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertKakaoMember", method = RequestMethod.GET)
	public String insertKakaoMember(Locale locale, Model model, HttpServletRequest request) throws Exception {		
		String kid = request.getParameter("kid");
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
		
		MemberVO mvo = new MemberVO();
		mvo.setMem_id(kid);
		mvo.setMem_name(user_name);
		mvo.setMem_email(email);
		
		service.insertKakao(mvo);
		
		return "/main/all";
	}
	
	
}
