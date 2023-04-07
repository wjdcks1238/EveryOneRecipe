<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchResult</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<style>
img{
widht: 150px;
height: 150px;
}
</style>
</head>
<body>
<div>
<ul style="padding-top: 10px;">
<c:forEach var="search" items="${query}">
<li style="display:inline-block; margin:0 7px 45px; float: left; width: 270px; height:240px; text-overflow: ellipsis;">
	<div>
	<img src="${search.image}" />
	</div>
	<div>	
	${search.title}
	</div>
	<div>
	${search.lprice}원
	</div>
<!--  주소: <a href="${search.link}">${search.link}</a>-->
</li>	
</c:forEach>
</ul>
</div>
</body>
</html>