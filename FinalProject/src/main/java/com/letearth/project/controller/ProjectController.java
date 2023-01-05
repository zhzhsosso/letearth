package com.letearth.project.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.letearth.project.domain.ProjectVO;
import com.letearth.project.domain.RewardVO;
import com.letearth.project.service.ProjectService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	@Inject
	private ProjectService proService;
	
	private static final Logger mylog = LoggerFactory.getLogger(ProjectController.class);
	
	// http://localhost:8080/project/createFirst
	/**
	 * 프로젝트 작성 메인 GET
	 */
	@RequestMapping(value="/createFirst",method=RequestMethod.GET)
	public String createFirstGET(HttpSession session) throws Exception {
		mylog.debug("/project/createFirst(GET) 호출 -> 페이지 이동");
		
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "/project/createFirst";
	}
	
	// http://localhost:8080/project/createSecond
	/**
	 * 프로젝트 작성 유의사항 체크 GET
	 */
	@RequestMapping(value="/createSecond",method=RequestMethod.GET)
	public String createSecondGET(HttpSession session) throws Exception {
		mylog.debug("/project/createSecond(GET) 호출 -> 페이지 이동");
		
		// 로그인 제어		
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "/project/createSecond";
	}
	
	// http://localhost:8080/project/createThird
	/**
	 * 프로젝트 심사기준 확인 GET
	 */
	@RequestMapping(value="/createThird",method=RequestMethod.GET)
	public String createThirdGET(HttpSession session) throws Exception {
		mylog.debug("/project/createThird(GET) 호출 -> 페이지 이동");
		
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "project/createThird";
	}
	
	// http://localhost:8080/project/verification
	/**
	 * 간편인증 페이지 GET
	 */
	@RequestMapping(value="/verification",method=RequestMethod.GET)
	public String verificationGET(HttpSession session) throws Exception {
		mylog.debug("/project/verification(GET) 호출 -> 페이지 이동");
		
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "/project/verification";
	}
	
	// http://localhost:8080/project/confirm
	// http://localhost:8080/project/confirm?result=success
	/**
	 * 간편인증 성공 GET - 오븐에는 없는 페이지예요!! 간편인증 성공시 넘어가는 페이지!!
	 */
	@RequestMapping(value="/confirm",method=RequestMethod.GET)
	public String confirmGET(HttpSession session, @RequestParam(value="result") String result, Model model) throws Exception {
		mylog.debug("/project/confirm(GET) 호출 -> 페이지 이동");
		
		mylog.debug("result: " + result);
		model.addAttribute("result", result);
		
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		// 아이디 제어		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "/project/confirm";
		
		
	}
	
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public String confirmPost(HttpSession session, ProjectVO proVO, Model model) throws Exception {
		mylog.debug("/project/confirm(POST) 호출 -> 프로젝트 번호 생성");
		
		// 로그인 제어
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "redirect:/project/create";
		
	}

	// http://localhost:8080/project/create
	/**
	 * 프로젝트 작성
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createGET(HttpSession session) throws Exception {
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "project/create";
	}
	
	// http://localhost:8080/project/basicInfo
	/**
	 * 프로젝트 기본정보(GET)
	 */
	@RequestMapping(value="/basicInfo", method = RequestMethod.GET)
	public String basicInfoGET(HttpSession session, ProjectVO proVO) throws Exception{
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		return "project/basicInfo";
	}
	
	/**
	 * 프로젝트 기본정보(POST)
	 */
	// @ResponseBody : 태그할 때 사용
	@RequestMapping(value="/basicInfo", method = RequestMethod.POST)
	public String basicInfoPOST(HttpSession session, ProjectVO proVO) throws Exception{
		// 로그인 제어
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 전달된 정보저장(카테고리,제목,내용,이미지)
		mylog.debug(proVO.toString());
		
		// 첨부파일
		
		// 서비스			
		proVO.setMem_id(mem_id);
		proService.updatePro_basicInfo(proVO);
		session.setAttribute("pro_no", proVO.getPro_no());
		// 이동
		return "redirect:/project/plan"; //주소 다음 파트원꺼보고 변경
	}
	
	// http://localhost:8080/project/plan
	/**
	 * 프로젝트계획(GET)
	 */
	@GetMapping(value="/plan")
	public String planGET(HttpSession session, ProjectVO proVO) throws Exception {
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		return "/project/plan";
	}
	
	/**
	 * 프로젝트계획(POST)
	 */
	@RequestMapping(value="/plan", method = RequestMethod.POST)
	public String planPOST(HttpSession session, ProjectVO proVO, Model model) throws Exception {
		// 로그인 제어		
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		mylog.debug("프로젝트 계획 전달 정보: " + proVO.toString());
		
		proService.updatePlan(proVO);
		
		return "/project/reward";
	}
	
	
	// http://localhost:8080/project/reward
	/**
	 * 리워드 (GET)
	 */
	@RequestMapping(value="/reward", method=RequestMethod.GET)
	public String rewardGET(HttpSession session, RewardVO rewVO) throws Exception {
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		rewVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		return "project/reward";
		
	}
	
	/**
	 * 리워드 (POST)
	 */
	@RequestMapping(value="/reward", method =RequestMethod.POST)
	public String rewardPOST(HttpSession session, RewardVO rewVO) throws Exception {
		// 로그인 제어
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		rewVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		// 1. 전달된 정보저장
		// 객체 만들기
		mylog.debug(rewVO+"");
		
		proService.createReward(rewVO);
		
		mylog.debug(" 컨트롤러 : 리워드 생성완료 ");
		
		return "redirect:/project/rewardView";
	}
	
	// http://localhost:8080/project/rewardView
	/**
	 * 리워드 보여주기 (GET)
	 */
	@RequestMapping(value="/rewardView", method = RequestMethod.GET)
	public String rewardViewGET(HttpSession session, RewardVO rewVO, Model model) throws Exception {
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		rewVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		mylog.debug("프로젝트 번호: ");
		
		List<RewardVO> rewList = proService.getReward(rewVO);
		mylog.debug(rewList + "");
		model.addAttribute("rewList", rewList);
		
		
		return "project/reward";
	}
	
	/**
	 * 리워드 삭제 (GET)
	 */
	@RequestMapping(value = "/rewardDelete", method = RequestMethod.GET)
	public String rewardDelete(HttpSession session, RewardVO rewVO) throws Exception {
		// 로그인 제어
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		rewVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		mylog.debug("리워드 번호: " + rewVO.getReward_no());
		
		proService.deleteReward(rewVO);
		
		mylog.debug("리워드 삭제 완료!");
		
		return "redirect:/project/rewardView";
	}
	
	// http://localhost:8080/project/story
	/**
	 * 스토리 작성 (GET)
	 */
	@RequestMapping(value="/story", method=RequestMethod.GET)
	public String storyWriteGET(HttpSession session, ProjectVO proVO) throws Exception{
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		return "project/story";
	}
	
	/**
	 * 스토리 작성 (POST)
	 */
	@RequestMapping(value="/story", method=RequestMethod.POST)
	public String storyWritePOST(HttpSession session, ProjectVO proVO) throws Exception {
		// 로그인 제어		
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		// 서비스객체 -> DAO -> mapper(insert)

		/*
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "C:\\test\\upload";
*/
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		/*
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);
		mylog.debug("파일 이름: " +uniqueName+fileExtension);
		
		proVO.setPro_file(uniqueName+fileExtension);
		
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		proService.updateStory(proVO);
		
		// 3. 페이지 이동
		return "/project/policy";
	}
	
	
	// http://localhost:8080/project/policy
	/**
	 * 프로젝트 정책 (GET)
	 */
	@RequestMapping(value = "/policy", method = RequestMethod.GET)
	public String policyGET(HttpSession session, ProjectVO proVO) throws Exception {
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		return "project/policy";
		
	}
	
	/**
	 * 프로젝트 정책 (POST)
	 */
	@RequestMapping(value = "/policy", method = RequestMethod.POST)
	public String policyPOST(HttpSession session, ProjectVO proVO) throws Exception {
		// 로그인 제어		
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));
		
		
		proService.updatePolicy(proVO);
		
		mylog.debug("프로젝트 정책 업데이트 완료!");
		
		return "/project/regist";
	}

	// http://localhost:8080/project/regist
	/**
	 * 대표자 및 정산 정보 등록 (GET)
	 */
	@RequestMapping(value="/regist",method=RequestMethod.GET)
	public String registGET(HttpSession session, ProjectVO proVO) throws Exception{
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug(mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));

		
		mylog.debug("대표자 등록 페이지 이동" + (int) session.getAttribute("pro_no"));
		
		return "/project/regist";
	}

	/**
	 * 대표자 및 정산 정보 등록 (POST)
	 */
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String registPOST(HttpSession session, ProjectVO proVO) throws Exception{
		// 로그인 제어	
		String mem_id = (String) session.getAttribute("mem_id");
		mylog.debug("대표자 등록: " + mem_id);
		
		if(mem_id == null) {
			return "redirect:/member/login";
		}
		
		// 전달 값 확인
		mylog.debug(proVO + "");
		
		// 프로젝트 번호
		proVO.setPro_no((int) session.getAttribute("pro_no"));
		
		proService.updatePartner(proVO);
		
		return "redirect:/project/createFirst";
	}
	
	/**
	 * 이미지 파일명 수정 컨트롤러
	 */
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public ModelAndView writeTestPost(@RequestParam("image") MultipartFile multi, HttpServletRequest request, HttpServletResponse response) {
		String url = null;
		ModelAndView mv = new ModelAndView();

		String path = "C:/imageStorage/";
		try {
			String uploadPath = path;
			String originFilename = multi.getOriginalFilename();
			
			System.out.println(multi.getOriginalFilename());
			System.out.println(multi);
			
			
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();

			// 파일명 생성
			String saveFileName = "";
			Calendar calendar = Calendar.getInstance();
			saveFileName += calendar.get(Calendar.YEAR);
			saveFileName += calendar.get(Calendar.MONTH);
			saveFileName += calendar.get(Calendar.DATE);
			saveFileName += calendar.get(Calendar.HOUR);
			saveFileName += calendar.get(Calendar.MINUTE);
			saveFileName += calendar.get(Calendar.SECOND);
			saveFileName += calendar.get(Calendar.MILLISECOND);
			saveFileName += extName;

			if (!multi.isEmpty()) {
				File file = new File(uploadPath, saveFileName);
				multi.transferTo(file);

				mv.addObject("filename", saveFileName);
				mv.addObject("uploadPath", file.getAbsolutePath());
				mv.addObject("url", uploadPath + saveFileName);

				// 저장경로
				System.out.println("url : " + uploadPath+saveFileName);
				// url : C:\imageStorage\202302114148950.JPG

				mv.setViewName("/project/image_Url_Json"); // return "/project/info" view->jsp  image_Url_Json.jsp

			} else {
				mv.setViewName("toast_UI_writer3");
			}
		} catch (Exception e) {
			System.out.println("[Error] " + e.getMessage());
		}
		return mv;
	}

}
