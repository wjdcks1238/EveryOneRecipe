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
<sec:authorize var="loggedIn" access="isAuthenticated()" />

<div  class="listrecent">
	<div class="row post-top-meta">
		<div class="col-md-9">
		<input type="text" name="keyword" style="height: 60px; width: 100%" value="${keyword }">
		</div>
		<div class="col-md-3">
		<button type="button" style="height: 60px; width: 60%">검색</button>
		</div>
	</div>
	<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach items="${postList }" var="list" varStatus="stqatus">
		<div class="col-md-3">
			<div class="card">
				<a href="<%=request.getContextPath() %>/board/list/${list.postId}">
					이미지 삽입 예정.
				</a>
				<div class="card-block">
					<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></h2>
					<h4 class="card-text">${list.content }</h4>
					<div class="wrapfooter">
						<span class="meta-footer-thumb">
							프로필이미지
							<img class="author-thumb" alt="" src="${list.profileUrl }">
						</span>
						<span class="author-meta">
							<span class="post-name">${list.nickname }</span>
							<span class="post-date">${list.createDate }</span><span class="post-read"></span>
						</span>
						<span class="post-read-more">
							<c:if test="${loggedIn}">
											<c:set var="user" value="<%=request.getUserPrincipal().getName() %>"/>
											<c:if test="${user ne list.userId}">
												<div id="follow">
													<c:if test="${isFollowed }">
														 <img id="followBtn" style="cursor: pointer;" alt="" width="30px" src="<%=request.getContextPath()%>/resources/icons/added.png">
													</c:if>
													<c:if test="${isFollowed eq false }">													
														 <img id="followBtn" style="cursor: pointer;" alt="" width="30px" src="<%=request.getContextPath()%>/resources/icons/add.png">
														 
													</c:if>
		
												</div>
											</c:if>
							</c:if>
							<img class="svgIcon-use" id="bookmarkBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addB.png">					
							<img class="svgIcon-use" id="bookmarkBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addL.png">					
						</span>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<div class="list">
</div>
 
<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>


	
</body>
</html>