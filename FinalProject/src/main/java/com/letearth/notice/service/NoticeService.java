package com.letearth.notice.service;

import java.util.List;

import com.letearth.notice.domain.NoticeCriteria;
import com.letearth.notice.domain.NoticeVO;

public interface NoticeService {

	// 공지사항 글 쓰기
	public void insertNotice(NoticeVO vo) throws Exception;
	
	// 고객센터 메인
	public List<NoticeVO> getNoticeList() throws Exception;
	
	// 글 조회수 1 증가
	public void updateViewcnt(Integer not_no) throws Exception;
	
	// 글번호(bno) 정보 조회
	public NoticeVO getNotice(Integer not_no) throws Exception;
	
	// 글 정보 수정
	public Integer updateNotice(NoticeVO vo) throws Exception;
	
	// 글 정보 삭제
	public void deleteNotice(Integer not_no) throws Exception;
	
	// 공지사항
	public List<NoticeVO> getNoticeAllList() throws Exception;
	
	// 이벤트
	public List<NoticeVO> getNoticeEventList() throws Exception;
	
	// 글정보 조회(페이징 처리 cri)
	public List<NoticeVO> getListPage(NoticeCriteria cri) throws Exception;
	
	// 공지 조회(페이징 처리 cri)
	public List<NoticeVO> getAllListPage(NoticeCriteria cri) throws Exception;
	
	// 이벤트 조회(페이징 처리 cri)
	public List<NoticeVO> getEventListPage(NoticeCriteria cri) throws Exception;
	
	// 글 전체 개수 
	public int totalCnt() throws Exception;
	
	// 글 전체 개수 
	public int totalACnt() throws Exception;
	
	// 글 전체 개수 
	public int totalECnt() throws Exception;
	
}
