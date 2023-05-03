<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>프로필 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
 <style>
.wrapper{
	min-height: 80vh;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="container wrapper">
	<div class="row">

		<div class="col-md-2 col-xs-12">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/infoupdate">개인정보 수정</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/bookmark/1">북마크</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/like/1">좋아요</a></li>
				</ul>
			
		</div>


		<div  class="col-md-8 col-md-offset-2 col-xs-12 table-responsive">
			<div style="min-height: 700px">
			<table class="table"  >
				<thead>
					<tr>
					    <th class="col-md-2 text-right">글 번호</th>
					    <th class="col-md-2 text-right">레시피명</th>
					    <th class="col-md-3 text-right">닉네임</th>
					    <th class="col-md-3 text-right">작성일자</th>
					    <th class="col-md-2 text-right">조회수</th>
				    </tr>
				</thead>
				<tbody>
				<c:forEach items="${bList}" var="list">
				    <tr>
				        <td class="text-right">${list.postId }</td>
				        <td class="text-right"><a href="<%=request.getContextPath() %>/board/list/${list.postId}" class="text-primary">${list.foodName }</a></td>
				        <td class="text-right">${list.nickname }</td>
				        <td class="text-right">${list.createDate }</td>
				        <td class="text-right">${list.lookUp }</td>
				    </tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
				<c:choose>
					<c:when test="${pageInfo.currentPage eq pageInfo.startPage }">
					<li class="page-item">
						<a aria-disabled="true" class="page-link">prev</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a class="page-link"  href="<%=request.getContextPath()%>/member/bookmark/${pageInfo.currentPage-1}">prev</a>
					</li>	
					</c:otherwise>
				</c:choose>
			 
			    <c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="list"  >
				    <li class="page-item ${list eq pageInfo.currentPage ? 'active' : '' }"><a class="page-link" href="<%=request.getContextPath()%>/member/bookmark/${list}" >${list }</a></li>
			    </c:forEach>
			    
			    
			    <c:choose>
					<c:when test="${pageInfo.currentPage eq pageInfo.endPage }">
					<li class="page-item">
						<a class="page-link">next</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a class="page-link"  href="<%=request.getContextPath()%>/member/bookmark/${pageInfo.currentPage+1}">next</a>
					</li>	
					</c:otherwise>
				</c:choose>
			  </ul>
			</nav>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>