<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>회원가입|로그인</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css ">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginOr.css ">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-5D3s7oBzI+us+OydsNusK8dJMSDxgdKJdsgSiLAgT+2P65oKUfOq9wuE+GlvGcl2" crossorigin="anonymous">

<!-- Bootstrap Icons CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
	

</head>
<body>
<section>
  <!-- 회원가입 -->
  <div class="left">
    <img src="//unsplash.it/700" alt="" />
    <div class="sign-up">
      <h1>회원가입
     	 <i id="resetBtn" class="bi bi-arrow-clockwise reset-btn" style="display: none"></i>
      </h1>
      <c:url value="/member/signup" var="signupUrl" />
      <form:form name="signup" action="${signupUrl} " method="POST">
        <input type="text" id="userid" name="userId" placeholder="아이디" required/>
            <div class="error-message hide error" id="userid-error">아이디를 입력하세요.</div>
        	<div class="error-message hide error" id="regid-error">공백없이 영어 소문자, 숫자 조합 5자~14자 이하로 입력해주세요.</div>
        	<div class="error-message hide error" id="idcheck-error">중복된 아이디입니다.</div>
        	
        <!-- 정규표현식으로 비밀번호 검증하기 공백없이 영어, 숫자, 특수문자(!,@,#)조합하여 8자 이상 16자 이하-->
        <input type="password" id="password" name="password" placeholder="비밀번호" />
			<div class="error-message hide error" id="regPassword-error">공백없이 영어, 숫자, 특수문자(!,@,#)조합하여 8자 이상 16자 이하로 입력해주세요.</div>
		<input type="password" id="checkpw"  placeholder="비밀번호를 한번 더 입력해주세요" />
			<div class="error-message hide error" id="passwordCheck-error">비밀번호가 일치하지 않습니다.</div>

		<input type="text" id="nickname" name="nickName" placeholder="닉네임"/>
			<div class="error-message hide error" id="nickname-error">닉네임을 입력하세요.</div>
			<div class="error-message hide error" id="regidNickname-error">공백없이 영어, 숫자, 19자 이하로 입력해주세요.</div>
						
        <input type="text" id="email" name="email" placeholder="이메일" />
        	<div class="error-message hide error" id="email-error">이메일을 입력해주세요.</div>
        	<div class="error-message hide error" id="regMail-error">올바른 이메일 형식이 아닙니다.</div>
        	<div class="error-message hide error" id="regMail-error2">이메일 주소는 50자 이하여야 합니다.</div>

        <button type="submit" value="가입하기" id="submitBtn">가입하기</button>
      </form:form>
      <p>
        이미 계정이 있으신가요?
        <a href="#" id="sign-in" onclick="toggle()">로그인</a>
      </p>
    </div>
  </div>
  <!-- 로그인 -->
  <!--
  	✔회원가입시 닉네임 입력 받기 -> mapper 추가, 회원가입 성공
  	✔회원가입 완료되면 성공 alert 띄우기
  	🔲로그인실패시 실패 alert 띄우기
  	✔아무것도 입력하지 않고 회원가입 버튼 누르면 500에러 발생 조치할 것 ->required
  	✔회원가입시 이메일 중복 체크 추가하기 
  	✔회원가입시 유효성 통과 못하면 가입하기 버튼 비활성화 -> 항목마다 submitBtn.disabled = true; 걸어주었다.
    -->
  <div class="right">
    <img src="//unsplash.it/600" />
    <div class="sign-in">
      <h1>로그인</h1>
      <c:url value="/login" var="loginUrl" />
      <form:form name="f" action="${loginUrl}" method="POST">
        <input type="text" id="id" name="username" placeholder="ID" required />
        <input type="password" id="password" name="password" placeholder="Password" />
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
        <div class="error-message hide error" id="">잘못된 비밀번호입니다.</div>
		 <div align="right">
		  <a href="#" onclick="toggle()">가입하기</a>
		  <script>${msg}</script>
		  <span class="button-separator">|</span>
		  <a href="#" onclick="openPopup(event)">ID/PW 찾기</a>
		 </div>
        
		  <button type="submit" value="로그인" id="loginSubmitBtn" align="center">로그인</button>

	     <hr class="hr-how" />
		 <!-- 네이버 로그인 창으로 이동 -->
	 	 <div id="naver_id_login" style="text-align:center">
	 	 	<a href="${naverUrl}">
		 		<img width="45" src="<%=request.getContextPath() %>/resources/icons/btnG_아이콘사각.png" alt="naver login logo"/>
		 	</a>
		 </div>
      </form:form>
    </div>
    
  </div>

</section>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/login.js"></script>
<script>
//아이디 중복체크
let isIdChecked = "0";

$('#userid').blur(function(){
	$.ajax({
		type:"POST",
		url:"<%=request.getContextPath()%>/member/checkSignup",
		data:{
			userId: $('#userid').val()
		},
		success:function(data){
			if($.trim(data)=="y"){
				if($('#userid').val()!=''){
					isIdChecked = "y";
					$("#idcheck-error").remove();
				}
			} else{
				if($('#userid').val()!=''){
					isIdChecked = "n";
					$("#idcheck-error").html("중복된 아이디입니다.");
					$("#idcheck-error").removeClass("hide");
					$('#userid').focus();
				}
			}
		}
	})
})
//회원가입 시 이메일 중복체크
let isEmailChecked = 0;

$('#email').focusout(function(){
	$.ajax({
		type:"POST",
		url:'${pageContext.request.contextPath}/member/checkEmail',
		data:{
			email: $('#email').val()
		},
		success:function(data){
			console.log(data);
			if($.trim(data)=="y"){
				if($('#email').val()!=''){
					isEmailChecked = "y";
					alert("사용 가능한 이메일입니다.");
				}
			} else{
				if($('#email').val()!=''){
					isEmailChecked = "n";
					alert("중복된 이메일입니다.");
				}
			}
		}
	});//ajax	
})
//TODO: 로그인시 비밀번호 확인
	function openPopup(event) {
		let newPopup;
		event.preventDefault();
		let openUrl = "${pageContext.request.contextPath}/member/findid";
		let popOption = "width=700,height=700";
		
		newPopup = window.open(openUrl, "_blank", popOption);
	}
	function closePopup(){
		newPopup.close();
	}

</script>
</body>
</html>
