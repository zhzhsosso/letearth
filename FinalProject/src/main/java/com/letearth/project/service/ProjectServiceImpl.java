package com.letearth.project.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.letearth.project.domain.ProjectVO;
import com.letearth.project.domain.RewardVO;
import com.letearth.project.persistence.ProjectDAO;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Inject
	private ProjectDAO proDAO;
	
	private static final Logger mylog = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	/**
	 * 프로젝트 번호 생성
	 */
	@Override
	public void insertProNo(ProjectVO proVo) throws Exception {
		mylog.debug("insertProNo(ProjectVO proVo) 호출 -> DAO 동작 호출 ");
		proDAO.insertProNo(proVo);
		
		mylog.debug("프로젝트 번호 생성 완료 -> 컨트롤러 이동");
	}
	
	/**
	 * 프로젝트 기본정보
	 */
	@Override
	public void updatePro_basicInfo(ProjectVO proVO) throws Exception {
		mylog.debug("updatePro_basicInfo(ProjectVO proVo) -> DAO ");
		
		proDAO.updatePro_basicInfo(proVO);
		mylog.debug("기본정보 입력완료 -> 컨트롤러 이동");
	}
	
	/**
	 * 기본정보 조회
	 */
	@Override
	public ProjectVO getBasicInfo(ProjectVO proVO) throws Exception {
		return proDAO.getBasicInfo(proVO);
	}

	/**
	 * 프로젝트 일정 등록
	 */
	@Override
	public void updatePlan(ProjectVO proVo) throws Exception {
		mylog.debug("updatePlan(ProjectVO proVo) 호출 -> DAO 동작 호출 ");
		proDAO.updatePlan(proVo);
		
		mylog.debug("프로젝트 일정 업데이트 완료 -> 컨트롤러 이동");
	}
	
	/**
	 * 일정 조회
	 */
	@Override
	public ProjectVO getPlan(ProjectVO proVO) throws Exception {
		return proDAO.getPlan(proVO);
	}
	
	/**
	 * 리워드 생성
	 */
	@Override
	public void createReward(RewardVO rewVO) throws Exception {
		mylog.debug(" createRewardVO(RewardVO rewVO) 호출 -> DAO 동작 호출 ");
		proDAO.createReward(rewVO);
		
		mylog.debug(" 서비스 : 리워드 생성완료 -> 컨트롤러 이동");
	}

	/**
	 * 리워드 조회
	 */
	@Override
	public List<RewardVO> getReward(RewardVO rewVO) throws Exception {
		mylog.debug(" getReward(Integer project_no) 호출 -> DAO 동작 호출 ");
		
		return proDAO.getReward(rewVO);
	}
	
	/**
	 * 리워드 삭제
	 */
	@Override
	public void deleteReward(RewardVO rewVO) throws Exception {
		mylog.debug("deleteReward(RewardVO rewVO) 호출 -> DAO 동작 호출 ");
		
		proDAO.deleteReward(rewVO);
	}

	/**
	 * 스토리 업데이트
	 */
	@Override
	public void updateStory(ProjectVO proVO) throws Exception {
		mylog.debug("updateStory(ProjectVO proVO) -> DAO ");
		
		proDAO.updateStory(proVO);
		
	}
	
	/**
	 * 스토리 조회
	 */
	@Override
	public ProjectVO getStory(ProjectVO proVO) throws Exception {
		return proDAO.getStory(proVO);
	}
	
	/**
	 * 정책 업데이트
	 */
	@Override
	public void updatePolicy(ProjectVO proVO) throws Exception {
		mylog.debug(" updatePolicy(ProjectVO proVO) -> DAO ");
		
		proDAO.updatePolicy(proVO);
	}
	
	/**
	 * 정책 조회
	 */
	@Override
	public ProjectVO getPolicy(ProjectVO proVO) throws Exception {
		return proDAO.getPolicy(proVO);
	}

	/**
	 * 대표자 및 정산 정보 등록
	 */
	@Override
	public void updatePartner(ProjectVO proVO) throws Exception {
		mylog.debug("updatePartner(ProjectVO proVO) -> DAO ");
		
		proDAO.updatePartner(proVO);
	}
	
	/**
	 * 대표자 조회
	 */
	@Override
	public ProjectVO getPart(ProjectVO proVO) throws Exception {
		return proDAO.getPart(proVO);
	}
	
	

}
