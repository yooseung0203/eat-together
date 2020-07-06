package coma.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.QuestionDTO;
import coma.spring.statics.Configuration;

@Repository
public class QuestionDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<QuestionDTO> selectByQuestion(int cpage,String msg_receiver)throws Exception{
		int start = cpage*Configuration.recordMsgCountPerPage - (Configuration.recordMsgCountPerPage - 1);
		int end = start + (Configuration.recordMsgCountPerPage - 1);
		
		Map<String,String> param = new HashMap<>();
		param.put("start",String.valueOf(start));
		param.put("end",String.valueOf(end));
		param.put("msg_receiver",msg_receiver);
		
		return mybatis.selectList("question.selectByQuestion",param);
	}
	
	//1:1문의 네비 카운트
	public int getQuestionCount(String msg_receiver) throws Exception{
		return mybatis.selectOne("question.getQuestionCount",msg_receiver);
	}
	//1:1문의 네비
		public String getQuestionPageNav(int currentPage,String msg_receiver) throws Exception{
			int recordTotalCount = this.getQuestionCount(msg_receiver); // 총 개시물의 개수
			int pageTotalCount = 0; // 전체 페이지의 개수

			if( recordTotalCount % Configuration.recordMsgCountPerPage > 0) {
				pageTotalCount = recordTotalCount / Configuration.recordMsgCountPerPage +1;
			}else {
				pageTotalCount = recordTotalCount / Configuration.recordMsgCountPerPage;
			}

			if(currentPage < 1) {
				currentPage = 1;
			}else if(currentPage > pageTotalCount){
				currentPage = pageTotalCount;
			}

			int startNav = (currentPage-1)/Configuration.navMsgCountPerPage * Configuration.navMsgCountPerPage + 1;
			int endNav = startNav + Configuration.navMsgCountPerPage - 1;
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
				sb.append("<li class='page-item'><a class='page-link' href='question_list?msgpage="+(startNav-1)+"' id='prevPage' tabindex='-1' aria-disabled='true'>Previous</a></li>");
			}

			for(int i=startNav; i<=endNav; i++) {
				if(currentPage == i) {
					sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='question_list?msgpage="+i+"'>"+i+"<span class=sr-only>(current)</span></a></li>");
					//sb.append("<li class='page-item active' aria-current='page'>"+i+"<span class='sr-only'>(current)</span></li>");
				}else {
					sb.append("<li class='page-item'><a class='page-link' href='question_list?msgpage="+i+"'>"+i+"</a></li>");
				}
			}

			if(needNext) {
				sb.append("<li class=page-item><a class=page-link href='question_list?msgpage="+(endNav+1)+"' id='nextPage'>다음</a></li> ");
			}		
			sb.append("</ul></nav>");
			return sb.toString();
		}
	
}
