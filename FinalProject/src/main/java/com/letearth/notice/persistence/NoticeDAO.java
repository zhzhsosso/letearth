package com.letearth.notice.persistence;

import java.util.List;

import com.letearth.notice.domain.NoticeVO;
import com.letearth.prodetail.domain.Criteria;

public interface NoticeDAO {

	public String getServerTime();
	
	// 공지사항 글쓰기
	public void createNotice(NoticeVO vo) throws Exception;
	
	// 고객센터 메인
	public List<NoticeVO> getNoticeList() throws Exception;
	
	// 글 조회수 1 증가
	public void updateViewcnt(Integer not_no) throws Exception;
	 
	// 글번호(not_no)를 사용한 정보 조회
	public NoticeVO getNotice(Integer not_no) throws Exception;
	
	// 글정보 수정
	/**
	 * 글정보 수정하는 메서드
	 * @param vo
	 * @return 수정여부 0,1
	 * @throws Exception
	 */
	public Integer updateNotice(NoticeVO vo) throws Exception;
	
	// 글정보 삭제
	public void deleteNotice(Integer not_no) throws Exception;
	
	// 공지사항
	public List<NoticeVO> getNoticeAllList() throws Exception;
	
	// 이벤트
	public List<NoticeVO> getNoticeEventList() throws Exception;
	
	// 페이징 처리 구현된 리스트 조회
	public List<NoticeVO> getListPage(Integer page) throws Exception;
	
	public List<NoticeVO> getListPage(Criteria cri) throws Exception;
	
	// 페이징 처리 구현된 리스트 조회 - 공지
	public List<NoticeVO> getAllListPage(Integer page) throws Exception;
	
	public List<NoticeVO> getAllListPage(Criteria cri) throws Exception;
	
	// 페이징 처리 구현된 리스트 조회 - 이벤트
	public List<NoticeVO> getEventListPage(Integer page) throws Exception;
	
	public List<NoticeVO> getEventListPage(Criteria cri) throws Exception;
	
	
}
