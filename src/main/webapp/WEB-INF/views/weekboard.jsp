<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간 테이블 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style>
a {
text-decoration: none;
}

</style>
</head>
<body>
<h5>주간 테이블(월요일~일요일)</h5>
<table class="table table-dark table-hover">
		<tr>
			<th>글 번호</th>
			<th>레시피명</th>
			<th>닉네임</th>
			<th>작성일자</th>
		</tr>	
		<c:forEach items="${weekboard}" var="list">
		<tr>
			<td>${list.postId }</td>
			<td><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></td>
			<td>${list.nickname }</td>
			<td>${list.dateWrite }</td>
		</tr>
		</c:forEach>
</table>

</body>
</html>