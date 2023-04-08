<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>검색 결과</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<!-- Fonts -->
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="container">
	<div class="row post-top-meta">
		<div class="col-md-9">
		<input type="text" name="keyword" style="height: 60px; width: 100%" value="${keyword }">
		</div>
		<div class="col-md-3">
		<button type="button" style="height: 60px; width: 60%">검색</button>
		</div>
	</div>
	<div>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>