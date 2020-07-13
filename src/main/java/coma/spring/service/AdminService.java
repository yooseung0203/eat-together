package coma.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.AdminDAO;
import coma.spring.dao.PartyDAO;
import coma.spring.dto.MemberDTO;
import coma.spring.dto.PartyDTO;
import coma.spring.statics.Configuration;
import coma.spring.statics.PartyConfiguration;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adao;
	
	@Autowired
	private PartyDAO pdao;

	//by 지은, 체크박스 회원 삭제하기
	public int memberOut(String[] checkList) {
		return adao.memberOut(checkList);
	}
	
	//by 지은, 회원정보 리스트 출력하기_20200712
	public List<MemberDTO> memberList(int cpage){
		int start = cpage * Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
		int end = start + (Configuration.recordCountPerPage-1);

		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);

		return adao.memberList(param);
	}

	//by 지은, 회원관리 조건검색_20200712
	public List<MemberDTO> selectByOption(int cpage, Object option){
		int start = cpage * Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
		int end = start + (Configuration.recordCountPerPage-1);

		Map<String, Object> param = new HashMap<>();
		param.put("targetColumn", option);
		param.put("start", start);
		param.put("end", end);

		return adao.selectByOption(param);
	}


	//by 지은, 회원관리 네비바를 위한 회원수 카운트_20200712
	public int getAllMemberCount() {
		return adao.getAllMemberCount();
	}

	//by 지은, 회원관리 중 조건검색 정렬을 위한 네비바 생성_20200712
	public String getSelectMemberPageNav(int cpage, Object option) throws Exception{
		int recordTotalCount = adao.getAllMemberCount(); // 총 회원 수
		int pageTotalCount = 0; // 전체 페이지의 개수

		if( recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		if(cpage < 1) {
			cpage = 1;
		}else if(cpage > pageTotalCount){
			cpage = pageTotalCount;
		}

		int startNav = (cpage-1)/Configuration.navCountPerPage * Configuration.navCountPerPage + 1;
		int endNav = startNav + Configuration.navCountPerPage - 1;
		if(endNav > pageTotalCount) {
			endNav = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNav == 1) {
			needPrev = false;
		}
		if(endNav == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder("<nav aria-label='Page navigation'><ul class='pagination justify-content-center'>");

		if(needPrev) {
			sb.append("<li class='page-item'><a class='page-link' href='/admin/searchByOption?cpage="+(startNav-1)+"?option="+option+"' id='prevPage' tabindex='-1' aria-disabled='true'>Previous</a></li>");
		}

		for(int i=startNav; i<=endNav; i++) {
			if(cpage == i) {
				sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='/admin/searchByOption?cpage="+i+"?option="+option+"'>"+i+"<span class=sr-only>(current)</span></a></li>");
				//sb.append("<li class='page-item active' aria-current='page'>"+i+"<span class='sr-only'>(current)</span></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/admin/searchByOption?cpage="+i+"?option="+option+"'>"+i+"</a></li>");
			}
		}

		if(needNext) {
			sb.append("<li class=page-item><a class=page-link href='/admin/searchByOption?cpage="+(endNav+1)+"?option="+option+"' id='nextPage'>다음</a></li> ");
		}		
		sb.append("</ul></nav>");
		return sb.toString();
	}


	//by 지운, 회원관리 중 회원리스트 출력을 위한 네비바 생성_20200712
	public String getMemberPageNav(int cpage) throws Exception{
		int recordTotalCount = adao.getAllMemberCount(); // 총 회원의 수
		int pageTotalCount = 0; // 전체 페이지의 개수

		if( recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		if(cpage < 1) {
			cpage = 1;
		}else if(cpage > pageTotalCount){
			cpage = pageTotalCount;
		}

		int startNav = (cpage-1)/Configuration.navCountPerPage * Configuration.navCountPerPage + 1;
		int endNav = startNav + Configuration.navCountPerPage - 1;
		if(endNav > pageTotalCount) {
			endNav = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNav == 1) {
			needPrev = false;
		}
		if(endNav == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder("<nav aria-label='Page navigation'><ul class='pagination justify-content-center'>");

		if(needPrev) {
			sb.append("<li class='page-item'><a class='page-link' href='/admin/toAdmin_member?cpage="+(startNav-1)+"' id='prevPage' tabindex='-1' aria-disabled='true'>Previous</a></li>");
		}

		for(int i=startNav; i<=endNav; i++) {
			if(cpage == i) {
				sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='/admin/toAdmin_member?cpage="+i+"'>"+i+"<span class=sr-only>(current)</span></a></li>");
				//sb.append("<li class='page-item active' aria-current='page'>"+i+"<span class='sr-only'>(current)</span></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/admin/toAdmin_member?cpage="+i+"'>"+i+"</a></li>");
			}
		}

		if(needNext) {
			sb.append("<li class=page-item><a class=page-link href='/admin/toAdmin_member?cpage="+(endNav+1)+"' id='nextPage'>다음</a></li> ");
		}		
		sb.append("</ul></nav>");
		return sb.toString();
	}
	
	//by 수지 모임모집글  모임글 출력하기_20200712
		public List<PartyDTO> partyList(int cpage){
			int start = cpage * Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
			int end = start + (Configuration.recordCountPerPage-1);

			Map<String, Integer> param = new HashMap<>();
			param.put("start", start);
			param.put("end", end);

			return adao.partyList(param);
		}
	
	//수지 모임모집글  모임글 네비_20200712
	public String getPageNavi(int currentPage) throws Exception{
		int recordTotalCount = pdao.getListCount(); 
		int pageTotalCount = 0; 
		if(recordTotalCount % PartyConfiguration.SEARCH_COUNT_PER_PAGE > 0) {
			pageTotalCount = recordTotalCount / PartyConfiguration.SEARCH_COUNT_PER_PAGE + 1;			
		}else {
			pageTotalCount = recordTotalCount / PartyConfiguration.SEARCH_COUNT_PER_PAGE;
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
		StringBuilder sb = new StringBuilder();
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		if(needPrev) {
			sb.append("<li class='page-item'><a class='page-link' href='toAdmin_party?cpage="+(startNavi-1)+" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span> </a></li>");
		}
		else {
			sb.append("<li class='page-item disabled'><a class='page-link' aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span> </a></li>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<li class='page-item active' aria-current=\"page\"><span class=\"page-link\">" + i +"<span class=\"sr-only\">(current)</span></span></li>");
			}
			else {
				sb.append("<li class='page-item'><a class='page-link' href=\"toAdmin_party?cpage="+i+"\">" + i + "</a></li>");
			}	
		}
		if(needNext) {
			sb.append("<li class='page-item'><a class='page-link' href='toAdmin_party?cpage="+(endNavi-1)+" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span> </a></li>");
		}
		else {
			sb.append("<li class='page-item disabled'><a class='page-link' aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span> </a></li>");
		}

		return sb.toString();
	}
	
	//by 수지, 모임글관리 조건검색_20200712
		public List<PartyDTO> partyByOption(int cpage, Object option){
			int start = cpage * Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
			int end = start + (Configuration.recordCountPerPage-1);

			Map<String, Object> param = new HashMap<>();
			param.put("targetColumn", option);
			param.put("start", start);
			param.put("end", end);

			return adao.partyByOption(param);
		}

		//by 수지, 모임글 관리 중 조건검색 정렬을 위한 네비바 생성_20200712
		public String getSelectPartyPageNav(int cpage, Object option) throws Exception{
			int recordTotalCount = pdao.getListCount();
			int pageTotalCount = 0; // 전체 페이지의 개수

			if( recordTotalCount % Configuration.recordCountPerPage > 0) {
				pageTotalCount = recordTotalCount / Configuration.recordCountPerPage +1;
			}else {
				pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
			}

			if(cpage < 1) {
				cpage = 1;
			}else if(cpage > pageTotalCount){
				cpage = pageTotalCount;
			}
			

			int startNav = (cpage-1)/Configuration.navCountPerPage * Configuration.navCountPerPage + 1;
			int endNav = startNav + Configuration.navCountPerPage - 1;
			if(endNav > pageTotalCount) {
				endNav = pageTotalCount;
			}

			boolean needPrev = true;
			boolean needNext = true;

			if(startNav == 1) {
				needPrev = false;
			}
			if(endNav == pageTotalCount) {
				needNext = false;
			}

			StringBuilder sb = new StringBuilder();
			if(needPrev) {
				sb.append("<li class='page-item'><a class='page-link' href='/admin/partyByOption?cpage="+(startNav-1)+"?option="+option+"' id='prevPage' tabindex='-1' aria-disabled='true'>Previous</a></li>");
			}

			for(int i=startNav; i<=endNav; i++) {
				if(cpage == i) {
					sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='/admin/partyByOption?cpage="+i+"?option="+option+"'>"+i+"<span class=sr-only>(current)</span></a></li>");
					//sb.append("<li class='page-item active' aria-current='page'>"+i+"<span class='sr-only'>(current)</span></li>");
				}else {
					sb.append("<li class='page-item'><a class='page-link' href='/admin/partyByOption?cpage="+i+"?option="+option+"'>"+i+"</a></li>");
				}
			}

			return sb.toString();
		}


}
