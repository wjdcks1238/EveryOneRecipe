function toggle() {
  section = document.querySelector("section");
  section.classList.toggle("active");
}
//유효성 검사
function validation() {
	//변수에 저장
	let userid = document.getElementById("userid");
	let password = document.getElementById("password");
	let checkpw = document.getElementById("checkpw");
	let email = document.getElementById("email");
	
	let useridError = document.getElementById("userid-error");
	let passwordError = document.getElementById("password-error");
	let passwordCheckError = document.getElementById("passwordCheck-error");
	let emailError = document.getElementById("email-error");
	//정규식
	let regId = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,14}$/;
	let regPass = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
	let regMail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
	
	document.getElementById("submitBtn").removeAttribute("disabled");
	
	// 아이디 중복 체크 구현해야함 
	
	
	// 아이디 확인
	if (userid.value == "") {
		useridError.innerHTML = "아이디를 입력하세요.";
		useridError.classList.remove("hide");
		return false;
	} else if (!regId.test(userid.value)){
		useridError.innerHTML = "공백없이 영어 소문자, 숫자 조합 5자~14자 이하로 입력해주세요.";
		useridError.classList.remove("hide");
		return false;
	} else {
		useridError.classList.add("hide");
	}
	
	// 비밀번호 확인
	if (password.value == ""){
		passwordError.innerHTML = "비밀번호를 입력하세요.";
		passwordError.classList.remove("hide");
		return false;
	} else if (!regPass.test(password.value)){
		passwordError.innerHTML = "영문 대/소문자, 숫자, 특수문자(@$!%*#?&) 중 3가지 이상을 조합하여 8~16자 이내로 입력해주세요.";
		passwordError.classList.remove("hide");
		return false;
	} else if (password.value == userid.value){
		passwordError.innerHTML = "아이디와 동일한 비밀번호를 사용할 수 없습니다.";
		passwordError.classList.remove("hide");
		return false;
	} else {
		passwordError.classList.add("hide");
	}
	
	// 비밀번호 확인
	if (checkpw.value !== password.value){
		passwordCheckError.innerHTML = "비밀번호가 일치하지 않습니다.";
		passwordCheckError.classList.remove("hide");
		return false;
	} else {
		passwordCheckError.classList.add("hide");
	}
	
	// 이메일 확인
	if (email.value.length == 0){
		emailError.innerHTML = "이메일을 입력해주세요.";
		emailError.classList.remove("hide");
		return false;
	} else if (!regMail.test(email.value)){
		emailError.innerHTML = "올바른 이메일 형식이 아닙니다.";
		emailError.classList.remove("hide");
		return false;		
	} else if (email.value.length > 50){
		emailError.innerHTML = "이메일 주소는 50자 이하여야 합니다.";
		emailError.classList.remove("hide");
		return false;		
	} else {
		emailError.classList.add("hide");
	}
	//유효성 체크 통과하지 못하면 가입하기 버튼 비활성화
	function submitHandler(event){
		event.preventDefault();
		if(!validation()) return;
		document.getElementById("signupForm").submit();
	}
}
//비밀번호 확인
$(function(){
	
})
