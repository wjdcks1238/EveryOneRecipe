<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<style>
 .cke_editor_editor .cke_contents{ 
     min-height:500px; 
} 

.ck-content {
	font-size: 12px;

}
input[type="text"]:focus{
	outline: none;
	border-color: black;
}
input[type="text"]{
	display: inline;

}
.btn{
	font-weight: 700;
	border: thin;
}	
</style>


</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container" >

<h2>게시글 수정</h2>
<form id="frm" action="./" method="POST" class="mt-5">
	
		<div>
			<input value="${post.postId }" name="postId" type="hidden">
		</div>
		<div >
			<input style="width: 20%" class="form-control" value="${post.foodName }" name="foodName" type="text" placeholder="음식 이름">
		</div>
		<div class=" mt-3 mb-3">
			<input style="width: 20%" class="form-control" value="${ingredients[0].ingredient }" name="ingredient" type="text" placeholder="재료"> 
			<input style="width: 20%" class="form-control" value="${ingredients[0].amount } " name="amount" type="text" placeholder="수량">
			<div id="additional">
			
			<c:forEach begin="1" items="${ingredients }" var="list">
				<div class="mt-1">
					<input style="width: 20%" class="form-control" value="${list.ingredient} " type="text" placeholder="재료" name="ingredient">
					<input style="width: 20%" class="form-control" value="${list.amount}" type="text" placeholder="수량" name="amount">
					<button class="btn btn-dark" type="button" name="deleteIng">삭제</button>
				</div>
			</c:forEach>
			
			
			</div>
			<button  class="btn btn-dark mt-2" id="addIng" type="button">재료 추가</button>
		</div>
		<textarea  form="frm" name="content" id="editor">${post.content }</textarea>
		
		<div class="mt-3">
			<input style="width: 40%" class="form-control" value="${hashtags}" name="hashtag" type="text" placeholder="해쉬태그 입력">
		</div>	
			
		<div class="mt-2">
			<button id="sb" class="btn btn-dark"  type="button">수정</button>
		</div>

</form>

</div>


<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>

<script type="text/javascript">
$(function() {
	CKEDITOR.replace('editor', {
		filebrowserUploadUrl:'${pageContext.request.contextPath}/upload.do'
	});
});
$("#addIng").on("click", function(){	
	var div= $("<div class='mt-1'> ").append($("<input style='width: 20%' class='form-control' type='text' placeholder='재료' name='ingredient'> "));
	div.append(" ");
	div.append($("<input style='width: 20%' class='form-control' type='text' placeholder='수량' name='amount'>"));
	div.append(" ");
	div.append($("<button class='btn btn-dark' type='button' name='deleteIng'>").text("삭제"));
	$("#additional").append(div)	
});
console.log($("button[name=deleteIng]"));
$(document).on("click","button[name=deleteIng]" ,function(){
	$(this).parent().remove();
});

if('${alert}'!=''){
	setTimeout(function() {
		  alert('${alert}');
		}, 200); 
}
$("#sb").on("click",function(){
	console.log("22");
	document.getElementById("frm").action="./update";
});

</script>
</body>

</html>