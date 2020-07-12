package coma.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.ReportDAO;
import coma.spring.dto.ReportDTO;

@Service
public class ReportService {
	
	@Autowired
	private ReportDAO rdao;
	
	// 태훈 신고 테이블 추가
	public int newReport(ReportDTO rdto) {
		return rdao.newReport(rdto);
	}
	// 태훈 신고 중복 검사
	public int checkDupl(ReportDTO rdto) {
		return rdao.checkDupl(rdto);
	}

}
