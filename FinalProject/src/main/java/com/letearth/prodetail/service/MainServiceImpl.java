package com.letearth.prodetail.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.letearth.prodetail.domain.ProDetailVO;
import com.letearth.prodetail.persistence.MainDAO;

@Service
public class MainServiceImpl implements MainService {

	@Inject
	private MainDAO maindao;
	
	@Override
	public List<ProDetailVO> getProjectList() throws Exception{

		return maindao.getProjectList();
	}

	@Override
	public List<ProDetailVO> getPopularProject() throws Exception{

		return maindao.getPopularProject();
	}

	//sche
		@Override
		public List<ProDetailVO> getScheList() {
			
			return maindao.getScheList();
		}

		@Override
		public List<ProDetailVO> getScheclassList() {

			return maindao.getScheclassList();
		}

		@Override
		public List<ProDetailVO> getScheprodList() {

			return maindao.getScheprodList();
		}
		
		
		//now
		@Override
		public List<ProDetailVO> getNowList() {
			
			return maindao.getNowList();
		}

		@Override
		public List<ProDetailVO> getNowclassList() {

			return maindao.getNowclassList();
		}

		@Override
		public List<ProDetailVO> getNowprodList() {

			return maindao.getNowprodList();
		}
		
		
		//end
		@Override
		public List<ProDetailVO> getEndList() {

			return maindao.getEndList();
		}

		@Override
		public List<ProDetailVO> getEndclassList() {

			return maindao.getEndclassList();
		}

		@Override
		public List<ProDetailVO> getEndprodList() {

			return maindao.getEndprodList();
		}
}
