package coma.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.MapDTO;
import coma.spring.dto.ReviewDTO;
import coma.spring.dto.TopFiveStoreDTO;

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
	//by지은, 마이페이지 내리뷰리스트 출력을 위한 네비바_20200707
	public int getMyPageArticleCount(String id)throws Exception{
		return mybatis.selectOne("Review.getMyPageArticleCount", id);
	}
	// 태훈 top5 소개 리뷰 뽑기
	public List<TopFiveStoreDTO> getReview(List<MapDTO> top){
		Map<String, Integer> param = new HashMap<>();
		for (int i=0; i<top.size(); i++) {
			param.put("top"+(i+1), top.get(i).getSeq());	
		}
		System.out.println(param);
		return mybatis.selectList("Review.top5review", param);
	}
}
