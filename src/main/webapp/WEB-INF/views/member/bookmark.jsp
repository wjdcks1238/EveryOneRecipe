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
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/bookmark">북마크한 게시물</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/like">좋아요 표시한 게시물</a></li>
				</ul>
			
		</div>


		<div class="col-md-8 col-md-offset-2 col-xs-12">
			<table>
				<tr>
					<th>글 번호</th>
					<th>레시피명</th>
					<th>닉네임</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${bList}" var="list">
					<tr>
						<td>${list.postId }</td>
						<td><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></td>
						<td>${list.nickname }</td>
						<td>${list.createDate }</td>
						<td>${list.lookUp }</td>
					</tr>
				</c:forEach>
			</table>


		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>