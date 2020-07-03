package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.PartyDAO;
import coma.spring.dto.PartyDTO;
import coma.spring.dto.PartySearchListDTO;
import coma.spring.statics.PartyConfiguration;


@Service
public class PartyService {
	@Autowired
	private PartyDAO pdao;
	
	public int partyInsert(PartyDTO dto) {
		int seq = pdao.getNextVal();
		dto.setSeq(seq);
		pdao.insert(dto);
		return seq;
	}
	
	
	public PartyDTO selectBySeq(int seq) throws Exception {
		PartyDTO dto = pdao.selectBySeq(seq); // 읽어오기
		return dto;
	}
	

	public int delete(String seq) throws Exception{
		int result=pdao.delete(seq);
		return result;
	}
	
	public int update(PartyDTO dto) throws Exception{
		int result= pdao.update(dto);
		return result;
	}
	
	// 태훈 그냥 모임 글 보기
	public List<PartyDTO> selectList() throws Exception {
		List<PartyDTO> list = pdao.selectList();
		return list;
	}
	// 태훈 모임 글 상세 검색 작업 중
	public List<PartyDTO> partySearch(PartySearchListDTO pdto) throws Exception{
		String address = "";
		String title = "";
		String writer = "";
		String content = "";
		String both = "";
		 
		if(pdto.getSido().equals("시/도 선택")) {
			address="";
		}
		else {
			address = pdto.getSido() + " " + pdto.getGugun();
		}
		
		if(pdto.getText().equals("title")) {
			title = pdto.getSearch();
		}else if(pdto.getText().equals("writer")){
			writer = pdto.getSearch();
		}else if(pdto.getText().equals("content")) {
			content = pdto.getSearch();
		}else if(pdto.getText().equals("both")) {
			both = pdto.getSearch();
		}
		
		List<PartyDTO> list = pdao.partySearch(address,pdto.getGender(),pdto.getDrinking(),title,content,writer,both);
		return list;
	}
	// 예지 
	public List<PartyDTO> selectByPlace_id(int place_id) throws Exception{
		List<PartyDTO> result = pdao.selectByPlace_id(place_id);
		return result;
	}
	// 예지 페이지 글 10개 씩
	public List<PartyDTO> selectByPageNo(int cpage, int place_id) throws Exception{
		return pdao.selectByPageNo(cpage, place_id);
	}
	// 예지 페이지 네비
	public String getPageNavi(int currentPage, int place_id) throws Exception{
		int recordTotalCount = pdao.getArticleCount(place_id); 
		int pageTotalCount = 0; 
		if(recordTotalCount % PartyConfiguration.RECORD_COUNT_PER_PAGE > 0) {
			pageTotalCount = recordTotalCount / PartyConfiguration.RECORD_COUNT_PER_PAGE + 1;			
		}else {
			pageTotalCount = recordTotalCount / PartyConfiguration.RECORD_COUNT_PER_PAGE;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1) / PartyConfiguration.NAVI_COUNT_PER_PAGE * PartyConfiguration.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + PartyConfiguration.NAVI_COUNT_PER_PAGE - 1;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true; // <
		boolean needNext = true; // >
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();
		if(needPrev) {sb.append("<li class='page-item'><a class='page-link' href='selectMarkerInfo?cpage="+(startNavi-1)+"' tabindex='-1' aria-disabled='true'><i class=\"fas fa-chevron-left\"></i> </a></li>");}
		for(int i = startNavi;i <= endNavi;i++) {
			sb.append("<li class='page-item'><a class='page-link' href='selectMarkerInfo?cpage="+i+"&place_id="+place_id+"'>" + i + "</a></li>");
		}
		if(needNext) {sb.append("<li class='page-item'><a class='page-link' href='selectMarkerInfo?cpage="+(endNavi+1)+"'><i class=\"fas fa-chevron-right\"></i></a></li>");}
		return sb.toString();
	}
	// 예지 음식점 이미지 클롤링
	public String clew(String str) throws Exception{
		return pdao.clew(str);
	}
}
