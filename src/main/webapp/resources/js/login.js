'use strict';
let section;
function toggle() {
  section = document.querySelector("section");
  section.classList.toggle("active");
}
//유효성 검사
//아이디 입력창 값 가져오기
let inputUserId = document.getElementById("userid");
//아이디 정규식(공백없이 영어 소문자, 숫자 조합 5자~14자 이하)
let regId = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,14}$/;
//아이디 중복확인
let idcheck = document.getElementById("idcheck");
//실패 메시지
let useridError = document.getElementById("userid-error");
let useridRegIdError = document.getElementById("regid-error");
let idcheckError = document.getElementById("idcheck-error");
//비밀번호
let inputPassword = document.getElementById("password");
let checkpw = document.getElementById("checkpw");
//비밀번호 정규식(공백없이 영어, 숫자, 특수문자(!,@,#)조합하여 8자 이상 16자 이하)
let regPass = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
let regPasswordError = document.getElementById("regPassword-error");
let passwordCheckError = document.getElementById("passwordCheck-error");
//이메일
let inputEmail = document.getElementById("email");
//이메일 정규식
let regMail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
let emailError = document.getElementById("email-error");
let regEmailError = document.getElementById("regMail-error");
let regEmailError2 = document.getElementById("regMail-error2");

// 아이디 확인
inputUserId.onkeyup = function(){
	// 값이 입력된 경우
	if (inputUserId.value === "") {
		useridError.classList.remove('hide');
		useridRegIdError.classList.add('hide');
	} else {
		useridError.classList.add('hide');
		// 정규식 검사
		if (!regId.test(inputUserId.value)) {
			useridRegIdError.classList.remove('hide');
		} else {
			useridRegIdError.classList.add('hide');
		}
	}
}
// 비밀번호 유효성 확인
inputPassword.onkeyup = function(){
	if(inputPassword.value === ""){
		regPasswordError.classList.remove('hide');
		passwordCheckError.classList.add('hide');
	} else {
		regPasswordError.classList.add('hide');
		if(!regPass.test(inputPassword.value)){
			regPasswordError.classList.remove('hide');
		} else {
				passwordCheckError.classList.remove('hide');
		}
	}
}
// 비밀번호 일치 확인
checkpw.onkeyup = function(){
	if(inputPassword.value !== checkpw.value ){
		passwordCheckError.classList.remove('hide');
	} else {
		passwordCheckError.classList.add('hide');
	}
}
//이메일 확인
inputEmail.onkeyup = function(){
	if(inputEmail.value === ""){
		emailError.classList.remove('hide');
		emailError.classList.add('hide');
	}else{
		if(!regMail.test(inputEmail.value)){
			regEmailError.classList.remove('hide');
		}else{
			if(inputEmail.value.length > 50){ // 수정: 이메일 길이가 50 초과인 경우 처리
				regEmailError2.classList.remove('hide');
			}else{
				regEmailError2.classList.add('hide');
			}
			regEmailError.classList.add('hide');
		}
	}
}
//유효성 체크 통과 못하면 가입버튼 비활성
function submitHandler(event){
	event.preventDefault();
	if(!inputEmail()) return;
	document.getElementById("submitBtn").removeAttribute("disabled", false);
	document.getElementById("signupForm").submit();
}

//TODO: 로그인시 비밀번호 확인

