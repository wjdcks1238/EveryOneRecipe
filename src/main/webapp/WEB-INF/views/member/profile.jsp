<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="profile" method="post" enctype="multipart/form-data">
		<input type="text" name="id" value="${memberDto.userId }" readonly="readonly">
		<input type="text" name="nickName" value="${memberDto.nickName }">
		
		<input type="file" name="report" placeholder="첨부파일">
		<br>
		<button type="submit">사진 등록</button>
	</form>
</body>
</html>