package com.letearth.openbank.controller;

import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letearth.member.domain.MemberVO;
import com.letearth.openbank.domain.AccountSearchRequestVO;
import com.letearth.openbank.domain.AccountSearchResponseVO;
import com.letearth.openbank.domain.AccountVO;
import com.letearth.openbank.domain.DepositRequestVO;
import com.letearth.openbank.domain.DepositResponseVO;
import com.letearth.openbank.domain.DepositVO;
import com.letearth.openbank.domain.RequestTokenVO;
import com.letearth.openbank.domain.ResponseTokenVO;
import com.letearth.openbank.domain.SettleVO;
import com.letearth.openbank.domain.TransferResultRequestVO;
import com.letearth.openbank.domain.TransferResultResponseVO;
import com.letearth.openbank.domain.UserInfoRequestVO;
import com.letearth.openbank.domain.UserInfoResponseVO;
import com.letearth.openbank.domain.WithdrawRequestVO;
import com.letearth.openbank.domain.WithdrawResponseVO;
import com.letearth.openbank.service.OpenBankService;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.prodetail.domain.PageVO;
import com.letearth.project.domain.ProjectVO;

@Controller
@RequestMapping("/openbanking/*")
public class OpenbankController {
	
	private static final Logger mylog = LoggerFactory.getLogger(OpenbankController.class);
	
	@Autowired
	private OpenBankService openBankService;

	
	@Inject
	HttpSession session;
	
	//오픈뱅킹 메인 GET & 마감이면서 달성완료된 프로젝트 리스트 조회
	// http://localhost:8080/openbanking/useroauth
	@RequestMapping(value="/useroauth",method=RequestMethod.GET)
	public String openbanking(HttpSession session, Model model, RedirectAttributes rttr,Criteria cri) throws Exception{
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		List<ProjectVO> fproList = openBankService.getListSettle(cri);
		System.out.println("fproList:"+fproList);
		
		// 페이징처리 하단부 정보 준비 -> 뷰페이지로 전달
		PageVO pvo = new PageVO();
		pvo.setCri(cri);
		pvo.setTotalCount(openBankService.totalst());
		
		model.addAttribute("fproList",fproList);
		model.addAttribute("pvo", pvo);
		
		return "/openbanking/useroauth";
	}
	
	
	//정산완료 리스트
	@RequestMapping(value="/useroauth2",method=RequestMethod.GET)
	public String CompleteSt(HttpSession session, Model model, RedirectAttributes rttr,Criteria cri) throws Exception{
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		List<ProjectVO> completeSt = openBankService.getComplete(cri);
		
		// 페이징처리 하단부 정보 준비 -> 뷰페이지로 전달
		PageVO pvo = new PageVO();
		pvo.setCri(cri);
		pvo.setTotalCount(openBankService.totalcp());
		
		model.addAttribute("completeSt",completeSt);
		model.addAttribute("pvo", pvo);
	
		return "/openbanking/useroauth2";
	}
	
	
	// 프로젝트 상세정보 조회
	@RequestMapping(value="/stDetail",method=RequestMethod.GET)
	public void settleDetail(Model model, @RequestParam("pro_no") int pro_no, HttpSession session) throws Exception{
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		SettleVO pjvo = openBankService.getSettleDetail(pro_no);
		
		//관리자 핀테크 정보 조회
		MemberVO adfin = openBankService.getAdminFin(mem_id);
		System.out.println("관리자정보 : "+adfin);
		
		//판매자 핀테크 정보 조회
		MemberVO sellfin = openBankService.getSellFin(pro_no);
		System.out.println("판매자 정보 : "+sellfin);
		
		//정산금액 계산
		double finalamt = pjvo.getPro_tp()*0.97;
		int totalamt = (int)finalamt;
		System.out.println("총 정산금액 : "+ finalamt);
		
		model.addAttribute("totalamt",totalamt);
		model.addAttribute("adfin",adfin);
		model.addAttribute("sellfin",sellfin);
		
		model.addAttribute("pjvo",pjvo);
	}
		
	
	
