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
</body>
</html>