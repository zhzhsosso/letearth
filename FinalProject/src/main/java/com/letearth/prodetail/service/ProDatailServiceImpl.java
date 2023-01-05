package com.letearth.prodetail.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.letearth.member.domain.MemberVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.prodetail.domain.LikeyVO;
import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.prodetail.domain.ProReplyVO;
import com.letearth.prodetail.domain.ProReportVO;
import com.letearth.prodetail.persistence.ProDetailDAO;

@Service
public class ProDatailServiceImpl implements ProDetailService {
	
	@Inject
	private ProDetailDAO pddao;

	@Override
	public List<ProDetailVO> getProInfo(int pro_no) throws Exception {
		List<ProDetailVO> resultVO = pddao.getProInfo(pro_no);

		return resultVO;
	}

	@Override
	public List<ProDetailVO> getProIntro(int pro_no) throws Exception {
		List<ProDetailVO> resultVO = pddao.getProIntro(pro_no);
		return resultVO;
	}

	@Override
	public void sellNotice(ProReplyVO prvo) throws Exception {
		pddao.sellNotice(prvo);
		
	}

	@Override
	public List<ProReplyVO> getsnListAll(Integer pro_no) throws Exception {
		return pddao.getsnListAll(pro_no);
	}

	@Override
	public List<ProReplyVO> geturListAll(Integer pro_no) throws Exception {
		
		return pddao.geturListAll(pro_no);
	}

	@Override
	public void reReply(ProReplyVO prvo) throws Exception {
		pddao.reReply(prvo);
		
	}

	@Override
	public ProDetailVO getProjectDetail(Integer pro_no) throws Exception {
		return pddao.getProjectDetail(pro_no);
	}

	@Override
	public void reporter(ProReportVO rpvo) throws Exception {
		pddao.reporter(rpvo);
		
	}

	@Override
	public void reporterRp(ProReportVO rpvo) throws Exception {
		pddao.reporterRp(rpvo);
		
	}

	@Override
	public List<ProReplyVO> getListPage(Criteria cri) throws Exception {
		return pddao.getListPage(cri);
	}

	@Override
	public int totalCnt() throws Exception {
		return pddao.totalCnt();
	}
	
	@Override
	public MemberVO getBanId(String mem_id) throws Exception {
		return pddao.getBanId(mem_id);
	}

	@Override
	public Integer findLike(LikeyVO lvo) {
		return pddao.findLike(lvo);
	}

	@Override
	public void insertLike(LikeyVO lvo) {
		pddao.insertLike(lvo);
	}

	@Override
	public void deleteLike(LikeyVO lvo) {
		pddao.deleteLike(lvo);
	}

	@Override
	public List<ProDetailVO> getReward(int pro_no) throws Exception {
		List<ProDetailVO> resultVO = pddao.getReward(pro_no);
		return resultVO;
	}
}
