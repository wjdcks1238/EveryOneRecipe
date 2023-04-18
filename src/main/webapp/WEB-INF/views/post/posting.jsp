<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
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
#wrapper{
  height: auto;
  min-height: 60vh;
  padding-bottom: 63.19px;	
}
.footer{
  height: 63.19px;
  position : relative;
}
.btn{
	font-weight: 700;
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<div class="container" id='wrapper'>
	 	
	 	<h2>게시글 등록</h2>
	
		<form id="frm" action="posting" method="POST" class="mt-5">
		
			<div>
				<input style="width: 20%" class="form-control" type="hidden" name="userId" value="${userId }">
			</div>
			<div>
				<input style="width: 20%" class="form-control" value="${board.foodName }" name="foodName" type="text" placeholder="음식 이름">
			</div>
			<div class="mt-3 mb-3">
				
				<c:if test="${empty ingredients }">
					<input style="width: 20%" class="form-control" name="ingredient" type="text" placeholder="재료"> 
					<input style="width: 20%" class="form-control" name="amount" type="text" placeholder="수량">
					<div id="additional" ></div>
				</c:if>
				
				<c:if test="${not empty ingredients }">
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
				</c:if>
				<button class="btn btn-dark mt-2" id="addIng"  type="button">재료 추가</button>
			</div>
			<textarea form="frm" name="content" id="editor">${board.content }</textarea>
			
			<div class="mt-3">
				<input style="width: 40%" class="form-control" value="${hashtags}" name="hashtag" type="text" placeholder="해쉬태그 입력">
			</div>	
				
			<div class="mt-2"> 
				<button class="btn btn-dark" type="submit" >전송</button>
			</div>
	
		</form>
		</div>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>

	<script>
	
		
		
		// ClassicEditor.create(document.querySelector('#editor')); ck5
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
		
		
		
		$("#sb").click(function(){
		
			var formData = new FormData($("#frm")[0]); // 폼 데이터 생성
			var jsonData = JSON.stringify(Object.fromEntries(formData)); // 폼 데이터를 json 객체로 변환하고 문자열화
			console.log(jsonData);//가장 마지막 데이터만 저장됨....
			$.ajax({
			  url: "/postajax",
			  type: "POST", 
			  contentType: "application/json",
			  dataType: "json",
			  data: jsonData,
			  success: function(data) { 
			    console.log(data); 
			  },
			
			});
		
		})
		
		
		if('${alert}'!=''){
			setTimeout(function() {
				  alert('${alert}');
				}, 200); 
		}
		
		
	</script>
</body>

</html>