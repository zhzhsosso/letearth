package com.letearth.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.letearth.admin.domain.AdminVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.admin.persistence.AdReportDAO;
import com.letearth.member.domain.MemberVO;
import com.letearth.project.domain.ProjectVO;

@Service
public class AdReportServiceImpl implements AdReportService {

	private static final Logger mylog = LoggerFactory.getLogger(AdReportServiceImpl.class);
	
	@Inject
	private AdReportDAO adReportDAO;
	
	/**
	 * 블랙리스트 관련 오버라이딩
	 */
	// 블랙리스트 회원
	@Override
	public Integer updateBlackMem(AdminVO vo) throws Exception {
		
		return adReportDAO.updateBlackMem(vo);
	}
	
	// 블랙리스트 프로젝트
	@Override
	public Integer updateBlackPro(AdminVO vo) throws Exception {
		
		return adReportDAO.updateBlackPro(vo);
	}
	
	// 블랙리스트 목록
	@Override
	public List<AdminVO> getListBlack(Criteria cri) throws Exception {
		
		return adReportDAO.getListBlack(cri);
	}
	
	// 블랙리스트 글 전체개수
	@Override
	public int totalBlackCnt() throws Exception {
		return adReportDAO.totalBlackCnt();
	}
	
	
	
	
	
	
	/**
	 * 신고접수 관련 오버라이딩
	 */
	// 신고 목록 조회 전체
	@Override
	public List<AdminVO> getListAllReport(Criteria cri) throws Exception {
		
		return adReportDAO.getListAllReport(cri);
	}
	
	// 신고 목록 조회
	@Override
	public List<AdminVO> getListReport(Criteria cri, int rep_cat) throws Exception {
		
		return adReportDAO.getListReport(cri, rep_cat);
	}
	
	// 신고 글 전체개수
	@Override
	public int totalRepCntAll() throws Exception {
		return adReportDAO.totalRepCntAll();
	}
	
	// 신고 글 부분전체개수
	@Override
	public int totalRepCnt() throws Exception {
		return adReportDAO.totalRepCnt();
	}
	
	
	// 신고상세
	@Override
	public AdminVO getReport(Integer rep_no) throws Exception {
		return adReportDAO.getReport(rep_no);
	}
	
	// 신고검색
//	@Override
//	public List<AdminVO> getListReport(String type, String keyword, Criteria cri) throws Exception {
//		
//		return adReportDAO.getListReport(type, keyword, cri);
//	}
}
