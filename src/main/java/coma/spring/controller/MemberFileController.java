package coma.spring.controller;

import java.awt.List;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
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

	//프로필사진 업로드
	@RequestMapping(value="uploadProc",  method=RequestMethod.POST, headers = ("content-type=multipart/*"))
	public String uploadProc(MemberFileDTO mfdto, MultipartFile file)throws Exception {
		System.out.println("파일업로드 Proc 접속하기");

		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String parent_id = mdto.getId();
		int deleteResult = mfservice.deleteFilebyId(parent_id); //DB상에서 파일 삭제하는 코드
		System.out.println("db상 삭제된 파일 개수 : " + deleteResult);

		String filepath = session.getServletContext().getRealPath("upload/" +parent_id+"/" );
		File deleteFile = new File(filepath);
		
		if(deleteFile.exists() == true){
			deleteFile.delete();
			System.out.println("파일 삭제 완료");
			//서버 상에서 파일 삭제하는 코드
		}

		System.out.println("프로필 이미지 변경하는 아이디 : "+ parent_id);
		String filePath = session.getServletContext().getRealPath("upload/" +parent_id+"/" );

		File tempFilePath = new File(filePath);
		if(!tempFilePath.exists()) {
			tempFilePath.mkdirs();
		}

		UUID uuid = UUID.randomUUID();
		String sysname = uuid.toString()+"_"+ file.getOriginalFilename();
		String oriname = file.getOriginalFilename();
		System.out.println(sysname);

		File targetLoc = new File(filePath + "/" + sysname);
		file.transferTo(targetLoc);
		System.out.println(filePath);

		mfdto.setOriname(oriname);
		mfdto.setSysname(sysname);
		mfdto.setParent_id(parent_id);

		int uploadResult = mfservice.uploadProfile(mfdto);
		System.out.println("파일업로드 성공1 실패0 :" + uploadResult);

		System.out.println("oriName : " + oriname);
		System.out.println("sysName : " + sysname);

		return "/memberfile/editProfileImage";
	}
}
