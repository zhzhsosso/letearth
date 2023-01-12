package com.letearth.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.letearth.prodetail.domain.Criteria;
import com.letearth.admin.domain.MemOrdVO;
import com.letearth.order.domain.OrderVO;
import com.letearth.admin.persistence.AdMemproDAO;
import com.letearth.member.domain.MemberVO;
import com.letearth.project.domain.ProjectVO;


@Service
public class AdMemproServiceImpl implements AdMemproService {

	@Inject
	private AdMemproDAO admemproDAO;
	

	private static final Logger mylog 
			= LoggerFactory.getLogger(AdMemproServiceImpl.class);

	/**
	 * 프로젝트
	 */
	
	@Override
	public List<ProjectVO> getListPro1(Criteria cri) throws Exception {
		mylog.debug(" getListPro1(Criteria cri) 호출 -> DAO 동작 호출");
		return admemproDAO.getListPro1(cri) ;
	}

	@Override
	public ProjectVO getDetailPro1(int pro_no) throws Exception {
		mylog.debug(" getDetailPro1(Integer pro_no) 호출 -> DAO 동작 호출");
		System.out.println(" getDetailPro1(Integer pro_no) 호출 -> DAO 동작 호출");
		return admemproDAO.getDetailPro1(pro_no);
	}

	@Override
	public List<ProjectVO> getListPro2(Criteria cri) throws Exception {
		mylog.debug(" getListPro2(Criteria cri) 호출 -> DAO 동작 호출");
		return admemproDAO.getListPro2(cri);
	}
	
	@Override
	public ProjectVO getDetailPro2(int pro_no) throws Exception {
		mylog.debug(" getDetailPro2(Integer pro_no) 호출 -> DAO 동작 호출");
		System.out.println(" getDetailPro2(Integer pro_no) 호출 -> DAO 동작 호출");
		return admemproDAO.getDetailPro2(pro_no);
	}

	@Override
	public ProjectVO getDetailShip(int pro_no) throws Exception {
		mylog.debug(" getDetailShip(Integer pro_no) 호출 -> DAO 동작 호출");
		return admemproDAO.getDetailShip(pro_no);
	}
	
	
	@Override
	public List<OrderVO> proOrdMemList(OrderVO ordVO) throws Exception {
		mylog.debug(" proOrdMemList(int pro_no) 호출 -> DAO 동작 호출");
		return admemproDAO.proOrdMemList(ordVO);
	}
	
	
	@Override
	public int totalPro1() throws Exception {
		return admemproDAO.totalPro1();
	}
	
	@Override
	public int totalPro2() throws Exception {
		return admemproDAO.totalPro2();
	}
	
	@Override
	public Integer updateProStatus3(ProjectVO proVO) throws Exception {
		return admemproDAO.updateProStatus3(proVO);
	}
	
	@Override
	public Integer updateProStatus4(ProjectVO proVO) throws Exception {
		return admemproDAO.updateProStatus4(proVO);
	}
	
	
	
	/**
	 * 회원
	 */
	@Override
	public List<MemberVO> getMemList(Criteria cri) {
		return admemproDAO.getMemList(cri);
	}

	@Override
	public MemberVO getMemDetail(String mem_id) {
		return admemproDAO.getMemDetail(mem_id);
	}
	
	@Override
////	public List<OrderVO> memOrdList(OrderVO ordVO) {
	public List<MemOrdVO> memOrdList(MemOrdVO moVO) {
		return admemproDAO.memOrdList(moVO);
	}

	@Override
	public List<ProjectVO> memProList(ProjectVO proVO) {
		System.out.println("proVO가 있나없나 판단해보자 : 서비스 " + proVO);
		return admemproDAO.memProList(proVO);
	}

	@Override
	public void deleteMem(MemberVO memVO) {
		mylog.debug(" deleteMem(memVO) 호출 ");
		admemproDAO.deleteMem(memVO);
	}

	@Override
	public int totalMem() throws Exception {
		return admemproDAO.totalMem();
	}
	
	
	@Override
	public int totalMemOrd(String mem_id) throws Exception {
		int memOrd= admemproDAO.totalMemOrd(mem_id);
		return memOrd;
	}
	
	
	@Override
	public int totalMemPro(String mem_id) throws Exception {
		int memPro= admemproDAO.totalMemPro(mem_id);
		return memPro;
	}
	
	
	
	
}
