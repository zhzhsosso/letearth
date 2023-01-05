package com.letearth.admin.persistence;

import java.util.List;

import com.letearth.admin.domain.AdminVO;
import com.letearth.prodetail.domain.Criteria;

public interface AdBoardDAO {
	
	// FAQ 글쓰기
	public void insertFaq(AdminVO vo) throws Exception;
	
	// FAQ 목록 (페이징처리-cri)
	 public List<AdminVO> getListFaq(Criteria cri) throws Exception;
	
	// 전체 FAQ 글 개수
	public int totalFaqCnt() throws Exception;
	
	// 조회수
	public void updateViewcnt(Integer not_no) throws Exception;
	
	// FAQ notice_no를 사용한 본문 조회
	public AdminVO getFaq(Integer not_no) throws Exception;
	
	// FAQ 수정
	public Integer updateFaq(AdminVO vo) throws Exception;
	
	// FAQ 삭제
	public void deleteFaq(Integer not_no) throws Exception;
	
	
	
	
	
	// 1:1문의 리스트
	public List<AdminVO> adRewriteList(Criteria cri) throws Exception;
	
	// 전체 1:1문의 글 개수
	public int totalRewriteCnt() throws Exception;
		
	// 1:1문의 notice_no를 사용한 본문 조회
	public AdminVO getRewrite(Integer not_no) throws Exception;
	
	// 1:1 문의 작성
	public Integer insertRewrite(AdminVO vo) throws Exception;
	
	// 1:1 문의 삭제
	public void deleteRewrite(Integer not_no) throws Exception;
	
}

