package coma.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import coma.spring.dto.MemberDTO;

@Controller
@RequestMapping("/report/")
public class ReportController {
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("toReport")
	public String toReport(HttpServletRequest request) {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		request.setAttribute("nick", loginInfo.getNickname());
		return "/report/report_new";
	}
}
