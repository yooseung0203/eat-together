package coma.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import coma.spring.dto.MemberDTO;
import coma.spring.dto.QuestionDTO;
import coma.spring.service.MsgService;
import coma.spring.service.QuestionService;

@Controller
@RequestMapping("/question/")
public class QuestionController {
	@Autowired
	private QuestionService qservice;
	
	@Autowired
	private HttpSession session;
	
	@ExceptionHandler
	public String exceptionHandler(NullPointerException npe){
		npe.printStackTrace();
		System.out.println("NullPointerException Handler : 에러가 발생하였습니다.");
		return "member/loginview";
	}
	
	@RequestMapping("question_list")
	public String question_list(HttpServletRequest request)throws Exception{
		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String msg_receiver=mdto.getId();
		System.out.println(msg_receiver+"의 1:1문의");
		if(session.getAttribute("qpage")==null) {
			session.setAttribute("qpage", 1);
		}
		try {
			session.setAttribute("qpage", Integer.parseInt(request.getParameter("qpage")));
		}catch(Exception e) {}
		int qpage = (int)session.getAttribute("qpage");
		List<QuestionDTO> qdto = qservice.selectByQuestion(qpage, msg_receiver);
		String navi = qservice.QuestionNavi(qpage, msg_receiver);
		request.setAttribute("navi", navi);
		request.setAttribute("list", qdto);
		
		return "question/mypage_question";
	}
	@RequestMapping("question_write")
	public String question_write() {
		return "question/writeQuestion";
	}
}
