package com.letearth.prodetail.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.letearth.prodetail.domain.ProDetailVO;

@Repository
public class MainDAOImpl implements MainDAO {
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.letearth.mapper.prodetailMapper";
	
	@Override
	public List<ProDetailVO> getProjectList() throws Exception{
		List<ProDetailVO> projectList = sqlSession.selectList(NAMESPACE + ".getProjectList");
		
		return projectList;
	}

	@Override
	public List<ProDetailVO> getPopularProject() throws Exception{
		List<ProDetailVO> popularList = sqlSession.selectList(NAMESPACE + ".getPopularProject");
		return popularList;
	}
	//sche
		@Override
		public List<ProDetailVO> getScheList() {
			List<ProDetailVO> scheList = sqlSession.selectList(NAMESPACE + ".getScheList");
			return scheList;
		}

		@Override
		public List<ProDetailVO> getScheclassList() {
			List<ProDetailVO> scheclassList = sqlSession.selectList(NAMESPACE + ".getScheclassList");
			return scheclassList;
		}

		@Override
		public List<ProDetailVO> getScheprodList() {
			List<ProDetailVO> scheprodList = sqlSession.selectList(NAMESPACE + ".getScheprodList");
			return scheprodList;
		}
		
		
		//now
		@Override
		public List<ProDetailVO> getNowList() {
			List<ProDetailVO> nowList = sqlSession.selectList(NAMESPACE + ".getNowList");
			return nowList;
		}


		@Override
		public List<ProDetailVO> getNowclassList() {
			List<ProDetailVO> nowclassList = sqlSession.selectList(NAMESPACE + ".getNowclassList");
			return nowclassList;
		}

		@Override
		public List<ProDetailVO> getNowprodList() {
			List<ProDetailVO> nowprodList = sqlSession.selectList(NAMESPACE + ".getNowprodList");
			return nowprodList;
		}
		
		
		//end
		@Override
		public List<ProDetailVO> getEndList() {
			List<ProDetailVO> endList = sqlSession.selectList(NAMESPACE + ".getEndList");
			return endList;
		}

		@Override
		public List<ProDetailVO> getEndclassList() {
			List<ProDetailVO> endclassList = sqlSession.selectList(NAMESPACE + ".getEndclassList");
			return endclassList;
		}

		@Override
		public List<ProDetailVO> getEndprodList() {
			List<ProDetailVO> endprodList = sqlSession.selectList(NAMESPACE + ".getEndprodList");
			return endprodList;
		}

}
