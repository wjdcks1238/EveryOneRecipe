<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose >
		<c:when test="${following ne null}">
			<title>팔로잉 목록</title>
		</c:when>
		<c:when test="${follower ne null}">	
			<title>팔로워 목록</title>
		</c:when>
	</c:choose>
</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>

<style type="text/css">
.wrapper{
	min-height: 80vh;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>


<div  class="container wrapper">

		<div class="row ">
			<div class="col-md-2 col-xs-12">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="#">비밀번호 변경</a></li>
				</ul>
			</div>
			
			<div class="col-md-8 col-md-offset-2 col-xs-12">
			  <div class="card">
			    <div class="card-header">
			      <h5 class="mb-0">
			        <c:choose>
			          <c:when test="${following ne null}">
			            <span>팔로잉 목록</span>
			          </c:when>
			          <c:when test="${follower ne null}">
			            <span>팔로워 목록</span>
			          </c:when>
			        </c:choose>
			      </h5>
			    </div>
			    <div class="card-body">
			      <c:choose>
			        <c:when test="${following ne null}">
			          <ul class="list-group">
			            <c:forEach var="fw" items="${following}">
			              <li class="list-group-item d-flex justify-content-between align-items-center">
							  <div class="media">
							    <img style="width: 30px; height: 30px; border-radius: 50%;object-fit: cover;" src="${fw.PROFILEURL}" class="mr-3 rounded-circle" alt="프로필 이미지">
							    <div class="media-body">
							      <a href="<%=request.getContextPath() %>/member/info/${fw.USERID}" id="${fw.USERID}">
							        ${fw.USERID}
							      </a>
							      <span class="nickname ml-2">[${fw.NICKNAME}]</span>
							    </div>
							  </div>
							  <span>팔로워: ${fw.FOLLOWERCNT}</span>
						  </li>
			            </c:forEach>
			          </ul>
			        </c:when> 
			        <c:when test="${follower ne null}">
			          <ul class="list-group">
			            <c:forEach var="fw" items="${follower}">
			              <li class="list-group-item d-flex justify-content-between align-items-center">
							  <div class="media">
							    <img style="width: 30px; height: 30px; border-radius: 50%;object-fit: cover;" src="${fw.PROFILEURL}" class="mr-3 rounded-circle" alt="프로필 이미지">
							    <div class="media-body">
							      <a href="<%=request.getContextPath() %>/member/info/${fw.USERID}" id="${fw.USERID}">
							        ${fw.USERID}
							      </a>
							      <span class="nickname ml-2">[${fw.NICKNAME}]</span>
							    </div>
							  </div>
							  <span>팔로워: ${fw.FOLLOWERCNT}</span>
						  </li>
			            </c:forEach>
			          </ul>
			        </c:when>
			      </c:choose>
			    </div>
			  </div>
			</div>
			
			
		</div>
	</div>


<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>