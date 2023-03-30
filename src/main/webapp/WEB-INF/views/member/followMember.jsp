<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose >
	<c:when test="${following ne null}">
		<title>팔로잉 목록</title>
	</c:when>
	<c:when test="${follower ne null}">	
		<title>팔로워 목록</title>
	</c:when>
</c:choose>

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
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-1 bd-sidebar">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="#">내 정보 보기</a></li>
				</ul>
			</div>
				<div class="container">
		
				
					<c:choose >
						<c:when test="${following ne null}">
						팔로잉 목록
						<div>
							${following}
						</div>
						</c:when>
						<c:when test="${follower ne null}">
						팔로워 목록	
						<div>
							${follower}
						</div>
						</c:when>
					</c:choose>
				

					
				</div>
		</div>
	</div>



</body>
</html>