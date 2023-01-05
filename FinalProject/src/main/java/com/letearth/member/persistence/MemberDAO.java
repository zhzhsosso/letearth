package com.letearth.member.persistence;

import java.util.List;

import com.letearth.member.domain.MemberVO;
import com.letearth.member.domain.PlusVO;
import com.letearth.notice.domain.NoticeVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProReplyVO;

public interface MemberDAO {

	public void memberJoin(MemberVO vo) throws Exception;

	public int memberLogin(MemberVO vo) throws Exception;

	public String findID(MemberVO vo) throws Exception;

	public MemberVO findPw(MemberVO vo) throws Exception;

	public void changePw(MemberVO vo) throws Exception;

	public MemberVO getMember(String mem_id);

	public boolean checkKakao(String kid);

	public void insertKakao(MemberVO vo);
	

	/**
	 * 마이페이지 이동 (회원 상태)
	 */
	public MemberVO getMember(MemberVO vo) throws Exception;
	
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
	 * 펀딩 프로젝트 불러오기
	 */
	public List<PlusVO> getOrder(PlusVO plusVO) throws Exception;
	
	/**
	 * 펀딩 프로젝트 상세 내역
	 */
	public OrderVO detailOrder(OrderVO ordVO) throws Exception;
	
	/**
	 * 취소
	 */
	public void deleteOrder(OrderVO ordVO) throws Exception;

	/**
	 * 판매자 프로젝트 불러오기
	 */
	public List<PlusVO> getProject(PlusVO plusVO) throws Exception;
	
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
	 * 댓글 삭제
	 */
	public void deleteMyReply(ProReplyVO repVO) throws Exception;
	
	/**
	 * 댓글 개수
	 */
	public Integer getReplyCnt(ProReplyVO repVO) throws Exception;
	
	/**
	 * qna 작성
	 */
	public void insertQna(NoticeVO notVO) throws Exception;
	
	/**
	 * qna ref 업데이트
	 */
	public void updateQna(NoticeVO notVO) throws Exception;
	
	/**
	 * qna 글 개수
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
