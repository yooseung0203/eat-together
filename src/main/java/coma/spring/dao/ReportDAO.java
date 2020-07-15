package coma.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.ReportDTO;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int newReport(ReportDTO rdto) {
		return mybatis.insert("Report.newReport", rdto);
	}
	
	public int checkDupl(ReportDTO rdto) {
		return mybatis.selectOne("Report.checkDupl", rdto);
	}

}
