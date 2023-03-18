<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성일</td>
		</tr>

		<tr>
			<td>${post.postId }</td>
			<td>${post.foodName }</td>
			<td>${post.nickname }</td>
			<td>${post.content }</td>
			<td>${post.createDate }</td>
		</tr>
</table>

<div>
	<button>게시글 수정</button>
</div>
</body>
</html>