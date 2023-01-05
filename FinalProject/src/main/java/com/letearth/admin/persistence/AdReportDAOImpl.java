package com.letearth.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.letearth.admin.domain.AdminVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.member.domain.MemberVO;
import com.letearth.project.domain.ProjectVO;

@Repository
public class AdReportDAOImpl implements AdReportDAO {

	private static final Logger mylog = LoggerFactory.getLogger(AdReportDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.letearth.mapper.adBoardMapper";
		
	
	/**
	 * 블랙리스트관련
	 */
	// 블랙리스트 처리(회원)
		@Override
		public Integer updateBlackMem(AdminVO vo) throws Exception {
				
			return sqlSession.update(NAMESPACE + ".insertBlack", vo)
					+sqlSession.update(NAMESPACE+".updateBlackMem", vo) 
					+ sqlSession.update(NAMESPACE + ".updateReportMem", vo)
					+ sqlSession.update(NAMESPACE + ".updateBdate", vo)
					;
		}
		
	// 블랙리스트 처리(프로젝트)
		@Override
		public Integer updateBlackPro(AdminVO vo) throws Exception {
			
			return sqlSession.update(NAMESPACE + ".insertBlack", vo)
					+ sqlSession.update(NAMESPACE + ".updateBlackPro", vo)
					+ sqlSession.update(NAMESPACE + ".updateReportPro", vo)
					+ sqlSession.update(NAMESPACE + ".updatePro_Bdate", vo)
					;
		}
	
		
	// 블랙리스트 목록
	@Override
	public List<AdminVO> getListBlack(Criteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listBlack", cri);
	}
	
	// 블랙리스트 전체개수 
	@Override
	public int totalBlackCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countBlack");
	}
	
	
	
	/**
	 * 신고 관련
	 */
	// 신고 목록 
	@Override
	public List<AdminVO> getListReport(Criteria cri) throws Exception {
		mylog.debug(" getListReport(Criteria cri) 페이징처리 ");
		
		return sqlSession.selectList(NAMESPACE + ".listReport", cri);
	}
	
	// 신고전체개수
	@Override
	public int totalRepCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countReport");
	}
	
	// 신고상세
	@Override
	public AdminVO getReport(Integer rep_no) throws Exception {
		AdminVO vo = sqlSession.selectOne(NAMESPACE + ".getReport", rep_no);				
		return vo;
	}
	
}
