<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="resources/css/signup.css">
  </head>
  <body>
    <div class="signup-form">
      <h1>회원가입</h1>
      <form action="signup" method="post">
        <div class="form-group">
          <label for="username">아이디</label>
          <input type="text" id="username" name="username" placeholder="아이디를 입력해주세요">
          <button>중복확인</button>
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요">
        </div>
        <div class="form-group">
          <label for="password">비밀번호확인</label>
          <input type="password" id="passwordchek" name="passwordchek" placeholder="비밀번호를 한번 더 입력해주세요">
        </div>
        <div class="form-group">
          <label for="email">이메일</label>
          <input type="email" id="email" name="email" placeholder="예:everyrecipe@every.com">
          <button>중복확인</button>
        </div>
        <div class="form-group">
          <label for="">이용약관동의</label>   
          <input class="" type="checkbox">     
        </div>
        <button type="submit">가입하기</button>
      </form>
    </div>
  </body>
</html>
