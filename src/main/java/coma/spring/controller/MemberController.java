package coma.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import coma.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService mservice;
	
	//로그인 페이지로 이동하기
	@RequestMapping("loginview")
	public String getLoginView() {
		return "member/loginview";
	}

	//회원가입 페이지로 이동
	@RequestMapping("signin_check")
	public String getSigninView() {
		return "member/signin_check";
	}
	
	
//	
//	@RequestMapping("/kakaologin")
//	public String login(@RequestParam("code") String code, HttpSession session) {
//		System.out.println("code : "+ code);
//	    String access_Token = mservice.getAccessToken(code);
//	    System.out.println(access_Token);
//	    HashMap<String, Object> userInfo = mservice.getUserInfo(access_Token);
//	    System.out.println("login Controller : " + userInfo);
//	    
//	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//	    if (userInfo.get("id") != null) {
//	        session.setAttribute("id", userInfo.get("id"));
//	        session.setAttribute("access_Token", access_Token);
//	    }
//	    return "index";
//	}
//
//	
//	@RequestMapping("/logout")
//	public String logout(HttpSession session) {
//	    mservice.kakaoLogout((String)session.getAttribute("access_Token"));
//	    session.removeAttribute("access_Token");
//	    session.removeAttribute("id");
//	    return "index";
//	}

	
}
