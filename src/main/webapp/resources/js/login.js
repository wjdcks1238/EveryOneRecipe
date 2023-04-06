function toggle() {
  section = document.querySelector("section");
  section.classList.toggle("active");
}
//유효성 검사
function validation() {
	//변수에 저장
	let userid = document.getElementById("userid");
	let password = document.getElementById("password");
	let email = document.getElementById("email");
	let checkpw = document.getElementById("checkpw");
	let error = document.getElementById("error");
	//정규식
	let regId ="^[a-z0-9]{5,14}$";
	let regPass ="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$";
	let regMail ="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
	
	
	//아이디 확인
	if(userid.value == "") {
		error.innerHTML = "아이디를 입력하세요.";
			return false;
	} else if (!regId.test(userid.value)){
		error.innerHTM ="공백없이 영어 소문자, 숫자 조합 5자~14자 이하로 입력해주세요.";
		return false;
	}
	
	if(password.value == ""){
		error.innerHTML = "비밀번호를 입력하세요.";
		return false;
	} else if(!regPass.test(password.value)){
		error.innerHTML = "공백없이 영어 소문자, 숫자 조합 5자~14자 이하로 입력해주세요.";
		return false;
	} else if(password.value == userid.value){
		error.innerHTML = "아이디와 동일한 비밀번호를 사용할 수 없습니다.";
		return false;
	}
	
	if(checkpw.value !== password.value){
		error.innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	}
	
	if(mail.value.length == 0){
		error.innerHTML = "이메일을 입력해주세요.";
		return false;
	} else if(!regMail.test(email.value)){
		error.innerHTML = "올바른 이메일 형식이 아닙니다.";
		return false;		
	} else if(mail.value.length > 50){
		error.innerHTML = "이메일 주소는 50자 이하여야 합니다.";
		return false;		
	}
}




////이메일 유효성 검사
//function vaildateEmail(){
//	  const emailInput = document.getElementById("email");
//	  const emailError = document.getElementById("emailError");
//	  const email = emailInput.value.trim();
//	  
//	  const isValidEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email);
//	  
//	  if (isValidEmail) {
//	    emailError.innerHTML = "";
//	    emailInput.classList.remove("error");
//	  } else {
//	    emailError.innerHTML = "올바른 이메일 형식이 아닙니다.";
//	    emailInput.classList.add("error");
//	  }
//	  if (email.length > 50) {
//		  emailError.innerHTML = ;
//		  emailInput.classList.add("error");
//			} else {
//				//추가해야함
//		}
//	  
//}
////아이디 정규식으로 유효성 검사
//function checkId(){
//	let regId ="^[a-z0-9]{5,14}$";
//	if(!regId.test(password)){
//		alert("공백없이 영어 소문자, 숫자 조합 5자~14자 이하로 입력해주세요.")
//		return false;
//	}
//	
//	
//}
////비밀번호 정규식으로 유효성 검사
//function passwordChk(){
//	let regPass ="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$";
//	if(!regPass.test(password)) {
//		alert("공백없이 영문, 숫자, 특수문자 조합으로 8~16자 입력해주세요")
//	}
//}
//
//
