package coma.spring.controller;

import java.awt.List;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

//import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import coma.spring.dto.MemberDTO;
import coma.spring.dto.MemberFileDTO;
import coma.spring.service.MemberFileService;

@Controller
@RequestMapping("/memberfile/")
public class MemberFileController {
	private static final Logger logger = LoggerFactory.getLogger(MemberFileController.class);

	//@Resource(name="uploadPath")
	//String uploadPath;

	@Autowired
	private MemberFileService mfservice;

	@Autowired
	private HttpSession session;

	//프로필 사진 변경하는 팝업창 열기
	@RequestMapping("editProfileImage")
	public String getEditProfileImageView() {
		return "member/editprofileimage";
	}
	
	//프로필사진 업로드_20200708 수정
	public MemberFileDTO uploadProc(MemberDTO mdto, MemberFileDTO mfdto, String realPath)throws Exception {
		System.out.println("파일업로드 Proc 접속하기");
		
		MultipartFile profile = mdto.getProfile();
		String parent_id = mdto.getId();
		
		System.out.println("realPath 전달받았는지 : " + realPath);
		
		File filePath = new File(realPath);

		if(!filePath.exists()) {
			filePath.mkdirs();
		}

		//by지은 현재시각으로 sysname 조립하는 과정_20200708
		String join_date = new SimpleDateFormat("YYYY-MM-dd-ss").format(System.currentTimeMillis());
		String sysname = join_date + "_" + profile.getOriginalFilename();
		
		// 하드디스크에 파일 업로드
		mfdto.setOriname(profile.getOriginalFilename());
		mfdto.setSysname(sysname);
		mfdto.setRealpath(realPath + mfdto.getSysname());
		mfdto.setParent_id(parent_id);
		
		//파일을 저장하기 위한 파일 객체 생성
		File fileDownload = new File(realPath + sysname);
		profile.transferTo(fileDownload);
	
		//파일저장
		mdto.setProfile(profile);
		
		return mfdto;
	}
	
}
