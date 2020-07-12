package coma.spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import coma.spring.dto.FaqDTO;
import coma.spring.dto.MemberDTO;
import coma.spring.dto.ReviewDTO;
import coma.spring.service.AdminService;
import coma.spring.service.FaqService;
import coma.spring.service.ReviewService;



@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private HttpSession session;

	@Autowired
	private AdminService aservice;

	@Autowired
	FaqService fservice;
	
	@Autowired
	private ReviewService rservice;

	@RequestMapping("toAdmin")
	public String toAdmin() {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		String adminCheck = loginInfo.getId();
		if(adminCheck.contentEquals("administrator")) {
			return "/admin/admin_main";
		}
		else {
			return "error";
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
			return "error";
		}
	}
	
	@RequestMapping("toAdmin_review") // 예지 : 리뷰 관리 페이지
	public String toAdmin_review(HttpServletRequest request) throws Exception{
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		String adminCheck = loginInfo.getId();
		if(adminCheck.contentEquals("administrator")) {
			int cpage=1;
			try {cpage = Integer.parseInt(request.getParameter("cpage"));}catch(Exception e) {}
			List<ReviewDTO> list = rservice.selectByPageNo(cpage);
			String navi = rservice.getPageNavi(cpage);

			request.setAttribute("rlist", list);
			request.setAttribute("navi", navi);
			return "/admin/admin_review";
		}
		else {
			return "error";
		}
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
	@ResponseBody
	@RequestMapping(value="viewDetailReview",produces="application/json;charset=utf8")
	public String viewDetailReview(int seq) throws Exception{
		Gson gson = new Gson();
		ReviewDTO rdto = rservice.selectBySeq(seq);
		System.out.println(rdto.getSdate());
		return gson.toJson(rdto);
	}

}
