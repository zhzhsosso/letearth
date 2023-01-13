package com.letearth.admin.service;

import java.util.List;

import com.letearth.prodetail.domain.Criteria;
import com.letearth.admin.domain.MemOrdVO;
import com.letearth.admin.domain.SearchCriteria;
import com.letearth.order.domain.OrderVO;
import com.letearth.member.domain.MemberVO;
import com.letearth.project.domain.ProjectVO;

public interface AdMemproService {
	
	/**
	 * 프로젝트 
	 */
	// 프로젝트 리스트 조회 1(상태2-4)
	public List<ProjectVO> getListPro1(SearchCriteria scri) throws Exception;
	
	// 상세조회1 프로젝트 번호 선택 
	public ProjectVO getDetailPro1(int pro_no) throws Exception;
	
	// 프로젝트 리스트 조회 2(상태5-7)
	public List<ProjectVO> getListPro2(SearchCriteria scri) throws Exception;
	
	// 상세조회2 프로젝트 번호 선택 
	public ProjectVO getDetailPro2(int pro_no) throws Exception;

	// 배송현황 상세조회
	public ProjectVO getDetailShip(int pro_no) throws Exception;
	
	// 결제리스트
	public List<OrderVO> proOrdMemList(OrderVO ordVO) throws Exception;

	// 프로젝트1 전체 개수
	public int totalPro1(SearchCriteria scri) throws Exception;
	
	// 프로젝트2 전체 개수
	public int totalPro2(SearchCriteria scri) throws Exception;
	
	// 프로젝트 상태변경 (승인요청(2) -> 승인(3)으로 변경
	public Integer updateProStatus3(ProjectVO proVO) throws Exception;
	
	// 프로젝트 상태변경 (승인요청(2) -> 반려(4)으로 변경
	public Integer updateProStatus4(ProjectVO proVO) throws Exception;
	
	
	
	
	/**
	 * 회원
	 */
	// 회원 목록 조회
	public List<MemberVO> getMemList(SearchCriteria scri);
	
	// 회원 상세조회
	public MemberVO getMemDetail(String mem_id);
	
	// 회원 수
	public int totalMem(SearchCriteria scri) throws Exception;
	
	// 구매내역 리스트
	public List<MemOrdVO> memOrdList(MemOrdVO moVO);
	
	// 판매내역 리스트
	public List<ProjectVO> memProList(ProjectVO proVO);
	
	// 총합 : 구매내역
	public int totalMemOrd(String mem_id) throws Exception;
	
	// 총합 : 판매내역
	public int totalMemPro(String mem_id) throws Exception;
	
	// 회원 탈퇴
	public void deleteMem(MemberVO memVO);
	
}
