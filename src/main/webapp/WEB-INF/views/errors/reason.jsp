<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<c:if test="${not empty notExist }">
	<title>${notExist }</title>
</c:if>
<c:if test="${not empty blinded }">
	<title>${blinded}</title>
</c:if>
<c:if test="${not empty deleted }">
	<title>${deleted}</title>
</c:if>

<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/detail.css" rel="stylesheet">
<style type="text/css">
.wrapper{
	min-height: 75vh;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container">
	<div class="wrapper mt-5">
	
		<c:if test="${not empty notExist }">
			<h2>
				${notExist }
			</h2>
		</c:if>
		<c:if test="${not empty blinded }">
			<h2>
				${blinded}
			</h2>
		</c:if>
		<c:if test="${not empty deleted }">
			<h2>
				${deleted}
			</h2>
		</c:if>
	</div>
 </div>


<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>