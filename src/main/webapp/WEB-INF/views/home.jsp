<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>


	<sec:authorize access="isAnonymous()">
	<p><a href="/login/loginForm.do">로그인</a></p>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>
	</sec:authorize>
	
	
	<h3>
		[<a href="<c:url value="/logout" />">로그아웃</a>]
		[<a href="<c:url value="/board/list" />">게시판</a>]
		[<a href="<c:url value="/admin/home" />">관리자 홈</a>]
	</h3>
</body>
</html>
