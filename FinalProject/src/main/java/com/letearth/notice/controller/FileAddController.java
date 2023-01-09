package com.letearth.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileAddController {

	private static final String FILE_PATH = "e:\\FileAdd";
	private static final Logger mylog = LoggerFactory.getLogger(FileAddController.class);
	
	
	// 파일업로드 뷰
	// http://localhost:8080/upload
	@RequestMapping(value = "/upload",method = RequestMethod.GET)
	public void uploadForm() {
		mylog.debug(" /notice/regist.jsp 페이지로 이동 ");
	}
	
	
	// 파일업로드 처리
	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	public ModelAndView uploadPro(MultipartHttpServletRequest multi) throws Exception {
		
		// 한글처리
		multi.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장
		Map map = new HashMap();
		
		// 전달된 파라미터의 이름들을 모두 저장
		Enumeration enu = multi.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			//mylog.debug(name);
			String value = multi.getParameter(name);
			map.put(name, value);
		}
		mylog.debug(map+"");
		// 파일정보 제외한 파라미터 정보 모두 저장
		///////////////////////////////////////////////////////
		// 파일정보 처리 
		List<String> fileList = fileProcess(multi);
		map.put("fileList", fileList);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("result");
		mav.addObject("map"	,map);
		
		return mav;
	} //uploadPro

	// 업로드시 전달되는 파일정보 처리 메서드
	private List<String> fileProcess(MultipartHttpServletRequest multi) throws Exception{
		mylog.debug(" 업로드 파일 처리 시작 ");
		
		// 업로드 파일명을 저장하는 리스트
		List<String> fileList = new ArrayList<String>();
		
		// 전달받은 파라미터(파일) 정보 저장
		Iterator<String> fileNames 
		             = multi.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			//mylog.debug(fileName);
			// 전달받은 파일의 정보를 저장(데이터)
			MultipartFile mFile = multi.getFile(fileName);
			// 전달받은 파일의 이름정보를 저장
			String oFileName = mFile.getOriginalFilename();
			
			fileList.add(oFileName);
			
			// 업로드 처리
			File file = new File(FILE_PATH+"\\"+fileName);
			
			if(mFile.getSize() != 0) { //업로드된 파일정보가 있으면
				if(!file.exists()) { // 기존에 업로드 폴더가 존재여부
					if(file.getParentFile().mkdirs()) {
						// 부모역활을 하는 폴더 생성
						file.createNewFile();
						// 임시파일을 생성
					}
				}
			}
//				file.createNewFile();
			mFile.transferTo(new File(FILE_PATH+"\\"+oFileName));
			// -> 임시저장파일의 정보를 업로드된 실제파일로 변경
		}
		
		mylog.debug(" 업로드 파일 처리 끝 ");
		return fileList;
	}
	
}
