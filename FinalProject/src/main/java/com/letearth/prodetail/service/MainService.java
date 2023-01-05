package com.letearth.prodetail.service;

import java.util.List;

import com.letearth.prodetail.domain.ProDetailVO;

public interface MainService {

	// 프로젝트 정보 불러오기 - 최신순
	public List<ProDetailVO> getProjectList() throws Exception;

	// 프로젝트 정보 불러오기 - 인기순
	public List<ProDetailVO> getPopularProject() throws Exception;

	// 프로젝트 정보 불러오기 - 오픈 예정 메인
	public List<ProDetailVO> getScheList();

	// 프로젝트 정보 불러오기 - 오픈 예정 클래스
	public List<ProDetailVO> getScheclassList();
		
	// 프로젝트 정보 불러오기 - 오픈 예정 상품
	public List<ProDetailVO> getScheprodList();
		
	// 프로젝트 정보 불러오기 - 진행 중 메인
	public List<ProDetailVO> getNowList();

	// 프로젝트 정보 불러오기 - 진행 중 클래스
	public List<ProDetailVO> getNowclassList();
		
	// 프로젝트 정보 불러오기 - 진행 중 상품
	public List<ProDetailVO> getNowprodList();
		
	// 프로젝트 정보 불러오기 - 마감 메인
	public List<ProDetailVO> getEndList();
		
	// 프로젝트 정보 불러오기 - 마감 클래스
	public List<ProDetailVO> getEndclassList();
		
	// 프로젝트 정보 불러오기 - 마감 상품
	public List<ProDetailVO> getEndprodList();
}
