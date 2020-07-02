package coma.spring.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import coma.spring.dao.MemberFileDAO;
import coma.spring.dto.MemberFileDTO;

@Service
public class MemberFileService {

	@Autowired
	private MemberFileDAO mfdao;

	//프로필 이미지 변경하기
	public int editProfileImageProc(MemberFileDTO mfdto, String filePath)throws Exception {
		MultipartFile file = mfdto.getFile();

		UUID uuid = UUID.randomUUID();
		String sysname = uuid.toString()+"_"+ file.getOriginalFilename();
		String oriname = file.getOriginalFilename();
		String parent_id = mfdto.getParent_id();

		System.out.println("parent_id : " + parent_id);
		System.out.println("sysName : " + sysname);
		System.out.println("oriName : " + oriname);

		mfdto.setSysname(sysname);
		mfdto.setOriname(oriname);

		File targetLoc = new File(filePath + "/" + sysname);
		file.transferTo(targetLoc);

		int result = mfdao.editProfileImageProc(mfdto);
		return result;
	}

}
