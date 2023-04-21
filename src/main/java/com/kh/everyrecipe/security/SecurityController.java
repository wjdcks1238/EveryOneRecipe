package com.kh.everyrecipe.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public class SecurityController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="passwordEncoder")
	public String passwordEncoder(
			@RequestParam(value="password",
			required=false, defaultValue="") String password,
            Model model) {
		
		if(StringUtils.hasText(password)) {
			String bCryptString = passwordEncoder.encode(password);
			model.addAttribute("password", password);
			model.addAttribute("bCryptString", bCryptString);
		}
		return "/bCryptString";
	}
}
