<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간 테이블 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style>
a {
text-decoration: none;
color: gray;
}
a:hover{
color: red;
}

.main-div{
height: 425px;

}
.tbdiv{
width: 450px;
font-size: 14px;
display: inline-block;
}

.in-div{
width:450px;
higth:420px;
}

.pgnum{
width: 450px;
display: inline-block;
}



.pop-div{
display: inline-block;
}
</style>
</head>
<body>
<h4>주간 게시글(월요일~일요일)</h4>

<div class="main-div">
<div class="in-div">
<div class="tbdiv">
<table class="table table-hover" style="text-align: center; margin-bottom: 0px;">
	<thead class="table-primary">
		<tr>
			<th>레시피명</th>
			<th>닉네임</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${weekboard}" var="list">
		<tr class="table-secondary">
			<td><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></td>
			<td>${list.nickname }</td>
			<td>${list.dateWrite }</td>
			<td>${list.lookUp }</td>
		</tr>
		</c:forEach>
	</tbody>	
</table>
</div>
<div align="center" class="pgnum">
	<c:if test="${prev}">
		<a href="/everyrecipe/board/weekboardpage?num=${startPageNum - 1 }">이전</a>
	</c:if>
	
	<c:forEach begin="${startPageNum }" end="${endPageNum}" var="num">
		<span>
			<c:if test="${select != num }">
				<a href="/everyrecipe/board/weekboardpage?num=${num }">${num }</a>
			</c:if>
			<c:if test="${select == num }">
				<b>${num }</b>
			</c:if>
		</span>
	</c:forEach>
	<c:if test="${next }">
		<a href="/everyrecipe/board/weekboardpage?num=${endPageNum + 1 }">다음</a>
	</c:if>
</div>
</div>
<h4>실시간 검색어 순위</h4>
<div class="tbdiv">
<table class="table table-hover">
	<thead class="table-primary">
	<tr>
		<th scope="col">순위</th>
		<th scope="col">검색어</th>
	</tr> 
	</thead>
	<c:forEach items="${pword}" var="word">
		<c:set var="i" value="${i+1}"/>
		<tr class="table-secondary">
			<td>
				<c:if test="${i <= 3 }">
					<button type="button" class="btn btn-success"
					style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
					${i}
					</button>
				</c:if>
				<c:if test="${i > 3 }">
					<button type="button" class="btn btn-light"
					style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
					${i}
					</button>
				</c:if>
			</td>
			<td>${word.keword}</td>
		</tr>
	</c:forEach>
</table>
</div>
</div>
</body>
</html>