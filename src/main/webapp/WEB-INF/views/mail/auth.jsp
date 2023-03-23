<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/mail/auth" method="post">
		<input type="text" name="email" placeholder="이메일 입력">
		<br>
		<button type="submit">인증번호 발송</button>
	</form>
</body>
</html>