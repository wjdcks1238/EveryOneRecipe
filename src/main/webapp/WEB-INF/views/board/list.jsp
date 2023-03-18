<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
<c:forEach items="${ postList}" var="list" varStatus="status" >
	<table>
	<tr>
		<th>닉네임 </th>
		<th>아이디</th>
		<th>음식 이름</th>
		<th>음식 재료</th>
		<th>음식 수량</th>	
		<th>내용</th>
		<th>게시일</th>
	</tr>	
	<tr>
		<td>${list.nickname} </td>
		<td>${list.userId} </td>
		<td>${list.foodName} </td>
		<td>
	<c:forEach items="${list.ingredients }" var="ing" varStatus="status" >
		${ing.ingredient }
	</c:forEach>
		</td>
		<td>
	<c:forEach items="${list.ingredients }" var="ing" varStatus="status" >
		${ing.amount }
	</c:forEach>
		</td>
		<td>${list.content} </td>
		<td>${list.createDate} </td>
	</tr>
	
	</table>
</c:forEach>

<div>
 	<button id="testDelete" type="button">임시 삭제버튼</button>
</div>
<!-- 
<table>
<c:forEach items="${boardList}" var="list" varStatus="status" >
	<tr>
		<th>닉네임 </th>
		<th>아이디</th>
		<th>음식 이름</th>
		<th>음식 재료</th>
		<th>음식 수량</th>	
		<th>내용</th>
		<th>게시일</th>
	</tr>	
	<tr>
		<td>${list.nickname} </td>
		<td>${list.userId} </td>
		<td>${list.foodName} </td>
		
		<td>${ingredientList[status.index].ingredient} </td>
		<td>${ingredientList[status.index].amount} </td>
		<td>${list.content} </td>
		<td>${list.createDate} </td>
	</tr>
</c:forEach>
</table>
 -->
 
 <script type="text/javascript">
 $("#testDelete").click(function(){
	 	var postId=86;
			$.ajax({
			  url: "./delete",
			  type: "POST", 
			  data: {postId: postId},
			  success:function(result){
					console.log(result);
				}
			});
		
		})
 </script>
</body>
</html>