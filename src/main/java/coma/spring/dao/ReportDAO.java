package coma.spring.dao;

import java.util.HashMap;
import java.util.Map;

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

	
	public int getListCount() {
		return mybatis.selectOne("Report.getListCount");
	}
	
	public int refuseReport(int seq) {
		return mybatis.update("Report.refuseReport");
	}
	
	public int repoCountDown(int category , int parent_seq) {
		Map<String , Object> param = new HashMap<>();
		String table =null;
		if(category == 0) {
			table = "review";
		}
		else {
			table = "party";
		}
		param.put("table" , table);
		param.put("seq", parent_seq);
		return mybatis.update("Report.repoCountDown",param);
	}
	

}
