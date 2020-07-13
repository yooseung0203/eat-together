package coma.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import coma.spring.dao.MapDAO;
import coma.spring.dao.ReviewDAO;
import coma.spring.dao.ReviewFileDAO;
import coma.spring.dto.MapDTO;
import coma.spring.dto.ReviewDTO;
import coma.spring.dto.ReviewFileDTO;
import coma.spring.dto.TopFiveStoreDTO;
import coma.spring.statics.Configuration;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO rdao;
	@Autowired
	private MapDAO mapdao;
	@Autowired
	private ReviewFileDAO rfdao;
	@Transactional("txManager")
	public void write(ReviewDTO rdto) throws Exception{
		rdao.insert(rdto);
		mapdao.updateRatingAvg(rdto.getParent_seq());
	}
	@Transactional("txManager")
	public void write(ReviewDTO rdto, ReviewFileDTO rfdto) throws Exception{
		rdao.insert(rdto);
		rfdao.insert(rfdto);
		mapdao.updateRatingAvg(rdto.getParent_seq());
	}
	public List<ReviewDTO> selectByPseq(int parent_seq) throws Exception{
		return rdao.selectByPseq(parent_seq);
	}
	
	public ReviewFileDTO selectFileByPseq(int parent_seq) throws Exception{
		return rfdao.selectFileByPseq(parent_seq);
	}
	
	//by지은, 마이페이지 - 내모임 리스트 출력하는 select 문 수정_20200709
	public List<ReviewDTO> selectById(String id)throws Exception{		
		List<ReviewDTO> reviewList = rdao.selectById(id);
		return reviewList;
	}
	
	// 예지 : 신고 기능
	public int report(int seq) throws Exception{
		// 태훈씨 코드랑 합치면서 멤버 테이블의 report 컬럼 카운트 +1 하는 코드 추가할 예정 ( txManager 처리 )
		return rdao.report(seq);
	}
	// 예지 : 리뷰 관리 페이지 - 조건 정렬
	public List<ReviewDTO> selectByPageAndOption(int cpage, Object option) {
		return rdao.selectByPageAndOption(cpage, option);
	}
	// 예지 : 리뷰 관리 페이지 - 조건 정렬
	public String getPageNaviByOption(int cpage, Object option) throws Exception {
		int recordTotalCount = rdao.getArticleCount(); 
		int pageTotalCount = 0; 
		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;			
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		if(cpage < 1) {
			cpage = 1;
		}else if(cpage > pageTotalCount) {
			cpage = pageTotalCount;
		}
		int startNavi = (cpage - 1) / Configuration.recordCountPerPage * Configuration.recordCountPerPage + 1;
		int endNavi = startNavi + Configuration.recordCountPerPage - 1;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true; // <
		boolean needNext = true; // >
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();
		if(needPrev) {sb.append("<li class='page-item'><a class='page-link' href='sortReview?cpage="+(startNavi-1)+"' tabindex='-1' aria-disabled='true'><i class=\"fas fa-chevron-left\"></i> </a></li>");}
		for(int i = startNavi;i <= endNavi;i++) {
			if(cpage == i) {
				sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='sortReview?cpage="+i+"'>"+i+"<span class=sr-only>(current)</span></a></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='sortReview?cpage="+i+"'>"+i+"</a></li>");
			}
//			sb.append("<li class='page-item'><a class='page-link' href='sortReview?cpage="+i+"'>" + i + "</a></li>");
		}
		if(needNext) {sb.append("<li class='page-item'><a class='page-link' href='sortReview?cpage="+(endNavi+1)+"'><i class=\"fas fa-chevron-right\"></i></a></li>");}
		return sb.toString();
	}
	public ReviewDTO selectBySeq(int seq) {
		return rdao.selectBySeq(seq);
	}
	
	//by지은, 마이페이지 - 내 리뷰리스트 출력을 위한 네비바 생성_20200707
	public String getMyPageNav(int mcpage, String id) throws Exception{
		int recordTotalCount = rdao.getMyPageArticleCount(id); // 총 개시물의 개수
		int pageTotalCount = 0; // 전체 페이지의 개수

		if( recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		if(mcpage < 1) {
			mcpage = 1;
		}else if(mcpage > pageTotalCount){
			mcpage = pageTotalCount;
		}

		int startNav = (mcpage-1)/Configuration.navCountPerPage * Configuration.navCountPerPage + 1;
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
			sb.append("<li class='page-item'><a class='page-link' href='/review/selectById?mcpage="+(startNav-1)+"' id='prevPage' tabindex='-1' aria-disabled='true'>Previous</a></li>");
		}

		for(int i=startNav; i<=endNav; i++) {  
			if(mcpage == i) {
				sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='/review/selectById?mcpage="+i+"'>"+i+"<span class=sr-only>(current)</span></a></li>");
				//sb.append("<li class='page-item active' aria-current='page'>"+i+"<span class='sr-only'>(current)</span></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/review/selectById?mcpage="+i+"'>"+i+"</a></li>");
			}
		}

		if(needNext) {
			sb.append("<li class=page-item><a class=page-link href='/review/selectById?mcpage="+(endNav+1)+"' id='nextPage'>다음</a></li> ");
		}		
		sb.append("</ul></nav>");
		return sb.toString();
	}
	// 태훈 리뷰 긁어고기
	public Map<Integer, Object> getReview(List<MapDTO> top){
		List<TopFiveStoreDTO> reviewList = rdao.getReview(top);
		Map<Integer, Object> review = new HashMap<Integer, Object>();
		for(int i=0; i<reviewList.size(); i++) {
			review.put(reviewList.get(i).getParent_seq(), reviewList.get(i));
		}
		return review;
	}
}
