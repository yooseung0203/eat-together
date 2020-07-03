package coma.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import coma.spring.dto.MemberDTO;
import coma.spring.service.MsgService;


@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() throws Exception{
		
		return "home";
	}
	
	@RequestMapping("error")
	public String error() {
		return "error";
	}
	
}
