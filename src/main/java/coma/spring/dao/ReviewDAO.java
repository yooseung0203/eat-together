package coma.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.ReviewDTO;
import coma.spring.statics.Configuration;
import coma.spring.statics.PartyConfiguration;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(ReviewDTO rdto) throws Exception{
		return mybatis.insert("Review.insert",rdto);
	}
	public List<ReviewDTO> selectByPseq(int parent_seq) throws Exception{
		return mybatis.selectList("Review.selectByPseq",parent_seq);
	}
	
	//by지은, 마이페이지 내리뷰리스트 출력을 위한 select문 수정_20200709
	public List<ReviewDTO> selectById(String id)throws Exception{
		return mybatis.selectList("Review.selectById", id);
	}
	
	public int report(int seq) throws Exception{
		return mybatis.update("Review.updateReport", seq);
	}
	// 예지 리뷰 리스트
	public List<ReviewDTO> selectByPageNo(int cpage) throws Exception{
		int start = cpage * Configuration.navCountPerPage - (Configuration.navCountPerPage-1);
		int end = start + (Configuration.navCountPerPage-1);
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Review.selectByPageNo",param);
	}
	// 예지 리뷰 총 갯수
	public int getArticleCount() throws Exception{
		return mybatis.selectOne("Review.getArticleCount");
	}
	// 예지 리뷰 리스트 : 정렬 검색
	public List<ReviewDTO> selectByPageAndOption(int cpage, Object option) {
		int start = cpage * Configuration.navCountPerPage - (Configuration.navCountPerPage-1);
		int end = start + (Configuration.navCountPerPage-1);
		Map<String, Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("targetColumn", option);
		return mybatis.selectList("Review.selectByPageAndOption",param);
	}
	public ReviewDTO selectBySeq(int seq) {
		return mybatis.selectOne("Review.selectBySeq",seq);
	}
}
