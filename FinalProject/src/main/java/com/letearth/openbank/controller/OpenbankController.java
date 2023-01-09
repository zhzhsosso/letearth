package com.letearth.openbank.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.openbank.domain.AccountSearchRequestVO;
import com.letearth.openbank.domain.AccountSearchResponseVO;
import com.letearth.openbank.domain.DepositRequestVO;
import com.letearth.openbank.domain.DepositResponseVO;
import com.letearth.openbank.domain.DepositVO;
import com.letearth.openbank.domain.RequestTokenVO;
import com.letearth.openbank.domain.ResponseTokenVO;
import com.letearth.openbank.domain.TransferResultRequestVO;
import com.letearth.openbank.domain.TransferResultResponseVO;
import com.letearth.openbank.domain.UserInfoRequestVO;
import com.letearth.openbank.domain.UserInfoResponseVO;
import com.letearth.openbank.domain.WithdrawRequestVO;
import com.letearth.openbank.domain.WithdrawResponseVO;
import com.letearth.openbank.service.OpenBankService;

@Controller
@RequestMapping("/openbanking/*")
public class OpenbankController {
	
	private static final Logger mylog = LoggerFactory.getLogger(OpenbankController.class);
	
	@Autowired
	private OpenBankService openBankService;
	
	@Inject
	HttpSession session;
	
	//오픈뱅킹 메인
	// http://localhost:8080/openbanking/useroauth
	@RequestMapping(value="/useroauth",method=RequestMethod.GET)
	public String openbanking(HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		
		return "/openbanking/useroauth";
	}
	
	//토큰발급
	@RequestMapping(value="/callback", method= RequestMethod.GET)
	public String getToken(RequestTokenVO requestTokenVO, Model model,HttpSession session, RedirectAttributes rttr) throws Exception{
		//사용자인증 API (3-legged) => 응답결과 출력
		//<authorization_code> 사용자인증 성공 시 반환되는 코드
		System.out.println("code : " +requestTokenVO.getCode());
		//login inquiry transfer Access Token 권한 범위 (다중 scope 가능)
		System.out.println("scope : "+requestTokenVO.getScope());
		//client_info <client_info> 요청 시 이용기관이 세팅한 client_info값
		System.out.println("client_info : "+requestTokenVO.getClient_info());
		//주 1) <state> 요청 시 이용기관이 세팅한 state값을
		System.out.println("state : "+requestTokenVO.getState());
		
		
		//토큰발급=> 처리 메서드 호출 리턴 받기
		ResponseTokenVO responseTokenVO = openBankService.requestToken(requestTokenVO);
		System.out.println("토큰"+responseTokenVO.getAccess_token());
		
		//정보를 들고 jsp 이동
		model.addAttribute("responseTokenVO", responseTokenVO);
		
		return "/openbanking/useroauth";
	}
	
	
	
	// 사용자 정보 조회
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String getUserInfo(UserInfoRequestVO userInfoRequestVO, Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		
		// Service 객체의 findUser() 메서드를 호출하여 사용자 정보 조회
		// => 파라미터 : UserInfoRequestVO, 리턴타입 UserInfoResponseVO
		UserInfoResponseVO userInfo = openBankService.findUser(userInfoRequestVO);

		model.addAttribute("userInfo", userInfo);
//			session.setAttribute("userInfo", userInfo.getUser_info());
		session.setAttribute("access_token", userInfoRequestVO.getAccess_token());

		mylog.info("Access_token : " + userInfoRequestVO.getAccess_token());
		mylog.info("userinfo : " + userInfoRequestVO.getUser_seq_no());

		return "/openbanking/userInfo";
	}

	
	
	// 등록계좌 조회
	@RequestMapping(value = "/accountList", method = RequestMethod.GET)
	public String getAccountList(AccountSearchRequestVO accountSearchRequestVO, Model model, HttpSession session, RedirectAttributes rttr) throws Exception {

		String mem_id = (String)session.getAttribute("mem_id");

		
		AccountSearchResponseVO accountList = openBankService.findAccount(accountSearchRequestVO);

		model.addAttribute("accountList", accountList);
//			session.setAttribute("accountList", accountList.getRes_list());
		session.setAttribute("access_token", accountSearchRequestVO.getAccess_token());

		// Model 객체에 AccountSearchResponseVO 객체와 엑세스토큰 저장
		mylog.info("Access_token : " + accountSearchRequestVO.getAccess_token());
		mylog.info("userinfo : " + accountSearchRequestVO.getUser_seq_no());
		mylog.info("include_cancel_yn : " + accountSearchRequestVO.getInclude_cancel_yn());
		mylog.info("Sort_order : " + accountSearchRequestVO.getSort_order());

		return "/openbanking/accountList";
	}
	
	
	// 구매자? -> 관리자 출금이체
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	public String getWithdraw( WithdrawRequestVO withdrawRequestVO, Model model)
			throws IOException {

		WithdrawResponseVO withdrawOK = openBankService.getwithdraw(withdrawRequestVO);

		model.addAttribute("withdrawOK", withdrawOK);
		model.addAttribute("access_token", withdrawRequestVO.getAccess_token());
		model.addAttribute("bank_tran_id", withdrawRequestVO.getBank_tran_id());
		
		System.out.println("출금이체" + withdrawOK);

		return "/openbanking/withdrawResult";
	}
		
		
	//관리자 -> 판매자 정산 입금이체
	@RequestMapping(value="/deposit", method = RequestMethod.POST)
	public String getDeposit(DepositRequestVO depositRequestVO, Model model) throws Exception{
		
		DepositResponseVO depositOK = openBankService.depositRq(depositRequestVO);
		
		model.addAttribute("depositOK", depositOK);
		model.addAttribute("access_token", depositRequestVO.getAccess_token());
		model.addAttribute("bank_tran_id", depositRequestVO.getBank_tran_id());
		
		System.out.println("정산결과 : "+ depositOK);
		System.out.println("입금이체 Access_token : " + depositRequestVO.getAccess_token());
		
		
		return "/openbanking/depositResult";
	}
	

	
	// 입금/출금 이체 결과조회
	@RequestMapping(value="/transfer",method=RequestMethod.POST)
	public String getTransferResult(TransferResultRequestVO transferResultRequestVO, Model model) {
		
		System.out.println(transferResultRequestVO + "@@@@@@@@@@@@@@@@@@@@@@@@");
		
		
		TransferResultResponseVO transferOK = openBankService.getTransferResult(transferResultRequestVO);

		model.addAttribute("transferOK", transferOK);
		model.addAttribute("access_token", transferResultRequestVO.getAccess_token());
		
		System.out.println("이체결과" + transferOK);
		
		return "/openbanking/transferResult";
	}
	
}
