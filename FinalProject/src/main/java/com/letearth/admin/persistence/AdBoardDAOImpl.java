package com.letearth.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.letearth.admin.domain.AdminVO;
import com.letearth.member.domain.MemberVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.project.domain.ProjectVO;

@Repository
public class AdBoardDAOImpl implements AdBoardDAO {

	private static final Logger mylog = LoggerFactory.getLogger(AdBoardDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.letearth.mapper.adBoardMapper";
	
	/**
	 * FAQ 관련 DAO
	 */
	// FAQ 작성 
	@Override
	public void insertFaq(AdminVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertFaq", vo);
		
		mylog.debug("FAQ 작성완료! -> 서비스");		
	}
	
	// FAQ 목록 
	@Override
	public List<AdminVO> getListFaq(Criteria cri) throws Exception {
		mylog.debug(" getListFaq(Criteria cri) 페이징처리 ");
		
		return sqlSession.selectList(NAMESPACE + ".listFaq", cri);
	}
	
	// 글전체개수
	@Override
	public int totalFaqCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countFaq");
	}
	
	
	// 조회수 증가
	@Override
	public void updateViewcnt(Integer not_no) throws Exception {
		mylog.debug("여기는 AdBoardDAOImpl- updateViewcnt(Integer notice_no)");
		sqlSession.update(NAMESPACE + ".updateViewcnt", not_no);		
	}
	
	
	// FAQ 본문 보기
	@Override
	public AdminVO getFaq(Integer not_no) throws Exception {
		mylog.debug("여기는 AdBoardDAOImpl- getBoard(Integer not_no)");
		AdminVO vo = sqlSession.selectOne(NAMESPACE+".getBoard", not_no);
		
		return vo;
	}
	
	// FAQ 수정
	@Override
	public Integer updateFaq(AdminVO vo) throws Exception {
		mylog.debug("여기는 AdBoardDAOImpl- updateFaq(AdminVO vo)");
		return sqlSession.update(NAMESPACE + ".updateFaq", vo);
	}
	
	// FAQ 삭제
	@Override
	public void deleteFaq(Integer not_no) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteFaq", not_no);
	}
	
	
	
	
	
	/**
	 * 1:1 문의 관련 메서드
	 */
	// 1:1 문의 리스트
	@Override
	public List<AdminVO> adRewriteList(Criteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".listRewrite", cri);
	}
	
	// 1:1문의 전체 글 개수
	@Override
	public int totalRewriteCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countRewrite");
	}
	
	// 1:1문의 조회
	@Override
	public AdminVO getRewrite(Integer not_no) throws Exception {
		AdminVO vo = sqlSession.selectOne(NAMESPACE+".getBoard", not_no);
		
		return vo;
	}
	
	// 1:1 문의 Y 추가
	@Override
	public void updateY(AdminVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateY", vo);
		
	}

	// 1:1 문의 작성
	@Override
	public Integer insertRewrite(AdminVO vo) throws Exception {
		
		mylog.debug("vo값 얼만데??????" + vo);
		
		// 원글의 not_re_lev, not_re_seq, not_re_ref 가져오기
		AdminVO parent = sqlSession.selectOne(NAMESPACE +".selectRewrite", vo);
	
		// 2. 기존에 달린 답변글들이 있다면 not_re_seq을 하나씩 뒤로 밀어내기 하자
		sqlSession.update(NAMESPACE + ".updateRewrite", parent);
		
		//3. 내가 쓴 답변글을 insert 한다 
		//   이 때 부모글 그룹번호 (not_re_ref )와 동일하게, 
		// not_re_lev 은 부모의 not_re_lev+1, not_re_seq 도 부모의 not_re_seq +1		
		vo.setNot_re_ref(parent.getNot_re_ref()); // 부모와 같은 글그룹번호지정
		vo.setNot_re_lev(parent.getNot_re_lev()+1);
		vo.setNot_re_seq(parent.getNot_re_seq()+1);
		
		return this.sqlSession.insert(NAMESPACE + ".insertRewrite", vo);
	}
	
	
	// 1:1 문의 삭제
	@Override
	public void deleteRewrite(Integer not_no) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteRewrite", not_no);
	}
	
	
	
	
	
	
	/**
	 * 메인
	 */
	// 신고 최근 4개 들고오기
	@Override
	public List<AdminVO> adMainRepList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".mainRep");
	}
	
	// 승인요청 최근 4개 들고오기
	@Override
	public List<ProjectVO> adMainPro2() throws Exception {
		return sqlSession.selectList(NAMESPACE+".mainPro2");
	}
	
	
	/**
	 * 사용자용 faq 최신리스트4개
	 */
	@Override
	public List<AdminVO> faqMainList1() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".faqMainList1");
	}
	@Override
	public List<AdminVO> faqMainList2() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".faqMainList2");
	}
	@Override
	public List<AdminVO> faqMainList3() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".faqMainList3");
	}
	
	/**
	 * 구글차트 : 프로젝트상태
	 */
	// 진행중인 프로젝트 목표금액과 달성금액 현황(최근5개)
	@Override
	public List<ProjectVO> pjChart() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".pjchart");
	}
	
	// 구글차트 회원 비율 => 구매(0), 판매(1), 블랙(3)
	@Override
	public List<MemberVO> memRatio() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".memRatio");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
