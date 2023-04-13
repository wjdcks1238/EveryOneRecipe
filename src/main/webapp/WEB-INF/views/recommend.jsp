<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/detail.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<div class="container">
		<div>
			<h3>선택한 재료 목록</h3>
		</div>
		<div>
			${chosenList }
		</div>
		<div class="mt-5">
			<h3>선택한 재료들로 만들 수 있는 레시피 목록</h3>
		</div>
		<c:forEach items="${recList0 }" var="list">
			<div>
					${list.postId }
					${list.foodName }
					<div>
					<c:forEach items="${list.ingredients }" var="ing">
						${ing.ingredient }
						${ing.amount }
					</c:forEach>
					</div>
					
			</div>
		</c:forEach>
			<div class="mt-5">
				<h3>선택한 재료들로 만들 수 있는 레시피 목록(1개 부족)</h3>
			</div>
			
		<c:forEach items="${recList1 }" var="list">
			<div>
					${list.postId }
					${list.foodName }
					<div>
					<c:forEach items="${list.ingredients }" var="ing">
						${ing.ingredient }
						${ing.amount }
					</c:forEach>
					</div>
					
			</div>
		</c:forEach>
			<div class="mt-5">
				<h3>선택한 재료를 모두 포함한 레시피 목록(2개 부족)</h3>
			</div>
		<c:forEach items="${recList2 }" var="list">
			<div>
					${list.postId }
					${list.foodName }
					<div>
					<c:forEach items="${list.ingredients }" var="ing">
						${ing.ingredient }
						${ing.amount }
					</c:forEach>
					</div>
					
			</div>
		</c:forEach>
			<div class="mt-5">
				<h3>선택한 재료를 모두 포함한 레시피 목록(3개부족)</h3>
			</div>
		<c:forEach items="${recList3 }" var="list">
			<div>
					${list.postId }
					${list.foodName }
					<div>
					<c:forEach items="${list.ingredients }" var="ing">
						${ing.ingredient }
						${ing.amount }
					</c:forEach>
					</div>
					
			</div>
		</c:forEach>
	</div>	
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>