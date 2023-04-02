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
			<th>삭제여부</th>
			<th>조회수</th>
		</tr>	
		<c:forEach items="${weekboard}" var="list">
		<tr>
			<td>${list.postId }</td>
			<td><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></td>
			<td>${list.nickname }</td>
			<td>${list.dateWrite }</td>
			<td>${list.isDeleted }</td> 
			<td>${list.lookUp }</td>
		</tr>
		</c:forEach>
</table>


<div>
	<c:if test="${prev}">
		<a href="/everyrecipe/board/weekboardpage?num=${startPageNum - 1 }">이전</a>
	</c:if>
	
	<c:forEach begin="${startPageNum }" end="${endPageNum}" var="num">
		<span>
			<c:if test="${select != num }">
				<a href="/everyrecipe/board/weekboardpage?num=${num }">${num }</a>
			</c:if>
			<c:if test="${select == num }">
				<b>${num }</b>
			</c:if>
		</span>
	</c:forEach>
	<c:if test="${next }">
		<a href="/everyrecipe/board/weekboardpage?num=${endPageNum + 1 }">다음</a>
	</c:if>
</div>

</body>
</html>