package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.QuestionDAO;
import coma.spring.dto.QuestionDTO;

@Service
public class QuestionService {
	@Autowired
	private QuestionDAO qdao;
	
	//1:1문의 리스트
	public List<QuestionDTO> selectByQuestion(int cpage,String msg_receiver)throws Exception{
		List<QuestionDTO> qdto = qdao.selectByQuestion(cpage, msg_receiver);
		return qdto;
	}
	//1:1문의 보내기
	public int insertQuestion(QuestionDTO qdto)throws Exception{
		int result = qdao.insertQuestion(qdto);
		return result;
	}
	//1:1문의 네비
	public String QuestionNavi(int cpage,String msg_receiver)throws Exception{
		String navi = qdao.getQuestionPageNav(cpage, msg_receiver);
		return navi;
	}
}
