package com.letearth.order.controller;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.letearth.member.domain.MemberVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.order.service.OrderService;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.project.domain.RewardVO;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	private static final Logger mylog = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private OrderService service;
	
//	rttr.addAttribute("msg", "ITWILL"); 
	// 기존의 Model  객체와 동일
	// - URI에 표시됨, F5(새로고침)시 데이터 유지
	// 기존의 이동방식 사용가능
	
//	rttr.addFlashAttribute("msg", "ITWILL"); // 기존의 Model  객체와 동일
	// 전달 정보를 1회성으로 사용가능
	// - URI에 표시안됨, F5(새로고침)시 데이터 사라짐
	//   redirect 이동시에만 사용가능
	
//	model.addAttribute(/*"msg", "ITWILL"*/);
	// => 주소줄에 파라미터 형태로 전달 /doF?msg=ITWILL
	
//	return "/doF"; // 리다이렉트 X, 뷰페이지 호출 O
//	return "forward:/doF"; // 포워딩 O
//	return "redirect:/doF?msg=hello"; // 리다이렉트 O
//	return "redirect:/doF"; // 리다이렉트 O
	
	
	/**
	 * 구매 메인 get
	 */
	// http://localhost:8080/order/or_main?pro_no=15
	@GetMapping(value="/or_main")
	public String ormainGET(HttpSession session,@RequestParam("pro_no") int pro_no, Model model,Integer reward_no) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id");
		ProDetailVO pvo = service.proInfo(pro_no);
		MemberVO mvo = service.memInfo(mem_id);
		List<RewardVO> rewardList = service.rewardList(pro_no);
		RewardVO rvo = service.getReward(reward_no);
		int order_no = service.maxOrderno();
		
		if(mem_id == null) {
			return "redirect:/member/login";
		} else if(reward_no != null) {
			if(pro_no != rvo.getPro_no()) {
				return "redirect:/main/all";
			}
		}
		
		System.out.println(order_no);
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("rewardList",rewardList);
		model.addAttribute("order_no", order_no);
		model.addAttribute("rvo", rvo);
		
		return "/order/or_main";
	}
	
	
	/**
	 * 구매 메인 Post
	 */
	@PostMapping(value="/or_main")
	public String ormainPOST(OrderVO vo, HttpSession session, Integer reward_no) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id");
		vo.setMem_id(mem_id);
		vo.setOrder_status(1);
		mylog.debug(reward_no + "");
		
		mylog.debug(mem_id+"");
		
		service.insertOrder(vo);
		// mylog.debug(service.insertOrder(vo) + "@@@@@@@@@@@@@@@@");
		if(reward_no > 0) {
			service.rewardStock(reward_no);
		}
		String or_tr_n = vo.getOrder_trade_num();
		mylog.debug(or_tr_n+"@@@@@@@@@@@@@@");
		
		return "redirect:/order/or_comp?or_tr_n="+or_tr_n;
	}
	
	/**
	 * 연락처 문자 인증
	 * @param phone
	 * @return
	 */
	@PostMapping(value="/sendAuthSMS")
	@ResponseBody
	public void sendAuthSMS(String phone, HttpSession session, HttpServletResponse rs, String pro_no) throws Exception {
		System.out.println("@@@"+pro_no);
		System.out.println("@@@"+phone);
		Random randomNum = new Random();
		String authNum = "";
		
		
		for(int i = 0; i < 4; i++) {
			String random = Integer.toString(randomNum.nextInt(10));
			authNum += random;
		}
		System.out.println("UserRestController - sendAuthSMS : " + authNum);

		service.authPhoneNumber(phone, authNum);
		
		
		Cookie code = new Cookie("code", authNum);
		code.setMaxAge(60);
		rs.addCookie(code);
		
		
//		return session;
	}
	
	/**
	 * 리워드 한개 정보 조회
	 * @param reward_no
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="/getReward")
	@ResponseBody
	public RewardVO getReward(int reward_no) throws Exception{
		mylog.debug(reward_no+"");
		
		RewardVO vo = service.getReward(reward_no);
		
		return vo;
	}
	
	/**
	 * 연락처 저장
	 * @param session
	 * @param phone
	 * @param vo
	 * @return
	 */
	@PostMapping(value="/updateMem")
	@ResponseBody
	public Integer updateMem(HttpSession session, String phone,MemberVO vo) throws Exception{
		String mem_id = (String)session.getAttribute("mem_id");
		String mem_phone = phone;
		mylog.debug(mem_id+"");
		mylog.debug(mem_phone+"");
		
		vo.setMem_id(mem_id);
		vo.setMem_phone(mem_phone);
		
		Integer result = service.updateMemTel(vo);
		
		return result;
	}
	
	
	// http://localhost:8080/order/or_comp?or_tr_n=20230101-14
	/**
	 * 후원완료Get
	 * @param session
	 * @param order_no
	 * @param model
	 * @throws Exception
	 */
	@GetMapping(value="/or_comp")
	public String or_compGET(HttpSession session,@ModelAttribute("or_tr_n") String order_trade_num,Model model) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id");
		
		MemberVO mvo = service.memInfo(mem_id);
		OrderVO ovo2 = service.orderInfo2(order_trade_num);
		OrderVO ovo = service.orderInfo(order_trade_num);

		System.out.println(mvo);
//		System.out.println(ovo);
//		System.out.println(ovo2);
		
		if(ovo != null) {
			if(mem_id == null || !mem_id.equals(ovo.getMem_id())) {
				return "redirect:/main/all";
			}
		} else if(ovo2 != null) {
			if(mem_id == null || !mem_id.equals(ovo2.getMem_id())) {
				return "redirect:/main/all";
			}
		}
		
		model.addAttribute("ovo", ovo);
		model.addAttribute("ovo2", ovo2);
		model.addAttribute("mvo", mvo);
		
		return "/order/or_comp";
		
	}
	
	
	/**
	 * 주문 취소 요청
	 */
	@PostMapping(value="/orderCancel")
	@ResponseBody
	public Integer orderCancel(String order_trade_num) throws Exception {
		
		int cancelResult = service.orderCancel(order_trade_num);
		
		return cancelResult;
	}
	
	/**
	 * 배송지 변경
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value="/shipChange")
	@ResponseBody
	public Integer shipChange(OrderVO vo) throws Exception {
		
		int shipResult = service.shipChange(vo);
		
		return shipResult;
	}
}
