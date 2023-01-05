package com.letearth.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.letearth.admin.domain.AdminVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.admin.persistence.AdBoardDAO;

@Service
public class AdBoardServiceImpl implements AdBoardService {

	private static final Logger mylog = LoggerFactory.getLogger(AdBoardServiceImpl.class);
	
	@Inject
	private AdBoardDAO adBoardDAO;
	
	
	/**
	 * FAQ 관련 오버라이딩
	 */
	
	// FAQ 등록
	@Override
	public void insertFaq(AdminVO vo) throws Exception {		
		adBoardDAO.insertFaq(vo);
		
		mylog.debug("FAQ 완료 -> 컨트롤러 이동");		
	}
	
	
	// FAQ 목록 조회(페이징처리-cri)
	@Override
	public List<AdminVO> getListFaq(Criteria cri) throws Exception {
		
		return adBoardDAO.getListFaq(cri);
	}
	
	
	// 글전체개수
	@Override
	public int totalFaqCnt() throws Exception {
		return adBoardDAO.totalFaqCnt();
	}
		
	
	// FAQ 조회수
	@Override
	public void updateViewcnt(Integer not_no) throws Exception {
		adBoardDAO.updateViewcnt(not_no);
	}
	
	
	// FAQ 본문보기(notice_no)
	@Override
	public AdminVO getFaq(Integer not_no) throws Exception {
		
		return adBoardDAO.getFaq(not_no);
	}
	
	
	// FAQ 수정
	@Override
	public Integer updateFaq(AdminVO vo) throws Exception {
		
		return adBoardDAO.updateFaq(vo);
	}
	
	
	// FAQ 삭제
	@Override
	public void deleteFaq(Integer not_no) throws Exception {
		 adBoardDAO.deleteFaq(not_no);		
	}
	
	
	
	/**
	 * 1:1문의 오버라이딩
	 */
	// 1:1문의 리스트
	@Override
	public List<AdminVO> adRewriteList(Criteria cri) throws Exception {
		return adBoardDAO.adRewriteList(cri);
	}
	
	// 1:1문의 전체 글개수
	@Override
	public int totalRewriteCnt() throws Exception {
		return adBoardDAO.totalRewriteCnt();
	}
	
	// 1:1문의 본문보기(not_no)
	@Override
	public AdminVO getRewrite(Integer not_no) throws Exception {
		return adBoardDAO.getRewrite(not_no);
	}

	// 1:1문의 작성 
	@Override
	public Integer insertRewrite(AdminVO vo) throws Exception {
		return adBoardDAO.insertRewrite(vo);
	}
	
	// 1:1 문의 삭제
	@Override
	public void deleteRewrite(Integer not_no) throws Exception {
		adBoardDAO.deleteRewrite(not_no);		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
