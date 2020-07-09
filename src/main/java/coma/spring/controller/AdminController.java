package coma.spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import coma.spring.dto.MemberDTO;
import coma.spring.service.AdminService;



@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminService aservice;
	
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
	
	@RequestMapping("toAdmin_member")
	public String toAdmin_member(HttpServletRequest request)  throws Exception {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		String adminCheck = loginInfo.getId();
		if(adminCheck.contentEquals("administrator")) {
			
			int cpage=1;
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			}catch(Exception e) {

			}
			
			List<MemberDTO> members = aservice.memberList(cpage);
			int mCount = aservice.getAllMemberCount();
			String navi = aservice.getMemberPageNav(cpage);
			
			request.setAttribute("members", members);
			request.setAttribute("count", mCount);
			request.setAttribute("navi", navi);
			return "/admin/admin_member";
		}
		else {
			return "error";
		}
	}
	
}
