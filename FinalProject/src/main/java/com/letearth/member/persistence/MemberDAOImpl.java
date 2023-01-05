package com.letearth.member.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.letearth.member.domain.MemberVO;
import com.letearth.member.domain.PlusVO;
import com.letearth.notice.domain.NoticeVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProReplyVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.letearth.mapper.memberMapper";
	
	@Override
	public void memberJoin(MemberVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertMember", vo);
	}

	@Override
	public int memberLogin(MemberVO vo) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".loginMember", vo);
	}

	@Override
	public String findID(MemberVO vo) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".findMemID", vo);
	}

	@Override
	public MemberVO findPw(MemberVO vo) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".findMemPW", vo);
	}

	@Override
	public void changePw(MemberVO vo) throws Exception{
		sqlSession.update(NAMESPACE + ".changePw", vo);
		
	}

	@Override
	public MemberVO getMember(String mem_id) {
		return sqlSession.selectOne(NAMESPACE + ".getMember", mem_id);
	}

	@Override
	public boolean checkKakao(String kid) {
		String result = sqlSession.selectOne(NAMESPACE + ".kakaoAccount", kid);
		
		boolean resultGbn = false;
		if(result.equals("1")) {
			// 회원이 있는경우
			resultGbn = true;
		}
		return resultGbn;
	}

	@Override
	public void insertKakao(MemberVO vo) {
		sqlSession.insert(NAMESPACE + ".insertKakao", vo);		
	}
	
	/**
	 * 마이페이지 이동 (회원 상태)
	 */
	@Override
	public MemberVO getMember(MemberVO memVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getMember", memVO);
	}
	
	/**
	 * 내 정보 수정
	 */
	@Override
	public void myModify(MemberVO memVO) throws Exception {
		sqlSession.update(NAMESPACE + ".myModify", memVO);
	}
	
	/**
	 * 비밀번호 확인
	 */
	@Override
	public Integer passChk(MemberVO memVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".passChk", memVO);
	}

	/**
	 * 회원 탈퇴
	 */
	@Override
	public void myDelete(MemberVO memVO) throws Exception {
		sqlSession.delete(NAMESPACE + ".myDelete", memVO);
	}

	/**
	 * 마이페이지 이동 (펀딩한 프로젝트)
	 */
	@Override
	public List<PlusVO> getOrder(PlusVO plusVO) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getOrder", plusVO);
	}
	
	/**
	 * 펀딩 프로젝트 상세
	 */
	@Override
	public OrderVO detailOrder(OrderVO ordVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".detailOrder", ordVO);
	}

	/**
	 * 주문 취소
	 */
	@Override
	public void deleteOrder(OrderVO ordVO) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteOrder", ordVO);
	}

	/**
	 * 마이페이지 이동 (판매자 프로젝트)
	 */
	@Override
	public List<PlusVO> getProject(PlusVO plusVO) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".geMyProject", plusVO);
	}
	
	/**
	 * 관심 프로젝트 불러오기
	 */
	@Override
	public List<PlusVO> getLikey(PlusVO plusVO) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getLikey", plusVO);
	}
	
	/**
	 * 좋아요 삭제
	 */
	@Override
	public void deleteMyLike(LikeyVO likVO) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteMyLike", likVO);
	}

	/**
	 * 댓글 불러오기
	 */
	@Override
	public List<ProReplyVO> getReply(ProReplyVO repVO) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getReply", repVO);
	}
	
	/**
	 * 댓글 삭제
	 */
	@Override
	public void deleteMyReply(ProReplyVO repVO) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteMyReply", repVO);
	}

	/**
	 * 댓글 개수
	 */
	@Override
	public Integer getReplyCnt(ProReplyVO repVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getReplyCnt", repVO);
	}

	/**
	 * qna 작성
	 */
	@Override
	public void insertQna(NoticeVO notVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertQna", notVO);
	}

	/**
	 * qna ref 업데이트
	 */
	@Override
	public void updateQna(NoticeVO notVO) throws Exception {
		sqlSession.update(NAMESPACE + ".updateQna", notVO);
	}
	
	/**
	 * qna 글개수
	 */
	@Override
	public Integer getQnaCnt(NoticeVO notVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getQnaCnt", notVO);
	}

	/**
	 * qna 불러오기
	 */
	@Override
	public List<NoticeVO> getQna(NoticeVO notVO) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getQna", notVO);
	}

	/**
	 * qna 삭제
	 */
	@Override
	public void deleteQna(NoticeVO notVO) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteQna", notVO);
	}
}
