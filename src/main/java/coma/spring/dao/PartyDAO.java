package coma.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.PartyDTO;
import coma.spring.statics.PartyConfiguration;


@Repository
public class PartyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int getNextVal() {
		return mybatis.selectOne("Party.getNextval");
	}

	public int insert(PartyDTO dto) {
		return mybatis.insert("Party.insert",dto);
	}

	public int delete(String seq) throws Exception{
		return mybatis.delete("Party.delete",seq);
	}

	public PartyDTO selectBySeq(int seq) throws Exception{
		return mybatis.selectOne("Party.selectBySeq",seq);
	} 

	public int update(PartyDTO dto) throws Exception{
//		 Map<String, String> param = new HashMap<>();
//	      param.put("columnName1", "title");
//	      param.put("changeValue1", dto.getTitle());
//	      param.put("columnName2", "contents");
//	      param.put("changeValue2", dto.getContents());
//	      param.put("targetColumn", "seq");
//	      param.put("targetValue", Integer.toString(dto.getSeq()));
//	      
//	      System.out.println(param.size());
//	      
//		return mybatis.update("Board.update",param);
		
		return mybatis.update("Party.update",dto);
	}
 
	public List<PartyDTO> selectByPlace_id(int place_id) throws Exception{
		return mybatis.selectList("Party.selectByPlace_id",place_id);
	}
	// 예지 전체 모임 카운트
	public int getArticleCount(int place_id) throws Exception{
		return mybatis.selectOne("Party.getArticleCount", place_id);
	}
	// 예지씨 모임 페이지별 검색
	public List<PartyDTO> selectByPageNo(int cpage, int place_id) throws Exception{
		int start = cpage * PartyConfiguration.RECORD_COUNT_PER_PAGE - (PartyConfiguration.RECORD_COUNT_PER_PAGE-1);
		int end = start + (PartyConfiguration.RECORD_COUNT_PER_PAGE-1);
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("place_id", place_id);
		return mybatis.selectList("Party.selectByPageNo",param);
	}
	
	public String clew(String str) throws Exception {
		Document doc = Jsoup.connect("https://m.map.kakao.com/actions/searchView?q="+str).get();
		Element linkTag = doc.selectFirst("ul#placeList>li>a>span");
		String img = linkTag.html();

		return img.split("fname=")[1].split("\"")[0];
	}

	// 태훈 모임 리스트 뽑기
	public List<PartyDTO> selectList() {
		return mybatis.selectList("Party.selectList");
	}
	// 태훈 모임 통합 검색
	public List<PartyDTO> partySearch(Map<String, Object> param){
		System.out.println();
		
		
		System.out.println("address : " +param.get("address"));
		
		System.out.println("gender : "+param.get("gender"));
		
		System.out.println("ageList : "+param.get("ageList"));
		
		System.out.println("size" + param.get("ageList.size"));
		
		System.out.println("drinking : "+param.get("drinking"));
		
		System.out.println("title :"+param.get("title"));
		
		System.out.println("writer : "+param.get("writer"));
		
		System.out.println("content : "+param.get("content"));
		
		System.out.println("both : "+param.get("both"));
		
		return mybatis.selectList("Party.partySearch", param);
	}
	/*
	// 태훈 모임 통합 검색
	public List<PartyDTO> partySearch(String address, String gender,List<String> ageList, int drinking, String title, String writer, String content, String both){
		System.out.println();
		Map<String, Object> param = new HashMap<>();
		param.put("address" ,address);
		System.out.println("address : " +address);
		param.put("gender",gender);
		System.out.println("gender : "+gender);
		param.put("ageList",ageList);
		System.out.println("ageList : "+ageList);
		param.put("ageList.size",ageList.size());
		System.out.println(ageList.size());
		param.put("drinking",drinking);
		System.out.println("drinking : "+drinking);
		param.put("title",title);
		System.out.println("title :"+title);
		param.put("writer",writer);
		System.out.println("writer : "+writer);
		param.put("content",content);
		System.out.println("content : "+content);
		param.put("both",both);
		System.out.println("both : "+both);
	
		return mybatis.selectList("Party.partySearch", param);
	}*/
	
	public int stopRecruit(String seq) throws Exception {
		return mybatis.update("Party.stopRecruit",seq);
	}
}
