<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>프로필 수정</title>

<link rel="icon" href="<%=request.getContextPath()%>/resources/mediumish/assets/img/favicon.ico">
<!-- Fonts -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/mediumish.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css">
<style type="text/css">
.navbar{
	padding-left:0;
}

</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-1 bd-sidebar">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="#">비밀번호 변경</a></li>
				</ul>
			</div>
				<div class="container">
				
					<form action="update" method="post" enctype="multipart/form-data">
						<label>아이디</label>
						<input type="text" name="id" value="${memberDto.userId }" readonly="readonly">
						<label>닉네임</label>
						<input type="text" name="nickName" value="${memberDto.nickName }">
						<label>프로필 설명</label>
						<input type="text" name="profile" value="${memberDto.profile }">
						
						
						<label>프로필 사진</label>
						<img alt="../resources/tempProfileImg/food.svg" src="${memberDto.profileUrl }">
						<input type="file" name="report" placeholder="첨부파일">
						<br>
						<button type="submit">프로필 업데이트</button>
					</form>
					<!-- 
					<img  width="300" alt="" src="../resources/tempProfileImg/food.svg">
					 -->
				
					
				</div>
		</div>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>