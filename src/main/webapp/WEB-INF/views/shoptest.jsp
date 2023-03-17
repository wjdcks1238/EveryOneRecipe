<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<style>
img{
widht: 100px;
height: 100px;
}
</style>
</head>
<body>
<h1>test</h1>

<c:forEach var="search" items="${query}">
상품명: ${search.title}
<br>
<img src="${search.image}" />
<br>
가격: ${search.lprice}
<br>
주소: <a href="${search.link}">${search.link}</a>
<hr>	
</c:forEach>

</body>
</html>

