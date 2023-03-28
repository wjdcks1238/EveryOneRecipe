<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%=request.getContextPath()%>assets/img/favicon.ico">
<title>Mediumish - A Medium style template by WowThemes.net</title>
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Fonts -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/mediumish.css" rel="stylesheet">
</head>
<body>

<!-- Begin Nav
================================================== -->
<nav class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="container">
	<!-- Begin Logo -->
	<a class="navbar-brand" href="<%=request.getContextPath()%>/">
	<img src="<%=request.getContextPath()%>/resources/mediumish/assets/img/logo.png" alt="logo">
	</a>
	<!-- End Logo -->
	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		<!-- Begin Menu -->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active">
				<a class="nav-link" href="<%=request.getContextPath()%>/board/list">내 게시글 <span class="sr-only">(current)</span></a>
		    </li>
	  		<li class="nav-item">
	  <c:choose>
		  <c:when test="${pageContext.request.userPrincipal != null and pageContext.request.isUserInRole('MEMBER')}">
		    <li class="nav-item ">
	        	<a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내정보</a>
		    </li>
		    <li class="nav-item">
	        	<a class="nav-link" href="<%=request.getContextPath()%>/member/profile">프로필관리</a>
	        </li>
		    <li class="nav-item">
		      <form class="form-logout" method="post" action="/logout">
		        <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token} ">
		        <a class="nav-link btn" href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">로그아웃</a>
		      </form>
		      <form id="logout-form" action="${pageContext.request.contextPath}/logout" method="post" style="display: none;">
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		      </form>
		    </li>
		  </c:when>
		  <c:otherwise>
		    <li class="nav-item">
		      <a href="<%=request.getContextPath() %>/member/login" class="nav-link btn">로그인</a>
		    </li>
		  </c:otherwise>
	 </c:choose>
	  		</li>
		    <li class="nav-item">
		     <a class="nav-link" href="<%=request.getContextPath()%>/resources/mediumish/author.html">Author</a>
		    </li>
		    </ul>
		
		<sec:authorize var="loggedIn" access="isAuthenticated()" />
	
		<!-- End Menu -->
		<!-- Begin Search -->
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search">
			<span class="search-icon"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M20.067 18.933l-4.157-4.157a6 6 0 1 0-.884.884l4.157 4.157a.624.624 0 1 0 .884-.884zM6.5 11c0-2.62 2.13-4.75 4.75-4.75S16 8.38 16 11s-2.13 4.75-4.75 4.75S6.5 13.62 6.5 11z"></path></svg></span>
		</form>
		<!-- End Search -->
	</div>
</div>
</nav>
<!-- End Nav
================================================== -->

<!-- Begin Top Author Page
================================================== -->
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 col-md-offset-2">
			<div class="mainheading">
				<div class="row post-top-meta authorpage">
					<div class="col-md-10 col-xs-12">
						<h1>${memberDto.userId }</h1>
						<span class="author-description">Founder of <a target="_blank" href="https://www.wowthemes.net">WowThemes.net</a> and creator of <strong>"Mediumish"</strong> theme that you're currently previewing. I professionally develop premium themes, templates & scripts since the Apocalypse (2012). You can reach me out on the social links below.</span>
						<div class="sociallinks"><a  target="_blank" href="https://www.facebook.com/wowthemesnet/"><i class="fa fa-facebook"></i></a> <span class="dot"></span> <a target="_blank" href="https://plus.google.com/s/wowthemesnet/top"><i class="fa fa-google-plus"></i></a></div>
						<a target="_blank" href="https://twitter.com/wowthemesnet" class="btn follow">수정하기</a>
					</div>
					<div class="col-md-2 col-xs-12">
						<img alt="" src="${memberDto.profileUrl }">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Top Author Meta
================================================== -->


<!-- Begin Footer
================================================== -->
<div class="container">
	<div class="footer">
	  <p class="pull-left">
	    Copyright &copy; 2017 Your Website Name
	  </p>
	  <p class="pull-right">
	    Mediumish Theme by <a target="_blank" href="https://www.wowthemes.net">WowThemes.net</a>
	  </p>
	<div class="clearfix"></div>
	</div>
</div>
<!-- End Footer
================================================== -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/resources/mediumish/assets/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/mediumish/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
