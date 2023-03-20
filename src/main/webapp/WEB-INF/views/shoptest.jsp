<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
</head>
<body>
<h1>네이버쇼핑 API</h1>
<form action="/everyrecipe/shopdata" method="GET">
	<input type="text" name="query">
	<button type="submit">검색</button>
</form>

</body>
</html>


