package com.letearth.openbank.persistence;

import java.util.List;

import com.letearth.member.domain.MemberVO;
import com.letearth.openbank.domain.SettleVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.project.domain.ProjectVO;

public interface OpenbankDAO {
	
	//마감이면서 달성완료된 프로젝트 조회
	public List<ProjectVO> getListSettle(Criteria cri) throws Exception;
	
	//프로젝트 개수
	public int totalst() throws Exception;
	
	//프로젝트 상세정보
	public SettleVO getSettleDetail(int pro_no) throws Exception;
	
	//프로젝트 상태 8업데이트
	public Integer updateStat(Integer pro_no) throws Exception;
	
	//정산완료 리스트
	public List<ProjectVO> getComplete(Criteria cri) throws Exception;
	
	//정산완료 프로젝트 개수
	public int totalcp() throws Exception;
	
	// 토큰, 일련번호 저장
	public Integer setBank(MemberVO mvo) throws Exception;
	
	//관리자 핀테크정보조회
	public MemberVO getAdminFin(String mem_id) throws Exception;
	
	//판매자 핀테크 정보조회
	public MemberVO getSellFin(Integer pro_no) throws Exception;
}
