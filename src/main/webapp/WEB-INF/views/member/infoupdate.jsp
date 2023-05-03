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
<title>모두의 레시피</title>

<%@ include file="/WEB-INF/views/css_import.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
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
	padding: 7px 60px 7px 120px;
	border-top: 2px solid rgb(51, 51, 51);
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
						href="<%=request.getContextPath()%>/member/bookmark/1">북마크</a></li>
					<li class="nav-item "><a class="nav-link"
						href="<%=request.getContextPath()%>/member/like/1">좋아요</a></li>
				</ul>

			</div>


			<div class="col-md-10 col-md-offset-2 col-xs-12">
				<div class="row">
					<div class="col-8">
					
					
							<div>
								<h5>개인 정보 수정</h5>
							</div>
							<div>
								<h6>비밀번호 재확인</h6>
							</div>
							<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
							<div class="inputdiv">
								<div>
									<div>
										<label>아이디</label>
									</div>
									<div>
										<input type="text" name="userId" value="${memberDto.userId }"
											readonly="${memberDto.userId }" class="form-control" style="width: 300px">
									</div>
								</div>
								<div>
									<div>
										<label>비밀번호</label>
									</div>
									<div>
										<input type="password" name="password" value="${memberDto.password }" placeholder="현재 비밀번호를 입력해주세요." class="form-control" style="width: 300px">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
									</div>
									
								</div>
							</div>
							<div align="center">
								<button id="passwordchk" type="submit" class="btn mt-3">확인</button>
							</div>
						
					</div>
				</div>


			</div>
		</div>
	</div>




	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<%@ include file="/WEB-INF/views/js_import.jsp"%>

	<script>
	$(document).on("click", "#passwordchk", function() {
	    var password = $.trim($("input[name=password]").val());
	    if (password.length === 0) {
	        alert("비밀번호를 입력해주세요.");
	        return;
	    }
	    var result;
	    
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/member/infoupdateAjax",
	        data: { "password": password },
	        dataType: "text",
	        success: function(data) {
	        	
	            result = data;
	            
	            if (result === "success") {
	                location.href = "<%=request.getContextPath()%>/member/modify";
	            } else {
	                alert("비밀번호가 일치하지 않습니다.");
	            }
	        },
	        error: function(xhr, textStatus, errorThrown) {
	            console.log("Ajax 요청 실패: " + textStatus + ", " + errorThrown);
	        }
	    });
	});
	</script>
</body>
</html>