package com.letearth.order.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letearth.member.domain.MemberVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.order.persistence.OrderDAO;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.project.domain.RewardVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class OrderServiceImpl implements OrderService{
	
	
	private static final Logger mylog = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDAO dao;

	// 프로젝 1개 정보 조회
	@Override
	public ProDetailVO proInfo(Integer pro_no) throws Exception {
		mylog.debug("serviceImpl : proInfo(pro_no) 호출");
		ProDetailVO pvo = dao.proInfo(pro_no);
		
		return pvo;
	}
	
	
	// 회원 1명 정보 조회
	@Override
	public MemberVO memInfo(String mem_id) throws Exception {
		mylog.debug("serviceImpl : memInfo(mem_id) 호출");
		
		return dao.memInfo(mem_id);
	}


	// 연락처 문자 인증
	@Override
	public void authPhoneNumber(String phone, String authNum) {
		String api_key = "NCSADWRBQVXIUNBE";
		String api_secret = "G5TS8GMSSS79ET9NAB3IJ1O6H736B6GS";
		Message coolSMS = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<>();
		params.put("to", phone);		
			System.out.println(phone);
		params.put("from", "01095549537");	
		params.put("type", "SMS");
		params.put("text", "<LetEarth> 인증번호는 [ " + authNum + " ]입니다.");
			System.out.println(authNum);
		params.put("app_version", "test app 1.2");		
		
		
		try {
			JSONObject object = (JSONObject)coolSMS.send(params);
			System.out.println(object.toString());
		} catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// 리워드 리스트
	@Override
	public List<RewardVO> rewardList(Integer pro_no) throws Exception {
		mylog.debug("serviceImpl : rewardList(pro_no) 호출");
		
		return dao.rewardList(pro_no);
	}

	// 리워드 한개 조회
	@Override
	public RewardVO getReward(Integer reward_no) throws Exception {
		mylog.debug("serviceImpl : getReward(reward_no) 호출");
		
		return dao.getReward(reward_no);
	}

	// 회원 연락처 추가
	@Override
	public Integer updateMemTel(MemberVO vo) throws Exception {
		mylog.debug("serviceImpl : updateMemTel(vo) 호출");
		
		return dao.updateMemTel(vo);
	}
	
	// 주문 max번호 조회
	@Override
	public Integer maxOrderno() throws Exception {
		mylog.debug("serviceImpl : maxOrderno() 호출");
		
		return dao.maxOrderno();
	}

	// 주문 완료
	@Override
	public String insertOrder(OrderVO vo) throws Exception {
		mylog.debug("serviceImpl : insertOrder(vo) 호출");
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int orno = vo.getOrder_no();
//		int tradenum = orno+1;
		
		
		// 주문번호 생성
		vo.setOrder_trade_num(sdf.format(cal.getTime())+"-"+ (orno+1));
		mylog.debug("@@@@@@"+(orno+1));
		
		dao.insertOrder(vo);
		
		return vo.getOrder_trade_num();
	}
	
	// 리워드 수량 1개 차감
	@Override
	public void rewardStock(int reward_no) throws Exception {
		mylog.debug("serviceImpl : rewardStock(reward_no) 호출");
		
		dao.rewardStock(reward_no);
	}
	

	// 주문번호로 주문정보 1개 조회
	@Override
	public OrderVO orderInfo(String order_trade_num) throws Exception {
		mylog.debug("serviceImpl : orderInfo(order_trade_num) 호출");
		
		return dao.orderInfo(order_trade_num);
	}
	
	//후원만
	@Override
	public OrderVO orderInfo2(String order_trade_num) throws Exception {
		mylog.debug("serviceImpl : orderInfo2(order_trade_num) 호출");
		
		return dao.orderInfo2(order_trade_num);
	}

	// 주문 취소 요청
	@Override
	public Integer orderCancel(String order_trade_num) throws Exception {
		mylog.debug("serviceImpl : orderCancel(order_trade_num) 호출");
		
		return dao.orderCancel(order_trade_num);
	}


	// 배송지 변경
	@Override
	public Integer shipChange(OrderVO vo) throws Exception {
		mylog.debug("serviceImpl : shipChange(order_no) 호출");
		
		return dao.shipChange(vo);
	}

	
}
