<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%=request.getContextPath()%>/resources/mediumish/assets/img/favicon.ico">
<title>every recipe</title>
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Fonts -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/mediumish.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>












<%@ include file="/WEB-INF/views/footer.jsp" %>


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/resources/mediumish/assets/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/mediumish/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/mediumish/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
