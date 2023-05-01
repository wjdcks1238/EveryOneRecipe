<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>개인정보 수정</title>

<%@ include file="/WEB-INF/views/css_import.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/modify.js"></script>
<style>
.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 600px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.font {
	font-family: serif, sans-serif;
	font-size: 14px;
	color: #333;
}

.inputdiv {
	border-top: 2px solid rgb(81, 81, 81);
	border-bottom: 1px solid rgb(221, 221, 221);
}

.error {
	font-size: 13px;
	color: red;
	font-weight: 500;
}

.hide {
	display: none;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div class="container">
		<div class="row">

			<div class="col-md-2 col-xs-12">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link"
						href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link"
						href="<%=request.getContextPath()%>/member/infoupdate">개인정보 수정</a></li>
					<li class="nav-item "><a class="nav-link"
						href="<%=request.getContextPath()%>/member/bookmark">북마크한 게시물</a></li>
					<li class="nav-item "><a class="nav-link"
						href="<%=request.getContextPath()%>/member/like">좋아요 표시한 게시물</a></li>
				</ul>

			</div>


			<div class="col-md-10 col-md-offset-2 col-xs-12">
				<div class="row">
					<div class="col-8">
						<form id="updateForm">
							<div>
								<h5>개인 정보 수정</h5>
							</div>
							<div class="inputdiv">
								<div class="row">
									<div class="col-sm-4">
										<label>아이디</label>
									</div>
									<div class="col-sm-4">
										<input type="text" name="userId" value="${memberDto.userId }"
											readonly="${memberDto.userId }">
									</div>
									<div class="colsm-4">여기도 나눠진 구역</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<label>비밀번호</label>
									</div>
									<div class="col-sm-4">
										<input type="password" name="password"
											value="${memberDto.password }" placeholder="현재 비밀번호를 입력해주세요.">
									</div>
									<div class="col-sm-4">여기도 나눠진 구역</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<label>새 비밀번호</label>
									</div>
									<div class="col-sm-4">
										<input type="password" name="password" value=""
											placeholder="새 비밀번호를 입력해주세요.">
									</div>
									<div class="col-sm-4">여기도 나눠진 구역</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<label>새 비밀번호 확인</label>
									</div>
									<div class="col-sm-4">
										<input type="password" name="password" value=""
											placeholder="새 비밀번호를 다시 입력해주세요.">
									</div>
									<div class="col-sm-4">여기도 나눠진 구역</div>
								</div>
								<!-- 등록된 이메일이 표시됨
								1.가입시 등록된 이메일이 입력되어 있다면 중복확인 버튼 비활성화, 다른값 입력 후 등록된 이메일 재입력해도 비활성화
								2.이메일을 새로 입력하면 중복확인 활성화
								3.중복확인 버튼 누르면 이메일 유효성, DB중복 확인
								4.중복확인 버튼 누르지 않고 회원정보수정 버튼 누르면 alert창 띄움  -->
								<div class="row">
									<div class="col-sm-4">
										<label>이메일</label>
									</div>
									<div class="col-sm-4">
										<input type="email" name="email" value="${memberDto.email }"
											placeholder="이메일을 입력해주세요." id="emailInput">
									</div>
									<div class="col-sm-4">
										<button id="emailChkBtn">중복확인</button>
									</div>
								</div>
								<div class="error-message hide error" id="email-error">이메일을
									입력해주세요.</div>
								<div class="error-message hide error" id="regMail-error">올바른
									이메일 형식이 아닙니다.</div>
								<div class="error-message hide error" id="regMail-error2">이메일
									주소는 50자 이하여야 합니다.</div>
							</div>
							<div align="center">
								<button type="button" onclick="removeMember();">탈퇴하기</button>
								<button id="modifyBtn" type="submit">회원정보수정</button>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>




	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<%@ include file="/WEB-INF/views/js_import.jsp"%>

	<script>
	$(document).on("click","#modifyBtn", function(event) {
	    event.preventDefault();
	    
	    var password = $.trim($("input[name=password]").val());
	    var email = $.trim($("input[name=email]").val());
	    
	    console.log("~~~~~~~~~~~~~~입력된 암호:" + password);
	    if (password.length !== 0) {
	        $.ajax({
	            url: '<%=request.getContextPath()%>/member/modify',
	            type: 'POST',
	            data: {password: password, email: email}),
	            success:function(result){
	            	console.log("서버 응답:", result); 
	                if (result === "success") {
	                    console.log("어어 됐다??"+ password);
	                    location.href="<%=request.getContextPath()%>/member/modify";
												} else {
													alert("비밀번호가 일치하지 않습니다.");
												}
											},
											error : function() {
												alert("오류가 발생하였습니다. 다시 시도해주세요.");
											}
										});
							}
						});

		$("#emailInput").on("input", function() {
			$("#emailChkBtn").prop("disabled", false);
		});
		//이메일 정규식
		let regMail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
		let emailError = document.getElementById("email-error");
		let regEmailError = document.getElementById("regMail-error");
		let regEmailError2 = document.getElementById("regMail-error2");
		//이메일 확인
		emailInput.onkeyup = function() {
			if (emailInput.value === "") {
				emailError.classList.remove('hide');
				emailError.classList.add('hide');
			} else {
				if (!regMail.test(emailInput.value)) {
					regEmailError.classList.remove('hide');
				} else {
					if (emailInput.value.length > 50) { // 수정: 이메일 길이가 50 초과인 경우 처리
						regEmailError2.classList.remove('hide');
					} else {
						regEmailError2.classList.add('hide');
					}
					regEmailError.classList.add('hide');
				}
			}
		}
		//회원탈퇴
		function removeMember(){
			if(window.confirm("정말 탈퇴하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/login"
			}
		}
	</script>
</body>
</html>