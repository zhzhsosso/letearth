package com.letearth.prodetail.service;

import java.util.List;

import com.letearth.member.domain.MemberVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.prodetail.domain.ProReplyVO;
import com.letearth.prodetail.domain.ProReportVO;

public interface ProDetailService {

	// project_no 에 해당하는 프로젝트 정보 가져오는 메서드
	public List<ProDetailVO> getProInfo(int pro_no) throws Exception;

	// <프로젝트 소개 탭> getProIntro
	public List<ProDetailVO> getProIntro(int pro_no) throws Exception;

	public List<ProDetailVO> getReward(int pro_no) throws Exception;
	
	//프로젝트 상세보기
	public ProDetailVO getProjectDetail(Integer pro_no) throws Exception;

	//판매자 공지작성
	public void sellNotice(ProReplyVO prvo) throws Exception;
		
	//판매자 공지 리스트 불러오기
	public List<ProReplyVO> getsnListAll(Integer pro_no) throws Exception;
		
	//사용자 댓글 리스트 불러오기
	public List<ProReplyVO> geturListAll(Integer pro_no) throws Exception;
	
	//판매자 답글작성
	public void reReply(ProReplyVO prvo) throws Exception;
	
	//프로젝트 신고하기
	public void reporter(ProReportVO rpvo) throws Exception;
	
	//댓글 신고하기
	public void reporterRp(ProReportVO rpvo) throws Exception;
	
	//페이징처리 cri
	public List<ProReplyVO> getListPage(Criteria cri) throws Exception;
	
	//공지 글 전체개수
	public int totalCnt() throws Exception;
	
	//멤버 상태정보
	public MemberVO getBanId(String mem_id) throws Exception;

	// 좋아요 눌렀는지 안 눌렀는지
	public Integer findLike(LikeyVO lvo);

	// 좋아요 눌렀을 때
	public void insertLike(LikeyVO lvo);

	// 좋아요 취소
	public void deleteLike(LikeyVO lvo);
}
