package com.letearth.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.letearth.notice.controller.NoticeController;
import com.letearth.notice.domain.NoticeVO;
import com.letearth.notice.persistence.NoticeDAO;
import com.letearth.prodetail.domain.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private static final Logger mylog = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Inject
	private NoticeDAO notDAO;

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		mylog.debug("insertNotice(NoticeVO vo) 호출 -> DAO 동작 호출");
		
		notDAO.createNotice(vo);
		
		mylog.debug("글쓰기 완료 -> 컨트롤러 이동");
	}

	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		mylog.debug(" getNoticeList() - DAO 호출(결과 리턴받기) ");
		
		return notDAO.getNoticeList();
	}

	@Override
	public void updateViewcnt(Integer not_no) throws Exception {
		notDAO.updateViewcnt(not_no);
	}

	@Override
	public NoticeVO getNotice(Integer not_no) throws Exception {
		
		return notDAO.getNotice(not_no);
	}

	@Override
	public Integer updateNotice(NoticeVO vo) throws Exception {

		return notDAO.updateNotice(vo);
	}

	@Override
	public void deleteNotice(Integer not_no) throws Exception {
		
		notDAO.deleteNotice(not_no);
	}

	@Override
	public List<NoticeVO> getNoticeAllList() throws Exception {

		return notDAO.getNoticeAllList();
	}

	@Override
	public List<NoticeVO> getNoticeEventList() throws Exception {

		return notDAO.getNoticeEventList();
	}

	@Override
	public List<NoticeVO> getListPage(Criteria cri) throws Exception {
		
		return notDAO.getListPage(cri);
	}

	@Override
	public List<NoticeVO> getAllListPage(Criteria cri) throws Exception {
		
		return notDAO.getAllListPage(cri);
	}

	@Override
	public List<NoticeVO> getEventListPage(Criteria cri) throws Exception {
		
		return notDAO.getEventListPage(cri);
	}
	
	
}
