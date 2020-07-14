package coma.spring.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import coma.spring.dto.MemberDTO;
import coma.spring.dto.ReportDTO;
import coma.spring.service.PartyService;
import coma.spring.service.ReportService;
import coma.spring.service.ReviewService;

@Controller
@RequestMapping("/report/")
public class ReportController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private PartyService pservice;
	
	@Autowired
	private ReviewService rservice;
	
	@Autowired
	private ReportService reposervice;
	
	@RequestMapping("toReport")
	public String toReport(HttpServletRequest request) {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		request.setAttribute("nick", loginInfo.getNickname());
		return "/report/report_new";
	}
	@ResponseBody
	@RequestMapping("newReport")
	public int newReport(HttpServletRequest request, RedirectAttributes redirectAttributes, ReportDTO rdto) throws Exception {
		System.out.println("도착");
		int result = 0;
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		rdto = (ReportDTO)map.get("rdto");
		System.out.println(rdto.getId());
		System.out.println(rdto.getCategory());
		System.out.println(rdto.getReport_id());
		System.out.println(rdto.getParent_seq());
		int check = reposervice.checkDupl(rdto);
		System.out.println(check);
		if(rdto.getCategory() == 0) { // 리뷰 신고
			if(check == 0) {
				result = rservice.report(rdto);
				System.out.println("리뷰 신고 : " + result);
			}
		}else if(rdto.getCategory() == 1) { // 모임글 신고
			if(check == 0) {
				reposervice.newReport(rdto);
				result = pservice.partyReport(rdto.getParent_seq());
				System.out.println(result);
			}
		}
		request.setAttribute("result", result);
		return result;
	}
}
