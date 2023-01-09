package com.letearth.openbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

@Service
public class OpenBankService {
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

}
