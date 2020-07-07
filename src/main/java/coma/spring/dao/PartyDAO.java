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
	// 예지
	public int stopRecruit(String seq) throws Exception {
		return mybatis.update("Party.stopRecruit",seq);
	}
	// 예지 이미지 뽑아오기
	public String clew(String str) throws Exception {
		Document doc = Jsoup.connect("https://m.map.kakao.com/actions/searchView?q="+str).get();
		Element linkTag = doc.selectFirst("ul#placeList>li>a>span");
		String img = linkTag.html();
		if(img.contains("fname=")) {
			return img.split("fname=")[1].split("\"")[0];
		}
		else {
			// 이미지 소스 없는 가게 에러 해결 위해 추가 - 태훈
			return "https://tpc.googlesyndication.com/simgad/11554535643826380039?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&rs=AOga4qnk_Y1zzDS1b6Wu1KYZ-_e0LjecDg";
		}
	}
	// 태훈 모임 리스트 뽑기
//	public List<PartyDTO> selectList() {
//		return mybatis.selectList("Party.selectList");
//	}
	// 태훈 모임 리스트 뽑기 네비 포함
	public List<PartyDTO> selectList(int cpage) {
		int start = cpage * PartyConfiguration.SEARCH_COUNT_PER_PAGE - (PartyConfiguration.SEARCH_COUNT_PER_PAGE-1);
		int end = start + (PartyConfiguration.SEARCH_COUNT_PER_PAGE-1);
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Party.selectList" ,param);
	}
	// 태훈 전체 모임 카운트
	public int getListCount() {
		return mybatis.selectOne("Party.getListCount");
	}
	// 태훈 모임 통합 검색
	public List<PartyDTO> partySearch(Map<String, Object> param){	
		return mybatis.selectList("Party.partySearch", param);
	}
	// 태훈 모집 순위순 뽑아오기
	public List<String> partyCountById() {
		return mybatis.selectList("Party.PartyCountById");
	}
	
}
