package coma.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import coma.spring.dto.MemberDTO;
import coma.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService mservice;

	@Autowired
	private HttpSession session;

	//try-catch 예외처리 대체할 수 있는 메서드, ExceptionHandler
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		System.out.println("에러가 발생하였습니다.");
		return "error";
	}

	//로그인 페이지로 이동하기
	@RequestMapping("loginview")
	public String getLoginView() {
		return "member/loginview";
	}

	//회원가입 페이지 중 약관동의로 이동
	@RequestMapping("signup_check")
	public String getSignupCheckView() {
		return "member/signup_check";
	}

	//회원가입, 약관동의 후 정보입력 페이지로 이동
	@RequestMapping("signup_info")
	public String getSignupInfoView() {
		return "member/signup_info";
	}

	//회원가입하기
	@RequestMapping("signupProc")
	public String signUp(MemberDTO mdto)throws Exception {

		int result = mservice.signUp(mdto);
		System.out.println("signupProc 비밀번호 : " + mdto.getPw());

		System.out.println("회원가입 성공");
		return "home";
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
