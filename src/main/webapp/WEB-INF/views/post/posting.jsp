<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/ckeditor5/build/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<style>
.ck-editor__editable {
	height: 400px;

}

.ck-content {
	font-size: 12px;

}
</style>
<title>Insert title here</title>
</head>
<body>
	<div style="width: 1000px;">
	<!-- 
	<div>
		<button type='button' name='deleteIng'>삭제</button>
	</div>
	 -->
	<form id="frm" action="" method="POST">
		<div>
			<input type="hidden" name="userId" value="${userId }">
		</div>
		<div>
			<input name="foodName" type="text" placeholder="음식 이름">
		</div>
			<div>
				<input name="ingredient" type="text" placeholder="재료"> 
				<input name="amount" type="text" placeholder="수량">

				<div id="additional"></div>

				<button id="addIng" type="button">재료 입력칸 추가</button>
			</div>
			<textarea form="frm" name="content" id="editor"></textarea>
		<p>
			<input type="submit" value="전송">
		</p>
	</form>
	</div>
	
</body>
	<script>
		ClassicEditor.create(document.querySelector('#editor'));
		
		$("#addIng").on("click", function(){	
			var div= $("<div>").append($("<input type='text' placeholder='재료' name='ingredient'> "));
			div.append($("<input type='text' placeholder='수량' name='amount'>"));
			div.append($("<button type='button' name='deleteIng'>").text("삭제"));
			$("#additional").append(div)	
		});
		console.log($("button[name=deleteIng]"));
		$(document).on("click","button[name=deleteIng]" ,function(){
			console.log("작동도 안해");
			$(this).parent().remove();
		});
	</script>

</html>