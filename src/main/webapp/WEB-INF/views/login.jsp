<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LOGIN</title>
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
<h1>Login Form</h1>
<hr>	
<br>
 <div class="container">
    <form id="login" method="post">
      <label for="username">아이디</label>
      <input type="text" id="username" name="username">
      <label for="password">비밀번호</label>
      <input type="password" id="password" name="password">
      <button type="submit">로그인</button><br>
      
      					
    <p><a href="#" class="forgot-password">비밀번호를 잊으셨나요?</a></p>
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align:center"><a href="${url}">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
			<br>
		
    </form>
    <p>계정이 없으신가요? <a href="#">가입하기</a></p>
  </div>
 
 <form:form action="${pageContext.request.contextPath}/logout" method="POST">
	<input type="submit" value="로그아웃" />
</form:form>

</body>
</html>