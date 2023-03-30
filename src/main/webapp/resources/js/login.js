function toggle() {
  section = document.querySelector("section");
  section.classList.toggle("active");
}
//이메일 유효성 검사
function vaildateEmail(){
	  const emailInput = document.getElementById("email");
	  const emailError = document.getElementById("emailError");
	  const email = emailInput.value.trim();
	  
	  const isValidEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email);
	  
	  if (isValidEmail) {
	    emailError.innerHTML = "";
	    emailInput.classList.remove("error");
	  } else {
	    emailError.innerHTML = "올바른 이메일 형식이 아닙니다.";
	    emailInput.classList.add("error");
	  }
	  if (email.length > 50) {
		  emailError.innerHTML = "이메일 주소는 50자 이하여야 합니다.";
		  emailInput.classList.add("error");
			} else {
				//추가해야함
		}
	  
}


