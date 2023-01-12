package com.letearth.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.letearth.prodetail.domain.Criteria;
import com.letearth.admin.domain.MemOrdVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.member.domain.MemberVO;
import com.letearth.project.domain.ProjectVO;

@Repository
public class AdMemproDAOImpl implements AdMemproDAO {

	@Inject
	private SqlSession sqlSession;
	
	
	private static final Logger mylog 
		= LoggerFactory.getLogger(AdMemproDAOImpl.class);
	
	
	
	private static final String NAMESPACE = "com.letearth.mapper.adMemproMapper";



	/**
	 * 프로젝트
	 */

	// 프로젝트 목록조회1 (상태 2-4)
	@Override
	public List<ProjectVO> getListPro1(Criteria cri) throws Exception {
		
		mylog.debug(" getListPro1(Integer page) 페이징처리" );
		
		return sqlSession.selectList(NAMESPACE+".getListPro1",cri);
		
	}


	// 프로젝트 상세조회1
	@Override
	public ProjectVO getDetailPro1(int pro_no) throws Exception {
		
		ProjectVO proVO = sqlSession.selectOne(NAMESPACE+".getDetailPro1", pro_no);
		System.out.println("proVO : DAO " + proVO);
		return proVO;
	}


	// 프로젝트 목록조회2 (상태 5-7)
	@Override
	public List<ProjectVO> getListPro2(Criteria cri) throws Exception {
		
		mylog.debug(" getListPro2(Integer page) 페이징처리" );

		return sqlSession.selectList(NAMESPACE+".getListPro2",cri);
		
	}
	
	
	// 프로젝트 상세조회2
	@Override
	public ProjectVO getDetailPro2(int pro_no) throws Exception {
		
		ProjectVO proVO = sqlSession.selectOne(NAMESPACE+".getDetailPro2", pro_no);
		System.out.println("proVO : DAO " + proVO);
		return proVO;
	}
	
	
	// 결제 고객 리스트 
	@Override
	public List<OrderVO> proOrdMemList(OrderVO ordVO) throws Exception {
		
		mylog.debug(" proOrdMemList(OrderVO ordVO) ");
		
		return sqlSession.selectList(NAMESPACE+".proOrdMemList", ordVO);
	}
	
	
	// 배송현황 상세조회
	@Override
	public ProjectVO getDetailShip(int pro_no) throws Exception {
		
		ProjectVO proVO = sqlSession.selectOne(NAMESPACE+".getDetailShip", pro_no);
		return proVO;
	}
	
	
	

	// 프로젝트1 전체 개수
	@Override
	public int totalPro1() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".totalPro1");
	}

	
	// 프로젝트2 전체 개수
	@Override
	public int totalPro2() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".totalPro2");
	}


	// 프로젝트 상태변경 (승인요청(2) -> 승인(3)으로 변경
	@Override
	public Integer updateProStatus3(ProjectVO proVO) throws Exception {
		return sqlSession.update(NAMESPACE+".updatePro3",proVO);
	}
	
	
	// 프로젝트 상태변경 (승인요청(2) -> 반려(4)으로 변경
	@Override
	public Integer updateProStatus4(ProjectVO proVO) throws Exception {
		return sqlSession.update(NAMESPACE+".updatePro4",proVO);
	}
	
	
	
	
	
	
	
	/**
	 * 회원 
	 */

	// 회원 목록
	@Override
	public List<MemberVO> getMemList(Criteria cri) {
		return sqlSession.selectList(NAMESPACE+".getMemList",cri);
	}
	
	
	// 회원 상세조회
	@Override
	public MemberVO getMemDetail(String mem_id) {
		MemberVO memVO = sqlSession.selectOne(NAMESPACE+".memDetail",mem_id);
		return memVO;
	}
	
	
	// 구매리스트 조회
	@Override
//	public List<OrderVO> memOrdList(OrderVO ordVO) {
	public List<MemOrdVO> memOrdList(MemOrdVO moVO) {
		return sqlSession.selectList(NAMESPACE+".memOrdList", moVO);
	}

	
	// 판매리스트 조회
	@Override
	public List<ProjectVO> memProList(ProjectVO proVO) {
		return sqlSession.selectList(NAMESPACE+".memProList", proVO);
	}

	
	// 총합 : 구매내역
	@Override
	public int totalMemOrd(String mem_id) throws Exception  {
		return sqlSession.selectOne(NAMESPACE+".totalMemOrd",mem_id);
	}
	
	
	// 총합 : 판매내역
	@Override
	public int totalMemPro(String mem_id) throws Exception  {
		return sqlSession.selectOne(NAMESPACE+".totalMemPro",mem_id);
	}
	

	// 회원탈퇴
	@Override
	public void deleteMem(MemberVO memVO) {
		mylog.debug(" deleteMem(MemberVO memVO) 호출");
		
		sqlSession.delete(NAMESPACE+".deleteMem",memVO);
	}


	// 전체 회원 계산
	@Override
	public int totalMem() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".totalMem");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
