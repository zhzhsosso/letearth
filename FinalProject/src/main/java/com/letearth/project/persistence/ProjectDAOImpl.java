package com.letearth.project.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.letearth.project.domain.ProjectVO;
import com.letearth.project.domain.RewardVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// 로거 객체 생성
	private static final Logger mylog = LoggerFactory.getLogger(ProjectDAOImpl.class);
	
	// mapper NAMESPACE 정보
	private static final String NAMESPACE
			="com.letearth.mapper.projectMapper";
	
	/**
	 * 프로젝트 번호 생성
	 */
	
	@Override
	public void insertProNo(ProjectVO proVo) throws Exception {
		mylog.debug("insertProNo(ProjectVO vo) -> mapper 동작 호출");
		sqlSession.insert(NAMESPACE + ".insertProNo", proVo);
	}
	
	/**
	 * 프로젝트 기본정보 등록 오버라이딩
	 */
	@Override
	public void updatePro_basicInfo(ProjectVO vo) throws Exception {
		sqlSession.insert(NAMESPACE +".updatePro_basicInfo", vo);
		
		mylog.debug("프로젝트 기본정보 등록완료! -> 서비스 이동");
	}
	
	/**
	 * 프로젝트 일정 등록
	 */
	@Override
	public void updatePlan(ProjectVO proVO) throws Exception {
		mylog.debug("updatePlan(ProjectVO proVO) -> mapper 동작 호출");
		sqlSession.update(NAMESPACE + ".updatePlan", proVO);;
		
		mylog.debug("프로젝트 일정 등록완료! -> 서비스 이동");
	}


	/**
	 * 리워드 생성
	 */
	@Override
	public void createReward(RewardVO rewVO) {
		
		mylog.debug(" createReward(RewardVO rewVO) -> mapper 동작 호출");
		sqlSession.insert(NAMESPACE+".createReward", rewVO);
		
		mylog.debug(" DAO : 리워드 생성 완료 ");
	}

	/**
	 * 리워드 조회
	 */
	@Override
	public List<RewardVO> getReward(RewardVO rewVO) throws Exception {
		mylog.debug("getReward(RewardVO rewVO) -> mapper 동작 호출");
		
		List<RewardVO> rewList = sqlSession.selectList(NAMESPACE+".getReward", rewVO);
		return rewList;
	}
	
	/**
	 * 리워드 삭제
	 */
	@Override
	public void deleteReward(RewardVO rewVO) throws Exception {
		mylog.debug("deleteReward(RewardVO rewVO) -> mapper 동작 호출");
		
		sqlSession.delete(NAMESPACE + ".deleteReward", rewVO);
		
	}

	/**
	 * 스토리 업데이트
	 */
	@Override
	public void updateStory(ProjectVO proVO) {
		System.out.println(proVO.getPro_story());
		System.out.println(proVO.getPro_no());

		sqlSession.update(NAMESPACE + ".updateStory", proVO);		
	}
	
	/**
	 * 정책 업데이트
	 */
	@Override
	public void updatePolicy(ProjectVO proVO) {
		sqlSession.update(NAMESPACE + ".updatePolicy", proVO);
	}

	/**
	 * 대표자 및 정산 정보 등록
	 */
	@Override
	public void updatePartner(ProjectVO proVO) {
		sqlSession.update(NAMESPACE + ".updatePartner", proVO);
		System.out.println(" DAOImpl : 대표자 및 정산 정보 등록 성공! ");	
	}

}
