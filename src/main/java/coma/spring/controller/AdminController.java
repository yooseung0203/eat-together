package coma.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/admin/")
public class AdminController {

	@RequestMapping("toAdmin")
	public String toAdmin() {

		
		return "/admin/admin_main";
	}
	
}
