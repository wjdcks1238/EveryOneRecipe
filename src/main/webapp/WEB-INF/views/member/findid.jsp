<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계정찾기</title>
	    <!-- Custom fonts for this template -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findAccount.css ">
    
	<style>
		button {
			background-color: #4CAF50;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
	</style>
</head>
<body>

	  <section>
		  <div class="findAccount-01">
			  <div class="findAccount-02">
				 <h1 class="h3 mb-3 text-gray-800 text-center mt-3">비밀번호 찾기</h1>
				  <div class="계정찾기 알맹이">
					  <div class="findEmail">
					  	<p>가입한 이메일 주소를 입력해주세요.</p>
					  </div>
					  <div class="findInput">
						  <div class="findInput-02">
						  	<input type="email" class="inputEmail" name="email" placeholder="이메일">
						  	<button type="button">확인</button>
						  </div>
					  </div>
					  <button class="emailBtn">인증코드 보내기</button>
					  <div class="cs">
					  	<p>회원가입 시 입력한 정보가 기억나지 않는다면?</p>
					  	<a href="tel:1234-5678" class="문의하기">고객센터 문의하기(1234-5678)</a>
					  </div>
				  </div>
			  </div>
		  </div>
	  </section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstl/1.2/jstl.min.js"></script>
<script>

	$(document).on("click", "#findInfo", function() {
		var email = $.trim($("input[name=email]").val());
	
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/member/findidAjax",
			data:{
				"email": email
			},
			success:function(data){
				alert("비밀번는 "+"'"+data+"'"+"입니다.");
			}
		});//ajax	
	
	});
</script>


</body>


</html>