	//콜백
	@RequestMapping(value="/callback", method= RequestMethod.GET)
	public String getToken(RequestTokenVO requestTokenVO, Model model,HttpSession session, RedirectAttributes rttr) throws Exception{
		//사용자인증 API (3-legged) => 응답결과 출력
		String mem_id = (String)session.getAttribute("mem_id");
		
		//토큰발급=> 처리 메서드 호출 리턴 받기
		ResponseTokenVO responseTokenVO = openBankService.requestToken(requestTokenVO);
		System.out.println("토큰"+responseTokenVO.getAccess_token());
		System.out.println("일련번호"+responseTokenVO.getUser_seq_no());
		
		String access_token = responseTokenVO.getAccess_token();
		String user_seq_no = responseTokenVO.getUser_seq_no();
		
		// 멤버vo에 토큰이랑 일련번호 저장
		MemberVO mvo = new MemberVO();
		mvo.setMem_id(mem_id);
		mvo.setBank_token(access_token);
		mvo.setBank_user_num(user_seq_no);
		
		// 계좌정보조회
		UserInfoRequestVO userInfoRequestVO = new UserInfoRequestVO();
		userInfoRequestVO.setAccess_token(access_token);
		userInfoRequestVO.setUser_seq_no(user_seq_no);
		
		UserInfoResponseVO userInfo = openBankService.findUser(userInfoRequestVO);
		
		AccountVO accountvo = userInfo.getRes_list().get(0);
		System.out.println("accountvo : "+accountvo);
		
		// 멤버vo 에 계좌정보 저장
		mvo.setBank_fin_num(accountvo.getFintech_use_num());
		mvo.setBank_code(accountvo.getBank_code_std());
		mvo.setBank_acc(accountvo.getAccount_num_masked());
		mvo.setBank_acc_name(accountvo.getAccount_holder_name());
		mvo.setBank_name(accountvo.getBank_name());
		
		// result 1이면 저장 성공한 것
		int result = openBankService.setBank(mvo);
		System.out.println(mvo);
		System.out.println(result);
		
		//정보를 들고 jsp 이동
		model.addAttribute("responseTokenVO", responseTokenVO);
		
		System.out.println("responseTokenVO : "+responseTokenVO);
	
		return "redirect:/mypage/mypage";
	}
	
	

	
	
	
	// 사용자 정보 조회
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String getUserInfo(UserInfoRequestVO userInfoRequestVO, Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		UserInfoResponseVO userInfo = openBankService.findUser(userInfoRequestVO);
		System.out.println("사용자정보response : "+userInfo);

		model.addAttribute("userInfo", userInfo);
//		session.setAttribute("access_token", userInfoRequestVO.getAccess_token());

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
	
	
	// 구매자 -> 관리자 출금이체
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
	public String getDeposit(DepositRequestVO depositRequestVO,SettleVO settle, Model model) throws Exception{
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		DepositResponseVO depositOK = openBankService.depositRq(depositRequestVO);
		System.out.println(depositRequestVO);
		
		//프로젝트 상세정보
		SettleVO setResult = openBankService.getSettleDetail(settle.getPro_no());
		
		System.out.println("despositOK"+depositOK);
		System.out.println("vo안에 list 출력"+depositOK.getRes_list());
		System.out.println("vo안에 list 첫번째"+depositOK.getRes_list().get(0));
		
		
		//프로젝트 상태 -> 8 전환
		Integer pro_no = settle.getPro_no();
		openBankService.updateStat(pro_no);
		
		
		model.addAttribute("setResult",setResult);
		model.addAttribute("depositOK", depositOK);
		model.addAttribute("depositVO", depositOK.getRes_list().get(0));
		model.addAttribute("access_token", depositRequestVO.getAccess_token());
		model.addAttribute("bank_tran_id", depositRequestVO.getBank_tran_id());
		
		System.out.println("정산결과 : "+ depositOK);
		System.out.println("입금이체 Access_token : " + depositRequestVO.getAccess_token());
		
		return "/openbanking/depositResult";
	}
	

	
	// 입금/출금 이체 결과조회
	@RequestMapping(value="/transfer",method=RequestMethod.POST)
	public String getTransferResult(TransferResultRequestVO transferResultRequestVO, Model model) {
		
		System.out.println("transferResultRequestVO : "+transferResultRequestVO);
		
		TransferResultResponseVO transferOK = openBankService.getTransferResult(transferResultRequestVO);

		model.addAttribute("transferOK", transferOK);
		model.addAttribute("access_token", transferResultRequestVO.getAccess_token());
		
		System.out.println("이체결과" + transferOK);
		
		return "/openbanking/transferResult";
	}
	
}
