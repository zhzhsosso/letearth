package com.letearth.admin.persistence;

import java.util.List;

import com.letearth.prodetail.domain.Criteria;
import com.letearth.admin.domain.MemOrdVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.member.domain.MemberVO;
import com.letearth.project.domain.ProjectVO;

public interface AdMemproDAO {

	/**
	 * 프로젝트 관련 메서드 
	 */
	// 프로젝트 리스트 조회 1(상태2-4)
	public List<ProjectVO> getListPro1(Criteria cri) throws Exception;
	
	// 프로젝트 번호 선택 -> 상세조회1
	public ProjectVO getDetailPro1(int pro_no) throws Exception;
	
	// 프로젝트 리스트 조회 2(상태5-7)
	public List<ProjectVO> getListPro2(Criteria cri) throws Exception;
	
	// 프로젝트 번호 선택 -> 상세조회1
	public ProjectVO getDetailPro2(int pro_no) throws Exception;

	// 배송현황 상세조회
	public ProjectVO getDetailShip(int pro_no) throws Exception;
	
	// 구매리스트 조회
	public List<OrderVO> proOrdMemList(OrderVO ordVO) throws Exception;
	
	// 프로젝트1 전체 개수
	public int totalPro1() throws Exception;
	
	// 프로젝트2 전체 개수
	public int totalPro2() throws Exception;
	
//	// 결제리스트 전체 개수
//	public int totalOrd() throws Exception;
	
	
	
	
	/**
	 * 회원관련 메서드
	 */
	// 회원 리스트 조회
	public List<MemberVO> getMemList(Criteria cri);
	
	// 회원 상세조회
	public MemberVO getMemDetail(String mem_id);
	
	// 구매리스트 조회
	public List<MemOrdVO> memOrdList(MemOrdVO moVO);
	
	// 판매리스트 조회
	public List<ProjectVO> memProList(ProjectVO proVO);
	
	// 총합 : 구매내역
	public int totalMemOrd() throws Exception ;
	
	// 총합 : 판매내역
	public int totalMemPro() throws Exception ;
	
	// 회원 탈퇴
	public void deleteMem(MemberVO memVO);
	
	// 전체 회원 개수
	public int totalMem() throws Exception;
	
	
}
