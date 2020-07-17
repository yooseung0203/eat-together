package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.ReportDAO;
import coma.spring.dto.MemberReportDTO;
import coma.spring.dto.QuestionDTO;
import coma.spring.dto.ReportDTO;

@Service
public class ReportService {
	
	@Autowired
	private ReportDAO rdao;
	
	// 태훈 신고 테이블 추가
	public int newReport(ReportDTO rdto) throws Exception {
		return rdao.newReport(rdto);
	}
	// 태훈 신고 중복 검사
	public int checkDupl(ReportDTO rdto) throws Exception {
		return rdao.checkDupl(rdto);
	}
	
	//신고 리스트
	public List<ReportDTO> selectByCategory(int cpage,int category)throws Exception{
		List<ReportDTO> rdto = rdao.selectByCategory(cpage,category);
		return rdto;
	}
	//리스트 네비
	public String CategoryNavi(int cpage,int category)throws Exception{
		String navi = rdao.getSelectCategoryPageNav(cpage, category);
		return navi;
	}
}
