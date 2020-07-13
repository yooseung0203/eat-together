package coma.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	// 예지 : 신고 기능
//	@Transactional("txManager")
//	public int report(ReportDTO rdto) throws Exception{
//		rdao.newReport(rdto); // 신고 테이블 insert 문 
//		return rvdao.report(rdto.getParent_seq()); // 리뷰 테이블 신고 컬럼 update 문
//	}

}
