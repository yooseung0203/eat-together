package coma.spring.controller;

import java.awt.List;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.UUID;

import javax.annotation.Resource;
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

	@Resource(name="uploadPath")
	String uploadPath;

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
	public ModelAndView uploadProc(MemberFileDTO mfdto, MultipartFile file, ModelAndView mav)throws Exception {
		System.out.println("파일업로드 Proc 접속하기");

		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String parent_id = mdto.getId();
		int deleteResult = mfservice.deleteFilebyId(parent_id);
		this.deleteFileById();
		System.out.println("db상 기존 사진 삭제 성공1 실패0 : " + deleteResult);
		
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

		mav.setViewName("member/editmyinfo");
		mfdto = mfservice.getFilebyId(parent_id);
		
		sysname = mfdto.getSysname();

		mav.addObject("sysname", sysname);

		return mav;
	}

	//파일 삭제하기
	public void deleteFileById()throws Exception {
		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String parent_id = mdto.getId();
		MemberFileDTO mfdto = new MemberFileDTO();
		int deleteResult = 1;
		
		String filePath = session.getServletContext().getRealPath("upload/" +parent_id+"/");
		File target = new File(filePath + "/" + mfdto.getSysname());
		boolean result = target.delete();
		
		if(result) {
			deleteResult = 1;
		}else {
			deleteResult = 0;
		}
		System.out.println("파일 삭제 성공1 실패0 : " + deleteResult);
	}

	//파일다운로드
	@RequestMapping("downloadFile")
	public String download(HttpServletResponse resp)throws Exception {
		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String parent_id = mdto.getId();
		MemberFileDTO mfdto = new MemberFileDTO();

		mfdto = mfservice.getFilebyId(parent_id);

		String filePath = session.getServletContext().getRealPath("upload/" +parent_id+"/" );

		File target = new File(filePath + "/" + mfdto.getSysname());

		try(DataInputStream dis = new DataInputStream(new FileInputStream(target));
				ServletOutputStream sos= resp.getOutputStream();){

			String fileName= new String(mfdto.getOriname().getBytes("utf8"), "iso-8859-1");

			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-disposition", "attachment;filename="+mfdto.getOriname()+";");

			byte[] fileContents = new byte[(int)target.length()];
			dis.readFully(fileContents);

			sos.write(fileContents);
			sos.flush();

			return "/memberfile/editProfileImage";
		}

	}
	
}
