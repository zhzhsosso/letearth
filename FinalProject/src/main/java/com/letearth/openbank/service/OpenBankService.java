package com.letearth.openbank.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letearth.member.domain.MemberVO;
import com.letearth.openbank.domain.AccountSearchRequestVO;
import com.letearth.openbank.domain.AccountSearchResponseVO;
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
import com.letearth.openbank.persistence.OpenbankDAO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.project.domain.ProjectVO;

@Service
public class OpenBankService {
	
	@Inject
	private OpenbankDAO openbankDAO;
	
	// 객체생성
	@Autowired
	private OpenBankApiClient openBankApiClient;
	
	//토큰발급 요청 메서드
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) {
		return openBankApiClient.requestToken(requestTokenVO);
	}
	
	//사용자 정보 조회
	public UserInfoResponseVO findUser(UserInfoRequestVO userInfoRequestVO) {
		return openBankApiClient.findUser(userInfoRequestVO);
	}

	//등록계좌 조회
	public AccountSearchResponseVO findAccount(AccountSearchRequestVO accountSearchRequestVO) {
		return openBankApiClient.findAccount(accountSearchRequestVO);
	}
	
	//구매자 -> 관리자 출금이체
	public WithdrawResponseVO getwithdraw( WithdrawRequestVO withdrawRequestVO) {
		return openBankApiClient.withdraw(withdrawRequestVO);
	}
	//관리자 -> 판매자 정산 입금이체
	public DepositResponseVO depositRq(DepositRequestVO depositRequestVO) {
		return openBankApiClient.depositRq(depositRequestVO);
	}
	
	//입금이체 결과조회
	public TransferResultResponseVO getTransferResult(TransferResultRequestVO transferResultRequestVO) {
		return openBankApiClient.transferResult(transferResultRequestVO);
	}
	
	//마감이면서 달성완료된 프로젝트 리스트
	public List<ProjectVO> getListSettle(Criteria cri) throws Exception{
		return openbankDAO.getListSettle(cri);
	}
	
	
	//프로젝트 개수
	public int totalst() throws Exception{
		return openbankDAO.totalst();
	}
	
	//프로젝트 상세조회
	public SettleVO getSettleDetail(int pro_no) throws Exception{
		return openbankDAO.getSettleDetail(pro_no);
	}
	
	//프로젝트 상태 8 업데이트
	public Integer updateStat(Integer pro_no) throws Exception{
		return openbankDAO.updateStat(pro_no);
	}

	
	//정산완료 리스트
	public List<ProjectVO> getComplete(Criteria cri) throws Exception{
		return openbankDAO.getComplete(cri);
	}
	
	//정산완료 프로젝트 개수
	public int totalcp() throws Exception{
		return openbankDAO.totalcp();
	}
	
	// 토큰, 일련번호 저장
	public Integer setBank(MemberVO mvo) throws Exception{
		return openbankDAO.setBank(mvo);
	}
	
	//관리자 핀테크 정보조회
	public MemberVO getAdminFin(String mem_id) throws Exception{
		return openbankDAO.getAdminFin(mem_id);
	}
	
	//판매자 핀테크 정보조회
	public MemberVO getSellFin(Integer pro_no) throws Exception{
		return openbankDAO.getSellFin(pro_no);
	}
}
