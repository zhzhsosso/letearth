package com.letearth.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.letearth.member.domain.MemberVO;
import com.letearth.member.domain.PlusVO;
import com.letearth.member.persistence.MemberDAO;
import com.letearth.notice.domain.NoticeVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProReplyVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memDAO;
	
	
	@Override
	public void memberJoin(MemberVO vo) throws Exception {
		memDAO.memberJoin(vo);
	}

	@Override
	public int memberLogin(MemberVO vo) throws Exception {
		return memDAO.memberLogin(vo);
	}

	@Override
	public String findID(MemberVO vo) throws Exception {
		return memDAO.findID(vo);
	}

	@Override
	public MemberVO findPw(MemberVO vo) throws Exception {
		return memDAO.findPw(vo);
	}

	@Override
	public void changePw(MemberVO vo) throws Exception {
		memDAO.changePw(vo);
	}

	@Override
	public MemberVO getMember(String mem_id) {
		return memDAO.getMember(mem_id);
	}

	@Override
	public boolean checkKakao(String kid) throws Exception {
		boolean result = memDAO.checkKakao(kid);
		
		return result;	
	}

	@Override
	public void insertKakao(MemberVO vo) throws Exception {
		memDAO.insertKakao(vo);
	}
	
	/**
	 * 마이페이지 이동 (회원상태 조회)
	 */
	@Override
	public List<PlusVO> getOrder(PlusVO plusVO) throws Exception {
		return memDAO.getOrder(plusVO);
	}
	
	/**
	 * 내 정보 수정
	 */
	@Override
	public void myModify(MemberVO memVO) throws Exception {
		memDAO.myModify(memVO);
	}

	/**
	 * 비밀번호 확인
	 */
	@Override
	public Integer passChk(MemberVO memVO) throws Exception {
		return memDAO.passChk(memVO);
	}

	/**
	 * 회원 탈퇴
	 */
	@Override
	public void myDelete(MemberVO memVO) throws Exception {
		memDAO.myDelete(memVO);
	}
	
	/**
	 * 마이페이지 이동 (회원상태 조회)
	 */
	@Override
	public MemberVO getMember(MemberVO memVO) throws Exception {
		return memDAO.getMember(memVO);
	}
	
	/**
	 * 펀딩 프로젝트 상세
	 */
	@Override
	public OrderVO detailOrder(OrderVO ordVO) throws Exception {
		return memDAO.detailOrder(ordVO);
	}
	
	/**
	 * 주문 취소
	 */
	@Override
	public void deleteOrder(OrderVO ordVO) throws Exception {
		memDAO.deleteOrder(ordVO);
	}

	/**
	 * 마이페이지 이동 (프로젝트 조회)
	 */
	@Override
	public List<PlusVO> getProject(PlusVO plusVO) throws Exception {
		return memDAO.getProject(plusVO);
	}
	
	/**
	 * 주문 내역
	 */
	@Override
	public List<PlusVO> getMyOrder(PlusVO plusVO) throws Exception {
		return memDAO.getMyOrder(plusVO);
	}

	/**
	 * 관심 프로젝트 불러오기
	 */
	@Override
	public List<PlusVO> getLikey(PlusVO plusVO) throws Exception {
		return memDAO.getLikey(plusVO);
	}

	/**
	 * 좋아요 삭제
	 */
	@Override
	public void deleteMyLike(LikeyVO likVO) throws Exception {
		memDAO.deleteMyLike(likVO);
	}

	/**
	 * 댓글 불러오기
	 */
	@Override
	public List<ProReplyVO> getReply(ProReplyVO repVO) throws Exception {
		return memDAO.getReply(repVO);
	}
	
	/**
	 * 댓글 개수
	 */
	@Override
	public Integer getReplyCnt(ProReplyVO repVO) throws Exception {
		return memDAO.getReplyCnt(repVO);
	}
	
	/**
	 * 댓글 삭제
	 */
	@Override
	public void deleteMyReply(ProReplyVO repVO) throws Exception {
		memDAO.deleteMyReply(repVO);
	}

	/**
	 * qna 작성
	 */
	@Override
	public void insertQna(NoticeVO notVO) throws Exception {
		memDAO.insertQna(notVO);
	}

	/**
	 * qna ref 업데이트
	 */
	@Override
	public void updateQna(NoticeVO notVO) throws Exception {
		memDAO.updateQna(notVO);
	}

	/**
	 * qna 글개수
	 */
	@Override
	public Integer getQnaCnt(NoticeVO notVO) throws Exception {
		return memDAO.getQnaCnt(notVO);
	}

	/**
	 * qna 불러오기
	 */
	@Override
	public List<NoticeVO> getQna(NoticeVO notVO) throws Exception {
		return memDAO.getQna(notVO);
	}

	/**
	 * qna 삭제
	 */
	@Override
	public void deleteQna(NoticeVO notVO) throws Exception {
		memDAO.deleteQna(notVO);
	}

	

}
