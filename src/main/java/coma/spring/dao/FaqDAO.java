package coma.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.FaqDTO;
import coma.spring.statics.Configuration;

@Repository
public class FaqDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<FaqDTO> selectByPage(int cpage) throws Exception{
		int start = cpage*Configuration.recordCountPerPage - (Configuration.recordCountPerPage - 1);
		int end = start + (Configuration.recordCountPerPage - 1);
		
		Map<String,Integer> param = new HashMap<>();
		param.put("start",start);
		param.put("end",end);

		return mybatis.selectList("Faq.selectByPage",param);
	}
	
	public int getArticleCount() throws Exception{
		return mybatis.selectOne("Faq.getArticleCount");

	}

	public int insert(FaqDTO dto) {
		return mybatis.insert("Faq.insert",dto);
	}

}
