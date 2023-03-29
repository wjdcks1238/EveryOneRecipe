package com.kh.everyrecipe.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

	
	@GetMapping("/admin")
	public String adminTest() {
		
		return "/admin/admin";
	}
	

	@GetMapping("/admin/members")
	public String members() {
		
		return "/admin/members";
	}
	
	
}
