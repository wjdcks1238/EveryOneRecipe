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

/* .disabled {
  background: aquamarine;
  text-decoration: white;
} */
.text-right {
  text-align: right;
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
						href="<%=request.getContextPath()%>/member/bookmark/1">북마크</a></li>
					<li class="nav-item "><a class="nav-link"
						href="<%=request.getContextPath()%>/member/like/1">좋아요</a></li>
				</ul>

			</div>


			<div class="col-md-10 col-md-offset-2 col-xs-12">
				<div class="row">
					<div class="col-12">
						<form id="updateForm">
							<div>
								<h5>개인 정보 수정</h5>
							</div>
							<div class="inputdiv">
								<div class="row">
									<div class="col-sm-3">
										<label>아이디</label>
									</div>
									<div class="col-sm-4">
										<input type="text" name="userId" value="${memberDto.userId }"
											readonly="${memberDto.userId }" class="form-control" style="width: 300px">
									</div>
									<div class="colsm-4"></div>
								</div>
								<!-- -- -- -- 비밀번호 -- -- --  -->
								<div class="row">
									<div class="col-sm-3">
										<label>비밀번호</label>
									</div>
									<div class="col-sm-4">
										<input type="password" name="prePassword" placeholder="현재 비밀번호를 입력해주세요." class="form-control" style="width: 300px">
									</div>
									<div class="col-sm-4"></div>
								</div>
								<!-- -- -- -- 새비밀번호 -- -- --  -->
								<div class="row">
									<div class="col-sm-3">
										<label>새 비밀번호</label>
									</div>
									<div class="col-sm-4">
										<input type="password" name="password" id="inputPassword"
											placeholder="새 비밀번호를 입력해주세요." class="form-control" style="width: 300px">
										<div class="error-message hide error" id="regPassword-error">공백없이 영어, 숫자, 특수문자(!,@,#)조합하여 8자 이상 16자 이하로 입력해주세요.</div>
											
									</div>
									<div class="col-sm-4"></div>
								</div>
								<!-- -- -- -- 새비밀번호 확인-- -- --  -->
								<div class="row">
									<div class="col-sm-3">
										<label>새 비밀번호 확인</label>
									</div>
									<div class="col-sm-4">
										<input type="password" name="password" id="checkpw"
											placeholder="새 비밀번호를 다시 입력해주세요." class="form-control" style="width: 300px">
										<div class="error-message hide error" id="passwordCheck-error">비밀번호가 일치하지 않습니다.</div>
									</div>
									<div class="col-sm-4"></div>
								</div>
								<!-- 등록된 이메일이 표시됨
								1.가입시 등록된 이메일이 입력되어 있다면 중복확인 버튼 비활성화, 다른값 입력 후 등록된 이메일 재입력해도 비활성화
								2.이메일을 새로 입력하면 중복확인 활성화
								3.중복확인 버튼 누르면 이메일 유효성, DB중복 확인
								4.중복확인 버튼 누르지 않고 회원정보수정 버튼 누르면 alert창 띄움  -->
								<div class="row">
									<div class="col-sm-3">
										<label>이메일</label>
									</div>
									<div class="col-sm-4">
										<input type="email" name="email" value="${memberDto.email }"
											placeholder="이메일을 입력해주세요." id="emailInput" class="form-control" style="width: 300px">
										<div class="error-message hide error" id="email-error">이메일을 입력해주세요.</div>
										<div class="error-message hide error" id="regMail-error">올바른 이메일 형식이 아닙니다.</div>
										<div class="error-message hide error" id="regMail-error2">이메일 주소는 50자 이하여야 합니다.</div>
									</div>
									<div class="col-sm-4" align="center">
											<button type="button" id="checkEmailBtn" class="btn mt-3" onclick="checkEmailBtn" >중복확인</button>
									</div>
											
								</div>
							</div>
							<div align="center">
								<button id="delete" type="button" onclick="removeMember();" class="btn mt-3" >탈퇴하기</button>
								<button id="modifyBtn" type="submit" class="btn mt-3">회원정보수정</button>
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
	//비밀번호 정규식(공백없이 영어, 숫자, 특수문자(!,@,#)조합하여 8자 이상 16자 이하)
	let regPass = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
	let regPasswordError = document.getElementById("regPassword-error");
	let passwordCheckError = document.getElementById("passwordCheck-error");
	// 비밀번호 유효성 확인
	document.addEventListener('DOMContentLoaded', function() {
	  // 비밀번호 유효성 확인
	  var inputPassword = document.querySelector('input[name=password]');
	
	  inputPassword.onkeyup = function() {
	    if (inputPassword.value === "") {
	      regPasswordError.classList.remove('hide');
	      passwordCheckError.classList.add('hide');
	    } else {
	      regPasswordError.classList.add('hide');
	      if (!regPass.test(inputPassword.value)) {
	        regPasswordError.classList.remove('hide');
	      } else {
	        passwordCheckError.classList.remove('hide');
	      }
	    }
	  }
	});

	// 비밀번호 일치 확인
	checkpw.onkeyup = function(){
		if(inputPassword.value !== checkpw.value ){
			passwordCheckError.classList.remove('hide');
		} else {
			passwordCheckError.classList.add('hide');
		}
	}

	//이메일 정규식
	let regMail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
	let emailError = document.getElementById("email-error");
	let regEmailError = document.getElementById("regMail-error");
	let regEmailError2 = document.getElementById("regMail-error2");
	
	const checkEmailBtn = document.getElementById('checkEmailBtn');
	
	// 이메일 확인
	emailInput.onkeyup = function() {
	  if (emailInput.value === "") {
	    emailError.classList.remove('hide');
	    regEmailError.classList.add('hide');
	    regEmailError2.classList.add('hide');
	    $("#modifyBtn").prop("disabled", true); // 개인정보수정 버튼 활성화
	  } else if (!regMail.test(emailInput.value)) {
	    emailError.classList.add('hide');
	    regEmailError.classList.remove('hide');
	    regEmailError2.classList.add('hide');
	    $("#modifyBtn").prop("disabled", false);
	  } else { // 입력값이 있고 이메일 형식이 맞다면
	    emailError.classList.add('hide');
	    regEmailError.classList.add('hide');
	    if (emailInput.value.length > 50) {
	      regEmailError2.classList.remove('hide');
	      $("#modifyBtn").prop("disabled", true); // 개인정보수정 버튼 활성화
	    } else {
	      regEmailError2.classList.add('hide');
	    }
	  }

	}
	//이메일 중복확인 버튼 누르면 중복체크
	let isEmailChecked = 0;
	
	$(document).on("click", "#checkEmailBtn", function(){
		var email = $.trim($("input[name=email]").val());
		
		 console.log("~~~~~~~~~~~~~~입력된 이메일  (☞ﾟヮﾟ)☞:" + email);
	if(email.length != 0){
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/member/checkEmail",
			data:{
				email: email
			},
			success:function(data){
				console.log(data);
				if($.trim(data)=="y"){
					if($('#email').val()!=''){
						isEmailChecked = "y";
						alert("사용 가능한 이메일입니다.");
						 $("#modifyBtn").prop("disabled", false); // 개인정보수정 버튼 활성화
					}
				} else{
					if($('#email').val()!=''){
						isEmailChecked = "n";
						alert("이미 사용중인 이메일입니다.");
						$('#email').focus();
						$("#modifyBtn").prop("disabled", true); // 개인정보수정 버튼 비활성화
					}
				}
			}
		});//ajax	
	}else{
		alert("이메일을 입력해주세요.");
		$("#modifyBtn").prop("disabled", true); // 개인정보수정 버튼 비활성화
	}
	})
	
	//비밀번호, 이메일 회원정보수정
	$(document).on("click","#modifyBtn", function(event) {
	    event.preventDefault();
	    
	    var prePassword = $.trim($("input[name=prePassword]").eq(0).val());
	    var newpassword = $.trim($("input[name=password]").eq(1).val());
	    var email = $.trim($("input[name=email]").val());

	    console.log("~~~~~~~~~~~~~~입력된 암호  (☞ ﾟヮﾟ)☞ : " + prePassword);
	    //✔이메일만 변경하고 싶으면 현재 비밀번호 입력 후 회원정보수정 성공해야함 --> newpassword eq(2)->(1)로 수정함, ajax data/prePassword : prePassword -> password : prepassword로 수정함
	    //✔입력되어 있는 이메일을 지운 뒤 회원정보수정 누르면 비밀번호 틀렸다는 alert 띄워짐
	    //✔이메일중복체크 하지 않아도 회원정보수정 버튼 진행됨; -> 이메일 정규식에 정보수청버튼 비활성화 추가함
	    //✔재비밀번호 입력 한 뒤 지우면 새비밀번호 div error 발생함, 현재비밀번호 정상적으로 입력하면  새비밀번호 div error 사라지고, 새비밀번호 확인 div error 발생함 -> id="password"를 id="prePassword"로 변경함
	    //✔비밀번호 입력 없이 회원정보수정 누르면 비밀번호를 입력해주세요 alert 띄우기 --> else if(prePassword.length == 0) 추가함
	    //✔아무것도 변경없이 회원정보수정 눌러도 변경이 완료되었다는 alert 띄우기
	    if (prePassword.length != 0) {
	    	console.log(prePassword);
	    	console.log(newpassword);
	    	
	        $.ajax({
	            url: '${pageContext.request.contextPath}/member/modify',
	            type: 'POST',
	            data: {password: prePassword, email: email, newpassword : newpassword},
	            success: function(result){
	            	console.log("아니이게뭐야 (☞ﾟヮﾟ)☞"+result);
	            	
	                if (result == 1) {
	                    console.log("어어 됐다??"+ prePassword);
	                    alert("개인 정보 수정이 완료되었습니다.");
	                    location.href="${pageContext.request.contextPath}/member/infoupdate";
	                    
					} else if(result == 0) {
						alert("비밀번호가 일치하지 않습니다.다시 입력해주세요");
						$("input[name=prePassword]").eq(0).focus();
						
					} else {//result : -1
						alert("정보 수정에 실패했습니다.");
						location.href="${pageContext.request.contextPath}/";
					}
				},  // success
				error : function() {
					alert("오류가 발생하였습니다. 다시 시도해주세요.");
				}
			});  //ajax
		}else if(prePassword.length == 0){
			alert("비밀번호를 입력해주세요");
	        $("input[name=prePassword]").eq(0).focus();
	        return;
			
		}// if (password.length !== 0)
	});  // $(document).on("click","#modifyBtn", function(event) {

		
	
	//회원탈퇴
	$(document).on("click", "#delete", function(){
		alert("정말 탈퇴 하시겠습니까?");
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/member/memberDelete",
	
			success:function(data){
				console.log(data);
				
			}
		});//ajax	
	
	})
	
	</script>
</body>
</html>