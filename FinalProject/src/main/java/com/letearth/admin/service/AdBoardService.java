package com.letearth.admin.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.letearth.admin.domain.AdminVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.project.domain.ProjectVO;

public interface AdBoardService {
	
	/**
	 * FAQ관련 메서드
	 */
	
	// FAQ 작성
	public void insertFaq(AdminVO vo) throws Exception;
	
	// FAQ 목록(페이징처리-cri)
	public List<AdminVO> getListFaq(Criteria cri) throws Exception;		
	
	// FAQ전체개수
	public int totalFaqCnt() throws Exception;
	
	// FAQ 조회수 1증가
	public void updateViewcnt(Integer not_no) throws Exception;
	
	// FAQ notice_no를 사용한 정보조회
	public AdminVO getFaq(Integer not_no) throws Exception;
	
	// FAQ 수정
	public Integer updateFaq(AdminVO vo) throws Exception;
	
	// FAQ 삭제
	public void deleteFaq(Integer not_no) throws Exception; 
		
	
	
	
	/**
	 * 1:1문의 관련 메서드
	 */
	// 1:1문의 목록(페이징처리-cri)
	public List<AdminVO> adRewriteList(Criteria cri) throws Exception;
	
	// 전체 1:1문의 글 개수
	public int totalRewriteCnt() throws Exception;
	
	// 1:1문의 notice_no를 사용한 정보조회
	public AdminVO getRewrite(Integer not_no) throws Exception;
	
	// 1:1 문의 원글 Y 추가
	public void updateY(AdminVO vo) throws Exception;
	
	// 1:1 문의 작성
	public Integer insertRewrite(AdminVO vo) throws Exception;
	
	// 1:1 문의 삭제
	public void deleteRewrite(Integer not_no) throws Exception;  
	
	
	
	/**
	 * 메인
	 */
	// 신고 최근 4개 들고오기
	public List<AdminVO> adMainRepList() throws Exception;
	
	// 승인요청 최근 4개 들고오기
	public List<ProjectVO> adMainPro2() throws Exception;
	
	
	// 사용자용 faq
	// 구매자1번 / 후원자2번 / 판매자3번
	public List<AdminVO> faqMainList1() throws Exception;
	public List<AdminVO> faqMainList2() throws Exception;
	public List<AdminVO> faqMainList3() throws Exception;
	
	
	
	/**
	 * 구글차트
	 */
	// 진행중인 프로젝트 목표금액과 달성금액 현황(최근5개)
	public JSONObject getChartData() throws Exception; // json 타입으로 리턴
	
	// 구글차트 회원 비율 => 구매(0), 판매(1), 블랙(3)
	public JSONObject getChartData2() throws Exception;
	
	
}
