package com.letearth.order.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.letearth.member.domain.MemberVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.project.domain.RewardVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	
	private static final Logger mylog = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.letearth.mapper.orderMapper";

	// 플젝 1개 정보조회
	@Override
	public ProDetailVO proInfo(Integer pro_no) throws Exception {
		mylog.debug("proInfo(Integer pro_no) 호출");
		
		ProDetailVO pvo = sqlSession.selectOne("com.letearth.mapper.prodetailMapper.getProInfo", pro_no);
		return pvo;
	}
	
	// 회원 한명 정보조회
	@Override
	public MemberVO memInfo(String mem_id) throws Exception {
		mylog.debug("memInfo(String mem_id) 호출");
		
		return sqlSession.selectOne(NAMESPACE+".memInfo", mem_id);
	}
	
	// 연락처 문자인증
//	@Override
//	public void authPhoneNumber(String phone, String authNum) {
//		
//	}

	// 리워드 리스트
	@Override
	public List<RewardVO> rewardList(Integer pro_no) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".rewardList", pro_no);
	}

	// 리워드 한개 조회
	@Override
	public RewardVO getReward(Integer reward_no) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".getReward", reward_no);
	}

	// 회원 연락처 추가
	@Override
	public Integer updateMemTel(MemberVO vo) throws Exception {
		
		return sqlSession.update(NAMESPACE+".updateMemTel", vo);
		
	}

	// max 주문번호 조회
	@Override
	public Integer maxOrderno() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".maxOrderno");
	}

	// 주문완료
	@Override
	public void insertOrder(OrderVO vo) throws Exception {
		
		sqlSession.insert(NAMESPACE+".insertOrder", vo);
	}
	
	// 리워드 수량 1개 차감
	@Override
	public void rewardStock(int reward_no) throws Exception {
		sqlSession.update(NAMESPACE+".rewardStock", reward_no);
	}

	// 주문번호로 주문정보 1개 조회
	@Override
	public OrderVO orderInfo(String order_trade_num) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".orderInfo", order_trade_num);
	}
	
	// 후원만
	@Override
	public OrderVO orderInfo2(String order_trade_num) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".orderInfo2", order_trade_num);
	}
	
	// 주문 취소 요청
	@Override
	public Integer orderCancel(String order_trade_num) throws Exception {
		
		return sqlSession.update(NAMESPACE+".orderCancel", order_trade_num );
	}
	

	// 배송지 변경
	@Override
	public Integer shipChange(OrderVO vo) throws Exception {
		
		return sqlSession.update(NAMESPACE+".shipChange", vo );
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
