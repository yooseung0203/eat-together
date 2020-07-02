package coma.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.NoticeDTO;
import coma.spring.statics.Configuration;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int getNextVal() {
		return mybatis.selectOne("Notice.getNextval");
	}
	
	public int insert(NoticeDTO dto) throws Exception {
		return mybatis.insert("Notice.insert",dto);
	}
	

	public List<NoticeDTO> selectByPage(int cpage) throws Exception{
		int start = cpage*Configuration.recordCountPerPage - (Configuration.recordCountPerPage - 1);
		int end = start + (Configuration.recordCountPerPage - 1);
		
		Map<String,Integer> param = new HashMap<>();
		param.put("start",start);
		param.put("end",end);

		return mybatis.selectList("Notice.selectByPage",param);
	}
	
	public int getArticleCount() throws Exception{
		return mybatis.selectOne("Notice.getArticleCount");

	}
	
	public int view_count(int seq) throws Exception{
		return mybatis.update("Notice.view_count",seq);
	}

	public NoticeDTO selectBySeq(int seq) throws Exception{
		return mybatis.selectOne("Notice.selectBySeq",seq);
	}

}
