package coma.spring.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import coma.spring.dto.MemberDTO;
import coma.spring.dto.MemberFileDTO;
import coma.spring.service.MemberFileService;

@Controller
@RequestMapping("/memberfile/")
public class MemberFileController {
	
	@Autowired
	private MemberFileService mfservice;

	@Autowired
	private HttpSession session;


	//프로필 사진 변경하는 팝업창 열기
	@RequestMapping("editProfileImage")
	public String getEditProfileImageView() {
		return "member/editprofileimage";
	}

	//프로필 사진 변경하기
	@RequestMapping("editProfileImageProc")
	public String editProfileImageProc(MemberFileDTO mfdto, MultipartFile file, HttpServletRequest request)throws Exception {
		System.out.println("파일업로드 Proc 접속하기");
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String id = mdto.getId();

		System.out.println("프로필 이미지 변경하는 아이디 : "+ id);
		String filePath = session.getServletContext().getRealPath("upload/" +id+"/" );

		File tempFilePath = new File(filePath);
		if(!tempFilePath.exists()) {
			tempFilePath.mkdirs();
		}
		System.out.println(mfdto.getOriname());

		UUID uuid = UUID.randomUUID();
		String sysname = uuid.toString()+"_"+ file.getOriginalFilename();
		String oriname = file.getOriginalFilename();
		System.out.println(sysname);

		File targetLoc = new File(filePath + "/" + sysname);
		file.transferTo(targetLoc);

		mfdto.setOriname(oriname);
		mfdto.setSysname(sysname);
		mfdto.setParent_id(id);

		System.out.println("oriName : " + oriname);
		System.out.println("sysName : " + sysname);

		return "/member/editMyInfo";
	}

}
