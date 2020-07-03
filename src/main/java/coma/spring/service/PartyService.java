package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.PartyDAO;
import coma.spring.dto.PartyDTO;
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
	
	public List<PartyDTO> selectByPlace_id(int place_id) throws Exception{
		List<PartyDTO> result = pdao.selectByPlace_id(place_id);
		return result;
	}
	public List<PartyDTO> selectByPageNo(int cpage, int place_id) throws Exception{
		return pdao.selectByPageNo(cpage, place_id);
	}
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
	public String clew(String str) throws Exception{
		return pdao.clew(str);
	}
	
	public int stopRecruit(String seq) throws Exception {
		return pdao.stopRecruit(seq);
	}
}
