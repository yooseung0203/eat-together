package coma.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import coma.spring.dto.FaqDTO;
import coma.spring.service.FaqService;

@Controller
@RequestMapping("/faq/")
public class FaqController {

	@Autowired
	private FaqService fservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("toWrite")
	public String toWrite() {
		return "/faq/writeProc";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(FaqDTO dto) throws Exception{
		fservice.insert(dto);
		
		
		return "redirect:/faq/list";
	}
	
	
	
	@RequestMapping("list")
	public String list(HttpServletRequest request) throws Exception{
		if(session.getAttribute("fcpage")==null) {
			session.setAttribute("fcpage", 1);
		}
		try { 
			session.setAttribute("fcpage", Integer.parseInt(request.getParameter("fcpage")));
		} catch (Exception e) {}
		int ncpage= (int) session.getAttribute("fcpage");
		List<FaqDTO> dto = fservice.selectByPage(ncpage);
		String navi = fservice.navi(ncpage);
		request.setAttribute("list", dto);
		request.setAttribute("navi", navi);
		return "/faq/faq_list";
	}
	
	
	
	
}
