package com.letearth.prodetail.persistence;

import java.util.List;

import com.letearth.prodetail.domain.ProDetailVO;

public interface MainDAO {

	// 프로젝트 정보 불러오기 - 최신순
	public List<ProDetailVO> getProjectList() throws Exception;

	// 프로젝트 정보 불러오기 - 달성률순
	public List<ProDetailVO> getPopularProject() throws Exception;
	
	// 오픈 예정 프로젝트 정보 불러오기
	public List<ProDetailVO> getScheList();
		
	// 오픈 예정 클래스 정보 불러오기
	public List<ProDetailVO> getScheclassList();
		
	// 오픈 예정 상품 정보 불러오기
	public List<ProDetailVO> getScheprodList();
		
		
	// 진행 중 프로젝트 정보 불러오기
	public List<ProDetailVO> getNowList();
		
	// 진행 중 클래스 정보 불러오기
	public List<ProDetailVO> getNowclassList();
		
	// 진행 중 상품 정보 불러오기
	public List<ProDetailVO> getNowprodList();
		
		
	// 마감 프로젝트 정보 불러오기
	public List<ProDetailVO> getEndList();
		
	// 마감 클래스 정보 불러오기
	public List<ProDetailVO> getEndclassList();
		
	// 마감 상품 정보 불러오기
	public List<ProDetailVO> getEndprodList();
}
