package com.kh.everyrecipe.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoder {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	String password ="1234";
	String encrypPassword = passwordEncoder.encode(password);
	
}
