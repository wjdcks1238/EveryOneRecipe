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
		<a href="<c:url value="/login" />">로그인</a>
	</sec:authorize>
 
	<sec:authorize access="isAuthenticated()">
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="로그아웃" />
	</form:form>
	</sec:authorize>

</body>
</html>
