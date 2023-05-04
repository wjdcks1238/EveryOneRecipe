package com.kh.everyrecipe.login.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfTokenRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication()
		  	.dataSource(dataSource)
			.passwordEncoder(passwordEncoder());
			
	}
	//CSRF토근 사용하기위해
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
    }

	//🔲DB에 등록된 암호화되지 않은 password 암호화하기..
	//🔲암호화할 비밀번호를 얻는다
	//🔲PasswordEncoder를 사용하여 비밀번호 암호화하고 DB에 저장 for문 돌려서.>!!!!! 암호화 안된것들 돌려돌려
	//🔲특정 페이지 들어가면 암호화해서 저장하게끔 만들기..!!!
	//
	//String password = "password";
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void updatePassword(String userId, String password) {
	    String encodedPassword = passwordEncoder.encode(password);
	    // DB에 암호화된 비밀번호 저장 로직
	}

	
	
}
