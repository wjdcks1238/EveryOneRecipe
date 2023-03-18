<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1">
		<tr>
			<th>글번호</th>
			<th>닉네임 </th>
			<th>음식 이름</th>
			<th>음식 재료</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>

		<tr>
			<td>${post.postId }</td>
			<td>${post.nickname }</td>
			<td>${post.foodName }</td>
			<td>
				<c:forEach items="${post.ingredients }" var="ing" varStatus="status">
					${ing.ingredient } : ${ing.amount } /
				</c:forEach>
			</td>
			<td>${post.content }</td>
			<td>${post.createDate }</td>
		</tr>
</table>

<div>
	<a href="<%=request.getContextPath()%>/board/list/update/${post.postId }">게시글 수정</a>
</div>
</body>
</html>