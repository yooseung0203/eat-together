package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.ReportDAO;
import coma.spring.dto.ReportDTO;

@Service
public class ReportService {
	
	@Autowired
	private ReportDAO repodao;
	
	// 태훈 신고 테이블 추가
	public int newReport(ReportDTO rdto) throws Exception {
		return repodao.newReport(rdto);
	}
	// 태훈 신고 중복 검사
	public int checkDupl(ReportDTO rdto) throws Exception {
		return repodao.checkDupl(rdto);
	}
	
	public int refuseReport(int seq) throws Exception {
		return repodao.refuseReport(seq);
	}
	
	public int repoCountDown(int category , int parent_seq) throws Exception {
		return repodao.repoCountDown(category , parent_seq);
	}
	
	//신고 리스트
	public List<ReportDTO> selectByCategory(int cpage,int category)throws Exception{
		List<ReportDTO> rdto = repodao.selectByCategory(cpage,category);
		return rdto;
	}
	//리스트 네비
	public String CategoryNavi(int cpage,int category)throws Exception{
		String navi = repodao.getSelectCategoryPageNav(cpage, category);
		return navi;
	}
}
