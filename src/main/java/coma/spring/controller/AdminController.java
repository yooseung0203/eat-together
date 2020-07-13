package coma.spring.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import coma.spring.dto.FaqDTO;
import coma.spring.dto.MapDTO;
import coma.spring.dto.MemberDTO;
import coma.spring.dto.PartyCountDTO;
import coma.spring.dto.PartyDTO;
import coma.spring.service.AdminService;
import coma.spring.service.FaqService;
import coma.spring.service.PartyService;



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
	FaqService fservice;

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
			
//			if(partyParticipantCheck) {
//				request.setAttribute("participant", 1);
//			}
			
			PartyCountDTO pcdto = pservice.getPartyCounts(seq);

			request.setAttribute("img", img);
			request.setAttribute("con",content);
			request.setAttribute("party", pcdto);
			request.setAttribute("account", account);
			request.setAttribute("partyFullCheck", partyFullCheck);
			request.setAttribute("partyParticipantCheck", partyParticipantCheck);
			return "/admin/admin_party_content";
		}
		// 태훈 신고
		@RequestMapping(value="admin_report_content")
		public String report_content() {
			return"a";
		}
}
