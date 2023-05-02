<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize var="loggedIn" access="isAuthenticated()" />
<c:set var="uName" value="${pageContext.request.userPrincipal.name }"></c:set>

<!-- Begin Nav ================================================== -->
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
	
		  		<li class="nav-item">
			  	<%
	  	  			if(request.getUserPrincipal() != null && request.isUserInRole("MEMBER")){;
	  	  		%>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/board/list">전체 게시글</a>
			    </li>
			    <li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/board/posting">레시피 작성</a>
			    </li>
			    <li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보</a>
			    </li>
			    <li class="nav-item">
			      <form class="form-logout" method="post" action="/logout">
			        <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token} ">
			        <a class="nav-link" href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">로그아웃</a>
			      </form>
			      <form id="logout-form" action="${pageContext.request.contextPath}/logout" method="post" style="display: none;">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			      </form>
			    </li>
			  <%} else if(request.getUserPrincipal() == null) {%>
			    <li class="nav-item">
			      <a href="<%=request.getContextPath() %>/member/login" class="nav-link btn">로그인</a>
			    </li>
			  <%} else{ %>
			    <sec:authorize access="hasRole('ADMIN')">
			    <li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/board/posting">레시피 작성</a>
			    </li>
			    <li class="nav-item">
			      <a href="<%=request.getContextPath() %>/logout" class="nav-link">로그아웃</a>
			    </li>
				<li class="nav-item ">
					<a class="nav-link" href="<%=request.getContextPath()%>/admin">관리자모드</a>
				</li>
				
				</sec:authorize>
			  <%} %>
		  		</li>
			</ul>
			<sec:authorize var="loggedIn" access="isAuthenticated()" />
			<!-- End Menu -->
			<!-- Begin Search -->
			<form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/board/search"  method="get">
				<input id="keyword" name="keyword" class="form-control mr-sm-2" type="text" placeholder="Search">
				<span class="search-icon"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M20.067 18.933l-4.157-4.157a6 6 0 1 0-.884.884l4.157 4.157a.624.624 0 1 0 .884-.884zM6.5 11c0-2.62 2.13-4.75 4.75-4.75S16 8.38 16 11s-2.13 4.75-4.75 4.75S6.5 13.62 6.5 11z"></path></svg></span>
			</form>
			<!-- End Search -->
		</div>
	</div>
</nav>
<!-- End Nav-->
<script>
	$(".search-icon").click(function() {
		var keyword = $("#keyword").val();
		location.href="${pageContext.request.contextPath}/board/search?keyword=" + encodeURIComponent(keyword);
	});
</script>
