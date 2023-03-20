package com.kh.everyrecipe.common;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("com.kh.everyrecipe")
public class GlobalCatcher {
	@ExceptionHandler(Exception.class)
	public String catcher(Exception ex , Model m) {
		m.addAttribute("ex",ex );
		return "errors/errorPage";
	}
}