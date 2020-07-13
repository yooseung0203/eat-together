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
		if(session.getAttribute("qcpage")==null) {
			session.setAttribute("qcpage", 1);
		}
		try {
			session.setAttribute("qcpage", Integer.parseInt(request.getParameter("qcpage")));
		}catch(Exception e) {}
		int qcpage = (int)session.getAttribute("qcpage");
		List<QuestionDTO> qdto = qservice.selectByQuestion(qcpage, msg_receiver);
		String navi = qservice.QuestionNavi(qcpage, msg_receiver);
		request.setAttribute("navi", navi);
		request.setAttribute("list", qdto);
		
		return "question/mypage_question";
	}
	//문의 보기
	@RequestMapping("questionView")
	public String QuestionView(HttpServletRequest request,int msg_seq)throws Exception{
		QuestionDTO qdto = qservice.selectBySeq(msg_seq);
		request.setAttribute("qdto", qdto);
		return "question/questionView";
	}
	@RequestMapping("questionViewAdmin")
	public String QuestionViewAdmin(HttpServletRequest request,int msg_seq)throws Exception{
		QuestionDTO qdto = qservice.selectBySeq(msg_seq);
		request.setAttribute("qdto", qdto);
		return "admin/admin_question_view";
	}
	
	//관리자 페이지 1:1문의 리스트
	@RequestMapping("AdminQuestion_list")
	public String AdminQuestion_list(HttpServletRequest request)throws Exception{
		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		if(session.getAttribute("Aqcpage")==null) {
			session.setAttribute("Aqcpage", 1);
		}
		try {
			session.setAttribute("Aqcpage", Integer.parseInt(request.getParameter("Aqcpage")));
		}catch(Exception e) {}
		String Id=mdto.getId();
		if(Id.contentEquals("administrator")) {
			int Aqcpage = (int)session.getAttribute("Aqcpage");
			List<QuestionDTO> qdto = qservice.selectByAdminQ(Aqcpage);
			String navi = qservice.AdminQuestionNavi(Aqcpage);
			
			request.setAttribute("navi", navi);
			request.setAttribute("list", qdto);
			
			return "admin/admin_question_list";
		}else {
			return "error";
		}
		
	}
	//1:1문의 답변페이지
	@RequestMapping("questionAnswer")
	public String QuestionAnswer(HttpServletRequest request,QuestionDTO qdto){
		request.setAttribute("qdto", qdto);
		System.out.println(qdto.getMsg_seq());
		System.out.println(qdto.getMsg_sender());
		return "admin/admin_qWrite";
	}
	//1:1문의 답변
	@RequestMapping("questionAnswerSend")
	public String questionAnswerSend(QuestionDTO qdto)throws Exception{
		MemberDTO mdto=(MemberDTO)session.getAttribute("loginInfo");
		
		String admin = mdto.getId();
		if(admin.contentEquals("administrator")) {
			int answerSeq= qservice.getNextVal();
			qdto.setMsg_seq(answerSeq);
			int result = qservice.QuestionAnswer(qdto);
			if(result==1) {
				System.out.println(qdto.getMsg_view()+"번의 게시글에 대한 답변");
				
				QuestionDTO updto = new QuestionDTO();
				updto.setMsg_seq(qdto.getMsg_view());
				updto.setMsg_view(answerSeq);
				System.out.println("답변업데이트 게시글 번호seq :"+qdto.getMsg_view()+"답변 게시글 번호 :"+answerSeq);
				
				int update = qservice.answerUpdate(updto);
				
				return "msg/msgWriteResult";
			}else{
				return "error";
			}
			
			
		}else {
			return "error";
		}
	}
	//1:1문의 보내기
	@RequestMapping("insertQuestion")
	public String insertQuestion(QuestionDTO qdto)throws Exception{
		MemberDTO mdto=(MemberDTO)session.getAttribute("loginInfo");
		String msg_sender = mdto.getId();
		//보낸 사람 넣기
		qdto.setMsg_sender(msg_sender);
		int result = qservice.insertQuestion(qdto);
		if(result==1) {
			return "msg/msgWriteResult";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("question_write")
	public String question_write(){
		return "question/writeQuestion";
	}
}
