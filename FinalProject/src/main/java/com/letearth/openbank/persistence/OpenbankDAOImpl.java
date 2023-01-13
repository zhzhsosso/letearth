package com.letearth.openbank.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.letearth.member.domain.MemberVO;
import com.letearth.openbank.domain.SettleVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.project.domain.ProjectVO;

@Repository
public class OpenbankDAOImpl implements OpenbankDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.letearth.mapper.openbankMapper";

	@Override
	public List<ProjectVO> getListSettle(Criteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".getListSettle",cri);
	}

	@Override
	public int totalst() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".totalst");
	}

	@Override
	public SettleVO getSettleDetail(int pro_no) throws Exception {
		SettleVO prostVO = sqlSession.selectOne(NAMESPACE+".getSettleDetail",pro_no);
		return prostVO;
	}

	@Override
	public Integer updateStat(Integer pro_no) throws Exception {
		return sqlSession.update(NAMESPACE+".updateStat",pro_no);
	}

	@Override
	public List<ProjectVO> getComplete(Criteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getComplete",cri);
	}

	@Override
	public int totalcp() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".totalcp");
	}
	
	@Override
	public Integer setBank(MemberVO mvo) throws Exception {
		
		return sqlSession.update("com.letearth.mapper.memberMapper.setBank", mvo);
	}

	@Override
	public MemberVO getAdminFin(String mem_id) throws Exception {
		MemberVO adfin = sqlSession.selectOne(NAMESPACE+".getAdminFin",mem_id);
		return adfin;
	}

	@Override
	public MemberVO getSellFin(Integer pro_no) throws Exception {
		MemberVO sellfin = sqlSession.selectOne(NAMESPACE+".getSellFin", pro_no);
		return sellfin;
	}
	
	
	
	
	
	
	
	
	
}
