<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>로그인 페이지</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css ">
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/login.js"></script>
</head>
<body>
<section>
  <!-- 회원가입 -->
  <div class="left">
    <img src="//unsplash.it/700" alt="" />
    <div class="sign-up">
      <h1>회원가입</h1>
      <form action="">
        <input type="text" placeholder="아이디" />
        <input type="email" placeholder="이메일" />
        <input type="password" placeholder="비밀번호" />
        <input type="password" placeholder="비밀번호를 한번 더 입력해주세요" />
        <p>개인정보 수집 및 이용에 동의하십니까?</p>
        <input type="submit" value="가입하기" />
      </form>
      <p>
        이미 계정이 있으신가요?
        <a href="#" id="sign-in" onclick="toggle()">로그인</a>
      </p>
    </div>
  </div>
  <!-- 로그인 -->
  <div class="right">
    <img src="//unsplash.it/600" />
    <div class="sign-in">
      <h1>로그인</h1>
      <c:url value="/login" var="loginUrl" />
      <form:form name="f" action="${loginUrl}" method="POST">
        <input type="text" id="id" name="username" placeholder="ID" />
        <input type="password" id="password" name="password" placeholder="Password" />
        <input type="submit" value="로그인" />
      </form:form>
      <hr>
      <p>
        계정이 없으신가요? <a href="#" onclick="toggle()">가입하기</a>
      </p>
    </div>
  </div>
</section>
</body>
</html>
