package com.letearth.prodetail.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.letearth.member.domain.MemberVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.prodetail.domain.ProReplyVO;
import com.letearth.prodetail.domain.ProReportVO;

@Repository
public class ProDetailDAOImpl implements ProDetailDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.letearth.mapper.prodetailMapper";
	private static final Logger mylog = LoggerFactory.getLogger(ProDetailDAOImpl.class);

	@Override
	public List<ProDetailVO> getProInfo(int pro_no) throws Exception{
		
		return sqlSession.selectList(NAMESPACE + ".getProInfo", pro_no);
	}

	@Override
	public List<ProDetailVO> getProIntro(int pro_no) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getProIntro", pro_no);
	}

	@Override
	public List<ProDetailVO> getReward(int pro_no) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getReward", pro_no);
	}

	@Override
	public void sellNotice(ProReplyVO prvo) throws Exception {
		sqlSession.insert(NAMESPACE+ ".sninsert", prvo);
		
	}

	@Override
	public List<ProReplyVO> getsnListAll(Integer pro_no) throws Exception {
		List<ProReplyVO> snList = sqlSession.selectList(NAMESPACE+".getsnListAll", pro_no);
		return snList;
	}

	@Override
	public List<ProReplyVO> geturListAll(Integer pro_no) throws Exception {
		List<ProReplyVO> urList = sqlSession.selectList(NAMESPACE+".geturListAll", pro_no);
		return urList;
	}

	@Override
	public void reReply(ProReplyVO prvo) throws Exception {
		sqlSession.update(NAMESPACE+ ".rrupdate", prvo);
		
	}

	@Override
	public ProDetailVO getProjectDetail(Integer pro_no) throws Exception {
		ProDetailVO pdvo = sqlSession.selectOne(NAMESPACE + ".getProjectDetail", pro_no);
		return pdvo;
	}

	@Override
	public void reporter(ProReportVO rpvo) throws Exception {
		sqlSession.insert(NAMESPACE+".rpinsert",rpvo);
		
	}

	@Override
	public void reporterRp(ProReportVO rpvo) throws Exception {
		sqlSession.insert(NAMESPACE+".replyrepo",rpvo);
		
	}

	@Override
	public List<ProReplyVO> getListPage(Criteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listPage", cri);
	}

	@Override
	public int totalCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countBoard");
	}

	@Override
	public Integer findLike(LikeyVO lvo) {
		return sqlSession.selectOne(NAMESPACE + ".findLike", lvo);
	}

	@Override
	public void insertLike(LikeyVO lvo) {
		sqlSession.insert(NAMESPACE + ".insertLike", lvo);
	}

	@Override
	public void deleteLike(LikeyVO lvo) {
		sqlSession.delete(NAMESPACE + ".deleteLike", lvo);
	}
	
	@Override
	public MemberVO getBanId(String mem_id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+".getIdStatus",mem_id);
	}


}
