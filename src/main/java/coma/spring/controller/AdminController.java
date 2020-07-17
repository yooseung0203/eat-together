package coma.spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import coma.spring.dto.FaqDTO;
import coma.spring.dto.MemberDTO;
import coma.spring.dto.MsgDTO;
import coma.spring.dto.PartyCountDTO;
import coma.spring.dto.PartyDTO;
import coma.spring.dto.QuestionDTO;
import coma.spring.dto.ReportDTO;
import coma.spring.dto.ReviewDTO;
import coma.spring.service.AdminService;
import coma.spring.service.FaqService;
import coma.spring.service.MsgService;
import coma.spring.service.PartyService;
import coma.spring.service.QuestionService;
import coma.spring.service.ReportService;
import coma.spring.service.ReviewService;


@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private HttpSession session;

	@Autowired
	private AdminService aservice;

	@Autowired
	private PartyService pservice;

	@Autowired
	private QuestionService qservice;

	@Autowired
	private MsgService msgservice;

	@Autowired
	FaqService fservice;

	@Autowired
	private ReviewService rservice;
	
	@Autowired
	private ReportService reposervice;


	@RequestMapping("toAdmin")
	public String toAdmin() {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		String adminCheck = loginInfo.getId();
		if(adminCheck.contentEquals("administrator")) {
			return "/admin/admin_main";
		}
		else {
			return "/error/adminpermission";
		}
	}
	//by 지은, 회원정보 리스트 출력하기
	@RequestMapping("toAdmin_member")
	public ModelAndView toAdmin_member(HttpServletRequest request)  throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_member");

		int cpage=1;
		try {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}catch(Exception e) {

		}

		List<MemberDTO> mlist = aservice.memberList(cpage);
		String navi = aservice.getMemberPageNav(cpage);

		mav.addObject("mlist", mlist);
		mav.addObject("navi", navi);
		return mav;
	}

	//by 지은, 회원정보 옵션 검색하기
	@RequestMapping("searchByOption")
	public ModelAndView searchByOption(HttpServletRequest request)throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_member");
		Object option;

		if(request.getParameter("option")!=null) {
			option = request.getParameter("option");
			session.setAttribute("option", option);
		}else {
			option = session.getAttribute("option");
		}

		int cpage=1;
		try {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}catch(Exception e) {

		}
		List<MemberDTO> mlist = aservice.selectByOption(cpage, option);
		String navi = aservice.getSelectMemberPageNav(cpage, option);

		mav.addObject("mlist", mlist);
		mav.addObject("navi", navi);
		System.out.println(option + "검색성공");
		return mav;
	}

	//by 지은, 체크한 회원 탈퇴시키기_20200714
	@RequestMapping("memberOutProc")
	@ResponseBody
	public int memberOutProc(HttpServletRequest request)throws Exception{
		String data = request.getParameter("ids"); 
		String ids = data.substring(2,data.length()-2);
		String[] checkList = ids.split("\",\"");

		System.out.println("탈퇴 선택한 회원 수 : " + checkList.length);

		for(int a = 0; a<checkList.length;a++) {
			System.out.println(checkList[a]);
		}
		int resp = aservice.memberOut(checkList);

		System.out.println("탈퇴된 회원수 : " + resp);
		return resp;
	}

	//수지 FAQ 게시물 출력하기
	@RequestMapping("toAdmin_faq")
	public String toAdmin_faq(HttpServletRequest request)  throws Exception {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		String adminCheck = loginInfo.getId();
		if(adminCheck.contentEquals("administrator")) {

			int cpage=1;
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			}catch(Exception e) {

			}

			List<FaqDTO> list = fservice.selectByPage(cpage);
			String navi = fservice.navi(cpage);

			request.setAttribute("list", list);
			request.setAttribute("navi", navi);
			return "/admin/admin_faq";
		}
		else {
			return "/error/adminpermission";
		}
	}

	//수지 모임 게시물 출력하기_20200712
	@RequestMapping("toAdmin_party")
	public String toAdmin_party(HttpServletRequest request)  throws Exception {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		String adminCheck = loginInfo.getId();
		if(adminCheck.contentEquals("administrator")) {
			int cpage=1;
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			}catch(Exception e) {

			}
			List<PartyDTO> partyList = aservice.partyList(cpage);
			String navi = aservice.getPageNavi(cpage);
			System.out.println(partyList.size());

			request.setAttribute("navi", navi);
			request.setAttribute("list", partyList);

			return "/admin/admin_party";
		}else {
			return "/error/adminpermission";
		}
	}

	//by 수지, 회원정보 옵션 검색하기
	@RequestMapping("partyByOption")
	public ModelAndView partyByOption(HttpServletRequest request)throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/admin_party");
		Object option;

		if(request.getParameter("option")!=null) {
			option = request.getParameter("option");
			session.setAttribute("option", option);
		}else {
			option = session.getAttribute("option");
		}
		int cpage=1;
		try {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}catch(Exception e) {

		}
		List<PartyDTO> list = aservice.partyByOption(cpage, option);
		String navi = aservice.getSelectPartyPageNav(cpage, option);

		mav.addObject("list", list);
		mav.addObject("navi", navi);
		System.out.println(option + "검색성공");
		return mav;
	}

	@RequestMapping("sortReview") // 예지 : 리뷰 검색
	public ModelAndView sortReview(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_review");
		Object option;
		if(request.getParameter("option")!=null) {
			option = request.getParameter("option");
			session.setAttribute("option", option);
		}else {
			option = session.getAttribute("option");
		}

		int cpage=1;
		try {cpage = Integer.parseInt(request.getParameter("cpage"));}catch(Exception e) {}
		List<ReviewDTO> rlist = rservice.selectByPageAndOption(cpage, option);
		String navi = rservice.getPageNaviByOption(cpage, option);
		mav.addObject("rlist", rlist);
		mav.addObject("navi", navi);
		System.out.println(option + "검색성공");
		return mav;
	}
	@ResponseBody // 예지 리뷰 상세정보 Modal 
	@RequestMapping(value="viewDetailReview",produces="application/json;charset=utf8")
	public String viewDetailReview(int seq) throws Exception{
		Gson gson = new Gson();
		ReviewDTO rdto = rservice.selectBySeq(seq);
		System.out.println(rdto.getSdate());
		return gson.toJson(rdto);
	}

	// 수지 모임 글 보기
	@RequestMapping(value="admin_party_content")
	public String party_content(String seq, HttpServletRequest request) throws Exception {
		PartyDTO content=pservice.selectBySeq(Integer.parseInt(seq));
		String img = pservice.clew(content.getParent_name());
		MemberDTO account = (MemberDTO) session.getAttribute("loginInfo");
		String id = account.getId();
		String nickname = account.getNickname();
		boolean partyFullCheck = pservice.isPartyfull(seq);
		boolean partyParticipantCheck= pservice.isPartyParticipant(seq, nickname);

		//         if(partyParticipantCheck) {
		//            request.setAttribute("participant", 1);
		//         }

		PartyCountDTO pcdto = pservice.getPartyCounts(seq);

		request.setAttribute("img", img);
		request.setAttribute("con",content);
		request.setAttribute("party", pcdto);
		request.setAttribute("account", account);
		request.setAttribute("partyFullCheck", partyFullCheck);
		request.setAttribute("partyParticipantCheck", partyParticipantCheck);
		return "/admin/admin_party_content";
	}



	//1:1문의 Admin 유승	
	@RequestMapping("questionViewAdmin")
	public String QuestionViewAdmin(HttpServletRequest request,int msg_seq)throws Exception{
		QuestionDTO qdto = qservice.selectBySeq(msg_seq);

		System.out.println("viewcount : "+qdto.getMsg_view());

		//0or1 = 답변 x 다른 번호  = 답변완료
		int qResult=qdto.getMsg_view();
		if(qResult==0||qResult==1) {
			request.setAttribute("qdto", qdto);
			return "admin/admin_question_view";
		}else {
			QuestionDTO qadto = qservice.selectBySeq(qResult);
			request.setAttribute("qadto", qadto);
			request.setAttribute("qdto", qdto);
			return "/admin/admin_question_view";
		}
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

			return "/admin/admin_question_list";
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
		return "/admin/admin_qWrite";
	}
	//1:1문의 답변
	@RequestMapping("questionAnswerSend")
	public String questionAnswerSend(QuestionDTO qdto)throws Exception{
		MemberDTO mdto=(MemberDTO)session.getAttribute("loginInfo");

		String admin = mdto.getId();
		if(admin.contentEquals("administrator")) {
			int answerSeq= qservice.getNextVal();
			qdto.setMsg_title("[1:1답변]"+qdto.getMsg_title());
			qdto.setMsg_seq(answerSeq);
			int result = qservice.QuestionAnswer(qdto);
			if(result==1) {
				System.out.println(qdto.getMsg_view()+"번의 게시글에 대한 답변");

				QuestionDTO updto = new QuestionDTO();
				updto.setMsg_seq(qdto.getMsg_view());
				updto.setMsg_view(answerSeq);
				System.out.println("답변업데이트 게시글 번호seq :"+qdto.getMsg_view()+"답변 게시글 번호 :"+answerSeq);

				int update = qservice.answerUpdate(updto);

				return "redirect:/admin/questionViewAdmin?msg_seq="+qdto.getMsg_view();
			}else{
				return "error";
			}


		}else {
			return "error";
		}
	}
	//공지 쪽지
	@RequestMapping("toAdmin_msg")
	public String toAdmin_msg()throws Exception{
		return "/admin/admin_msg";
	}
	@RequestMapping("msgNotice")
	public String msgNotice(HttpServletRequest request,MsgDTO msgdto)throws Exception{
		msgdto.setMsg_title("[공지]"+msgdto.getMsg_title());
		int result = msgservice.msgNotice(msgdto);
		System.out.println(result+"명의 회원에게 쪽지 전송 성공");
		request.setAttribute("result",result);
		return "/admin/admin_msgResult";
	}

	//관리자 받은쪽지함
	@RequestMapping("admin_msgSend")
	public String msglist_sender(HttpServletRequest request)throws Exception{
		MemberDTO mdto = (MemberDTO)session.getAttribute("loginInfo");
		String msg_receiver = mdto.getNickname();
		System.out.println(msg_receiver+"의 받은 쪽지함");

		if(session.getAttribute("ascpage")==null) {
			session.setAttribute("ascpage", 1);
		}
		try { 
			session.setAttribute("ascpage", Integer.parseInt(request.getParameter("ascpage")));
		} catch (Exception e) {}
		int ascpage=(int)session.getAttribute("ascpage");
		List<MsgDTO> dto = aservice.selectBySender(ascpage,msg_receiver);
		String navi = aservice.Sendnavi(ascpage,msg_receiver);

		request.setAttribute("navi", navi);
		request.setAttribute("list", dto);
		return "/admin/admin_msgSend";
	}
	@RequestMapping("admin_msgReceive")
	public String msglist_receiver(HttpServletRequest request)throws Exception{
		MemberDTO mdto = (MemberDTO)session.getAttribute("loginInfo");
		String msg_receiver = mdto.getNickname();
		System.out.println(msg_receiver+"의 보낸 쪽지함");

		if(session.getAttribute("arcpage")==null) {
			session.setAttribute("arcpage", 1);
		}
		try { 
			session.setAttribute("arcpage", Integer.parseInt(request.getParameter("arcpage")));
		} catch (Exception e) {}

		int arcpage=(int)session.getAttribute("arcpage");

		List<MsgDTO> dto = aservice.selectByReceiver(arcpage,msg_receiver);
		String navi =aservice.Receivenavi(arcpage, msg_receiver);

		request.setAttribute("navi", navi);
		request.setAttribute("list", dto);
		return "/admin/admin_msgReceive";
	}
	//삭제된 메세지함
	@RequestMapping("admin_msgDelete")
	public String msglist_delete(HttpServletRequest request)throws Exception{
		MemberDTO mdto = (MemberDTO)session.getAttribute("loginInfo");
		String msg_receiver = mdto.getNickname();
		System.out.println(msg_receiver+"의 보낸 쪽지함");

		if(session.getAttribute("gcpage")==null) {
			session.setAttribute("gcpage", 1);
		}
		try { 
			session.setAttribute("gcpage", Integer.parseInt(request.getParameter("gcpage")));
		} catch (Exception e) {}

		int gcpage=(int)session.getAttribute("gcpage");

		List<MsgDTO> dto = aservice.selectByDelete(gcpage,msg_receiver);
		String navi =aservice.Deletenavi(gcpage, msg_receiver);

		request.setAttribute("navi", navi);
		request.setAttribute("list", dto);
		return "/admin/admin_msgDelete";
	}

	//메세지 복구
	@RequestMapping("saveMsg")
	public String saveMsg(int msg_seq)throws Exception{
		int result = aservice.saveMsg(msg_seq);
		return "redirect:admin_msgDelete";
	}
	//받은쪽지함 삭제
	@RequestMapping("msgReceiverDel")
	public String ReceiverDel(int msg_seq)throws Exception{
		int result = msgservice.receiver_del(msg_seq);
		return "redirect:admin_msgSend";
	}

	//보낸쪽지함 삭제
	@RequestMapping("msgSenderDel")
	public String SenderDel(int msg_seq)throws Exception{
		System.out.println(msg_seq);
		int result = msgservice.sender_del(msg_seq);
		return "redirect:admin_msgReceive";
	}
	
	//1:1문의  삭제
	@RequestMapping("AdminQuestionDel")
	public String AdminQuestionDel(int msg_seq)throws Exception{
		System.out.println(msg_seq);
		int result = msgservice.sender_del(msg_seq);
		return "redirect:AdminQuestion_list";
	}

	// 태훈 신고 리스트 출력하기 
	@RequestMapping("toAdmin_report")
	public String toAdmin_report(HttpServletRequest request)  throws Exception {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		String adminCheck = loginInfo.getId();
		if(adminCheck.contentEquals("administrator")) {

			int cpage=1;
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			}catch(Exception e) {

			}

			List<ReportDTO> list = aservice.reportList(cpage);
			String navi = aservice.getReportNavi(cpage);

			request.setAttribute("list", list);
			request.setAttribute("navi", navi);
			return "/admin/admin_report";
		}
		else {
			return "/error/adminpermission";
		}
	}

}

