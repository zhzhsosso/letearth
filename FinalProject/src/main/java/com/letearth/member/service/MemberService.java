package com.letearth.member.service;

import java.util.List;

import com.letearth.member.domain.MemberVO;
import com.letearth.member.domain.PlusVO;
import com.letearth.notice.domain.NoticeVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProReplyVO;

public interface MemberService {
	
	// 회원가입
	public void memberJoin(MemberVO vo) throws Exception;

	// 로그인
	public int memberLogin(MemberVO vo) throws Exception;

	// 아이디 찾기
	public String findID(MemberVO vo) throws Exception;

	// 비밀번호 찾기
	public MemberVO findPw(MemberVO vo) throws Exception;

	// 비밀번호 변경
	public void changePw(MemberVO vo) throws Exception;

	// 아이디에 해당하는 회원정보 가져오기
	public MemberVO getMember(String mem_id);
	
	// 카카오 계정이 존재하는지 확인
	public boolean checkKakao(String kid) throws Exception;
	
	// 카카오 회원가입
	public void insertKakao(MemberVO vo) throws Exception;
	
	/**
	 * 마이페이지 이동 (회원 상태 조회)
	 */
	public MemberVO getMember(MemberVO memVO) throws Exception;
	
	/**
	 * 내 정보 수정
	 */
	public void myModify(MemberVO memVO) throws Exception;
	
	/**
	 * 비밀번호 확인
	 */
	public Integer passChk(MemberVO memVO) throws Exception;
	
	/**
	 * 회원 탈퇴
	 */
	public void myDelete(MemberVO memVO) throws Exception;
	
	/**
	 * 마이페이지 이동 (판매자 프로젝트)
	 */
	public List<PlusVO> getProject(PlusVO plusVO) throws Exception;
	
	/**
	 * 주문 목록
	 */
	public List<PlusVO> getMyOrder(PlusVO plusVO) throws Exception;
	
	/**
	 * 배송 상태 업데이트
	 */
	public Integer updateMyOrder(OrderVO ordVO) throws Exception;
	
	/**
	 * 마이페이지 이동 (주문내역)
	 */
	public List<PlusVO> getOrder(PlusVO plusVO) throws Exception;
	
	/**
	 * 펀딩 프로젝트 상세
	 */
	public OrderVO detailOrder(OrderVO ordVO) throws Exception;
	
	/**
	 * 배송지 변경
	 */
	public void changeAddr(OrderVO ordVO) throws Exception;
	
	/**
	 * 주문 취소
	 */
	public void deleteOrder(OrderVO ordVO) throws Exception;
	
	/**
	 * 관심 프로젝트 불러오기
	 */
	public List<PlusVO> getLikey(PlusVO plusVO) throws Exception;
	
	/**
	 * 좋아요 삭제
	 */
	public void deleteMyLike(LikeyVO likVO) throws Exception;
	
	/**
	 * 댓글 불러오기
	 */
	public List<ProReplyVO> getReply(ProReplyVO repVO) throws Exception;
	
	/**
	 * 댓글 개수
	 */
	public Integer getReplyCnt(ProReplyVO repVO) throws Exception;
	
	/**
	 * 댓글 삭제
	 */
	public void deleteMyReply(ProReplyVO repVO) throws Exception;
	
	/**
	 * qna 작성
	 */
	public void insertQna(NoticeVO notVO) throws Exception;
	
	/**
	 * qna ref 업데이트
	 */
	public void updateQna(NoticeVO notVO) throws Exception;
	
	/**
	 * qna 개수
	 */
	public Integer getQnaCnt(NoticeVO notVO) throws Exception;
	
	/**
	 * qna 불러오기
	 */
	public List<NoticeVO> getQna(NoticeVO notVO) throws Exception;
	
	/**
	 * qna 삭제
	 */
	public void deleteQna(NoticeVO notVO) throws Exception;
}
