package com.letearth.notice.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.letearth.notice.domain.NoticeCriteria;
import com.letearth.notice.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	private static final Logger mylog = LoggerFactory.getLogger(NoticeDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.letearth.mapper.noticeMapper";
	
	@Override
	public String getServerTime() {
		
		return sqlSession.selectOne(NAMESPACE+".getTime");

	}

	@Override
	public void createNotice(NoticeVO vo) throws Exception {

		mylog.debug(" createNotice(NoticeVO vo) -> mapper 동작 호출 ");
		sqlSession.insert(NAMESPACE + ".create", vo);
		
	}

	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		
		mylog.debug(" getNoticeListAll() -> sqlWession-mapper 동작 호출 ");
		List<NoticeVO> noticeList = sqlSession.selectList(NAMESPACE + ".list");
		mylog.debug(" 게시판 글 개수 : "+noticeList.size()+"");
		
		return noticeList;
	}

	@Override
	public void updateViewcnt(Integer not_no) throws Exception {
		
		sqlSession.update(NAMESPACE + ".updateViewcnt", not_no);
	}

	@Override
	public NoticeVO getNotice(Integer not_no) throws Exception {
		
		NoticeVO vo = sqlSession.selectOne(NAMESPACE + ".getNotice", not_no);
		return vo;
	}

	@Override
	public Integer updateNotice(NoticeVO vo) throws Exception {
		
		return sqlSession.update(NAMESPACE + ".updateNotice", vo);
	}

	@Override
	public void deleteNotice(Integer not_no) throws Exception {
		
		sqlSession.delete(NAMESPACE + ".deleteNotice", not_no);
	}

	@Override
	public List<NoticeVO> getNoticeAllList() throws Exception {
		List<NoticeVO> noticeAllList = sqlSession.selectList(NAMESPACE + ".allList");
		
		return noticeAllList;
	}

	@Override
	public List<NoticeVO> getNoticeEventList() throws Exception {
		List<NoticeVO> noticeEventList = sqlSession.selectList(NAMESPACE + ".eventList");
		
		return noticeEventList;
	}

	@Override
	public List<NoticeVO> getListPage(Integer page) throws Exception {
		// 페이지정보 계산
		if(page < 0) {
			page = 1;
		}
		// 디비에서 5개씩 조회
		page = (page - 1) * 5;	
		
		return sqlSession.selectList(NAMESPACE + ".listPage", page);
	}

	@Override
	public List<NoticeVO> getListPage(NoticeCriteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".listPage2", cri);
	}

	//공지
	@Override
	public List<NoticeVO> getAllListPage(Integer page) throws Exception {
		// 페이지정보 계산
		if(page < 0) {
			page = 1;
		}
		// 디비에서 5개씩 조회
		page = (page - 1) * 5;	
		
		return sqlSession.selectList(NAMESPACE + ".allListPage", page);
	}

	@Override
	public List<NoticeVO> getAllListPage(NoticeCriteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".allListPage2", cri);
	}

	//이벤트
	@Override
	public List<NoticeVO> getEventListPage(Integer page) throws Exception {
		// 페이지정보 계산
		if(page < 0) {
			page = 1;
		}
		// 디비에서 5개씩 조회
		page = (page - 1) * 5;	
		
		return sqlSession.selectList(NAMESPACE + ".eventistPage", page);
	}

	@Override
	public List<NoticeVO> getEventListPage(NoticeCriteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".eventListPage2", cri);
	}


	@Override
	public int totalCnt() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".countNotice");
	}

	@Override
	public int totalACnt() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".countANotice");
	}

	@Override
	public int totalECnt() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".countENotice");
	}
	
	
	
	
}
