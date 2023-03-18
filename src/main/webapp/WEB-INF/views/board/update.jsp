<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.ck-editor__editable {
	height: 400px;

}

.ck-content {
	font-size: 12px;

}
</style>
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>

<body>
<div style="width: 1000px;">
<form id="frm" action="./" method="POST">
	
		<div>
			<input value="${post.postId }" name="postId" type="hidden">
		</div>
		<div>
			<input value="${post.foodName }" name="foodName" type="text" placeholder="음식 이름">
		</div>
		<div>
			<input value="${ingredients[0].ingredient }" name="ingredient" type="text" placeholder="재료"> 
			<input value="${ingredients[0].amount } " name="amount" type="text" placeholder="수량">
			<div id="additional">
			
			<c:forEach begin="1" items="${ingredients }" var="list">
				<div>
					<input value="${list.ingredient} " type="text" placeholder="재료" name="ingredient">
					<input value="${list.amount}" type="text" placeholder="수량" name="amount">
					<button type="button" name="deleteIng">삭제</button>
				</div>
			</c:forEach>
			
			
			</div>
			<button id="addIng" type="button">재료 입력칸 추가</button>
		</div>
		<textarea  form="frm" name="content" id="editor">${post.content }</textarea>
		
		<div>
			<input value="${hashtags}" name="hashtag" type="text" placeholder="해쉬태그 입력">
		</div>	
			
		<div>
			<input  type="submit" value="전송">
		</div>

</form>

</div>
<div>
	<button>게시글 수정</button>
</div>


<script type="text/javascript">
CKEDITOR.replace('editor');

$("#addIng").on("click", function(){	
	var div= $("<div>").append($("<input type='text' placeholder='재료' name='ingredient'> "));
	div.append($("<input type='text' placeholder='수량' name='amount'>"));
	div.append($("<button type='button' name='deleteIng'>").text("삭제"));
	$("#additional").append(div)	
});
$(document).on("click","button[name=deleteIng]" ,function(){
	$(this).parent().remove();
});

</script>
</body>

</html>