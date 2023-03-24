<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/sample/admin page</h1>

<p>principal : <sec:authentication property="principal" /></p>
<p>MemberVO : <sec:authentication property="principal.members"/></p>
<p>사용자 이름 : <sec:authentication property="principal.members.nickname"/></p>
<p>사용자 아이디 : <sec:authentication property="principal.userid"/></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.members.authority"/></p>

<form action="/customLogout" method="post">
	<input type="submit" value="Logout">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</body>
</html>