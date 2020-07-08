package coma.spring.service;

import java.io.File;
import java.util.List;
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

	//프로필 이미지 업로드하기
	public int uploadProc(MemberFileDTO mfdto)throws Exception {
		int result = mfdao.uploadProc(mfdto);
		return result;
	}

}
