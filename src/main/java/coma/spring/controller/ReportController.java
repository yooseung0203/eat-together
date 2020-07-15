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
import coma.spring.dto.MemberReportDTO;
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
	public String toReport(HttpServletRequest request) throws Exception {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		request.setAttribute("nick", loginInfo.getNickname());
		return "/report/report_new";
	}
	
	@RequestMapping("memReport")
	public String memReport(MemberReportDTO mdto , HttpServletRequest request ,RedirectAttributes redirectAttributes) throws Exception {
		System.out.println("도착");
		System.out.println(mdto.getId());
		System.out.println(mdto.getReport_id());
		System.out.println(mdto.getTitle());
		System.out.println(mdto.getContent());
		int result = reposervice.memReport(mdto);
		System.out.println("결과 :" +result);
		if(result >0) {
			System.out.println("result : "+result);
			redirectAttributes.addFlashAttribute("rdto", new ReportDTO(0,3,mdto.getId(),mdto.getReport_id(),null,result));
			return "redirect:/report/newReport/";
		}
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
				result = pservice.partyReport(rdto);
				System.out.println(result);
			}
		}
		
		request.setAttribute("result", result);
		return result;
	}
}
