<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<c:forEach var="post" items="${rcpost }">
		${post.postId}
		<br>
		${post.nickname }
		<br>
		${post.content }
		<br>
		${post.foodName }
		<hr>
</c:forEach>
</div>
<div>
<c:forEach var="fw" items="${fwpost }">
	${fw.userId }
	<br>
	${fw.nickname }
	<br>
	${fw.foodName }
	<br>
	${fw.content }
</c:forEach>
</div>
</body>
</html>