<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose >
		<c:when test="${following ne null}">
			<title>팔로잉 목록</title>
		</c:when>
		<c:when test="${follower ne null}">	
			<title>팔로워 목록</title>
		</c:when>
	</c:choose>
</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>


<div  class="container">

		<div class="row ">
			<div class="col-md-2 col-xs-12">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="#">비밀번호 변경</a></li>
				</ul>
			</div>
			
			<div class="col-md-8 col-md-offset-2 col-xs-12">
		
				
					<c:choose >
						<c:when test="${following ne null}">
						팔로잉 목록
						<c:forEach var="fw" items="${following}">
							<div>
								<a href="<%=request.getContextPath() %>/member/info/${fw}">${fw}</a> 
							</div>
						</c:forEach>
						</c:when>
						<c:when test="${follower ne null}">
						팔로워 목록
						<c:forEach var="fw" items="${follower}">	
							<div>
								<a href="<%=request.getContextPath() %>/member/info/${fw}">${fw}</a> 
							</div>
						</c:forEach>
						</c:when>
					</c:choose>
			</div>
		</div>
	</div>


<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>