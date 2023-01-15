package com.letearth.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.letearth.admin.domain.AdminVO;
import com.letearth.prodetail.domain.Criteria;
import com.letearth.project.domain.ProjectVO;
import com.letearth.admin.persistence.AdBoardDAO;
import com.letearth.member.domain.MemberVO;

@Service
public class AdBoardServiceImpl implements AdBoardService {

	private static final Logger mylog = LoggerFactory.getLogger(AdBoardServiceImpl.class);
	
	@Inject
	private AdBoardDAO adBoardDAO;
	
	
	/**
	 * FAQ 관련 오버라이딩
	 */
	
	// FAQ 등록
	@Override
	public void insertFaq(AdminVO vo) throws Exception {		
		adBoardDAO.insertFaq(vo);
		
		mylog.debug("FAQ 완료 -> 컨트롤러 이동");		
	}
	
	
	// FAQ 목록 조회(페이징처리-cri)
	@Override
	public List<AdminVO> getListFaq(Criteria cri) throws Exception {
		
		return adBoardDAO.getListFaq(cri);
	}
	
	
	// 글전체개수
	@Override
	public int totalFaqCnt() throws Exception {
		return adBoardDAO.totalFaqCnt();
	}
		
	
	// FAQ 조회수
	@Override
	public void updateViewcnt(Integer not_no) throws Exception {
		adBoardDAO.updateViewcnt(not_no);
	}
	
	
	// FAQ 본문보기(notice_no)
	@Override
	public AdminVO getFaq(Integer not_no) throws Exception {
		
		return adBoardDAO.getFaq(not_no);
	}
	
	
	// FAQ 수정
	@Override
	public Integer updateFaq(AdminVO vo) throws Exception {
		
		return adBoardDAO.updateFaq(vo);
	}
	
	
	// FAQ 삭제
	@Override
	public void deleteFaq(Integer not_no) throws Exception {
		 adBoardDAO.deleteFaq(not_no);		
	}
	
	
	
	/**
	 * 1:1문의 오버라이딩
	 */
	// 1:1문의 리스트
	@Override
	public List<AdminVO> adRewriteList(Criteria cri) throws Exception {
		return adBoardDAO.adRewriteList(cri);
	}
	
	// 1:1문의 전체 글개수
	@Override
	public int totalRewriteCnt() throws Exception {
		return adBoardDAO.totalRewriteCnt();
	}
	
	// 1:1문의 본문보기(not_no)
	@Override
	public AdminVO getRewrite(Integer not_no) throws Exception {
		return adBoardDAO.getRewrite(not_no);
	}
	
	// 1:1 문의 원글 Y 추가
	@Override
	public void updateY(AdminVO vo) throws Exception {
		adBoardDAO.updateY(vo);
	}

	// 1:1문의 작성 
	@Override
	public Integer insertRewrite(AdminVO vo) throws Exception {
		return adBoardDAO.insertRewrite(vo);
	}
	
	// 1:1 문의 삭제
	@Override
	public void deleteRewrite(Integer not_no) throws Exception {
		adBoardDAO.deleteRewrite(not_no);		
	}
	
	
	
	
	
	/**
	 * 메인
	 */
	// 신고 최근 4개 들고오기
	@Override
	public List<AdminVO> adMainRepList() throws Exception {
		return adBoardDAO.adMainRepList();
	}
	
	// 승인요청 최근 4개 들고오기
	@Override
	public List<ProjectVO> adMainPro2() throws Exception {
		return adBoardDAO.adMainPro2();
	}
	
	
	/**
	 * 사용자용 faq 최신리스트4개
	 * 구매자1번 / 후원자2번 / 판매자3번
	 */
	@Override
	public List<AdminVO> faqMainList1() throws Exception {
		return adBoardDAO.faqMainList1();
	}
	@Override
	public List<AdminVO> faqMainList2() throws Exception {
		return adBoardDAO.faqMainList2();
	}
	@Override
	public List<AdminVO> faqMainList3() throws Exception {
		return adBoardDAO.faqMainList3();
	}
	
	
	
	/**
	 * 구글차트1 : 진행중인 프로젝트 목표금액과 달성금액 현황(최근5개)
	 */
	//{"변수명" : [{},{},{}], "변수명" : "값"}
	@Override
	public JSONObject getChartData() throws Exception{ // json 오브젝트를 리턴
		// getChartData 메소드를 호출하면
        // db에서 리스트 받아오고, 받아온 걸로 json형식으로 만들어서 리턴을 해주게 된다.
		
		List<ProjectVO> pjChart = adBoardDAO.pjChart();
		
		// 리턴할 json 객체
		JSONObject data = new JSONObject(); // {}
		
		// json의 칼럼 객체
		// cols 배열에 넣기
		JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        JSONObject col3 = new JSONObject();
		
        col1.put("label","프로젝트이름"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "목표금액");
        col2.put("type", "number");
        col3.put("label", "달성금액");
        col3.put("type", "number");
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        
      //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        title.add(col3);
        
      //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : "상품명","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (ProjectVO pvo : pjChart) { //items에 저장된 값을 pvo로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject proName = new JSONObject(); //json오브젝트 객체를 생성
            proName.put("v", pvo.getPro_title()); //name변수에 pvo에 저장된 상품의 이름을 v라고 저장한다.
            
            JSONObject goalp = new JSONObject(); //json오브젝트 객체를 생성
            goalp.put("v", pvo.getPro_gp()); //name변수에 pvo에 저장된 금액을 v라고 저장한다.
            
            JSONObject totalp = new JSONObject(); //json오브젝트 객체를 생성
            totalp.put("v", pvo.getPro_tp()); //name변수에 pvo에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(proName); //name을 row에 저장 (테이블의 행)
            row.add(goalp); //name을 row에 저장 (테이블의 행)
            row.add(totalp); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 3개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
	}
	
	
	
	/**
	 * 구글차트2 : 회원 비율 => 구매(0), 판매(1), 블랙(3)
	 */
	//{"변수명" : [{},{},{}], "변수명" : "값"}
	@Override
	public JSONObject getChartData2() throws Exception{ // json 오브젝트를 리턴
		// getChartData 메소드를 호출하면
        // db에서 리스트 받아오고, 받아온 걸로 json형식으로 만들어서 리턴을 해주게 된다.
		
		List<MemberVO> memRatio = adBoardDAO.memRatio();
		
		// 리턴할 json 객체
		JSONObject data = new JSONObject(); // {}
		
		// json의 칼럼 객체
		// cols 배열에 넣기
		JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
		
        col1.put("label","회원유형"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "인원수");
        col2.put("type", "number");
        
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        
      //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
      //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : "상품명","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (MemberVO mvo : memRatio) { //items에 저장된 값을 pvo로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject memStatus = new JSONObject(); //json오브젝트 객체를 생성
            
            if(mvo.getMem_status() == 0) { mvo.setMem_ratio("구매자");}
            else if (mvo.getMem_status() == 1) { mvo.setMem_ratio("판매자");}
            else if (mvo.getMem_status() == 3) { mvo.setMem_ratio("블랙리스트");}
            
            memStatus.put("v", mvo.getMem_ratio()); //name변수에 pvo에 저장된 상태를 v라고 저장한다.
            
            JSONObject memCnt = new JSONObject(); //json오브젝트 객체를 생성
            memCnt.put("v", mvo.getCnt()); //name변수에 pvo에 카운트멤버 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(memStatus); //name을 row에 저장 (테이블의 행)
            row.add(memCnt); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 3개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
	}
	
	
	
}
