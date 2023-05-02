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
				<input type="hidden" name="userId" value="${uName }">
			</div>
			<div>
				<input style="width: 20%" class="form-control chk"  name="foodName" type="text" placeholder="음식 이름">
			</div>
			<div class="mt-3 mb-3">
				
				
				<input style="width: 20%" class="form-control chk" name="ingredient" type="text" placeholder="재료"> 
				<input style="width: 20%" class="form-control chk" name="amount" type="text" placeholder="수량">
				<div id="additional" ></div>
			

				<button class="btn btn-dark mt-2" id="addIng"  type="button">재료 추가</button>
			</div>
			
			
			
			
			<div id="mainImageDiv">
			<label for="image">
  					<a  class="btn btn-success">대표 이미지 선택</a>
			</label>
				<input style="display: none" type="file" id="image" accept="image/*" name="report" >
				<div id="image_container" class="mb-3"></div>
				
			</div>
			
			
			
			
			
			
			
			<textarea form="frm" name="editor" id="editor">${board.content }</textarea>
			
			<div class="mt-3">
				<input style="width: 40%" class="form-control hashtag" name="hashtag" type="text" placeholder="해쉬태그 입력">
			</div>	
				
			<div class="mt-2"> 
				<button class="btn btn-dark" id="sb" type="button">전송</button>
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
			var div= $("<div class='mt-1'> ").append($("<input style='width: 20%' class='form-control chk' type='text' placeholder='재료' name='ingredient'> "));
			div.append(" ");
			div.append($("<input style='width: 20%' class='form-control chk' type='text' placeholder='수량' name='amount'>"));
			div.append(" ");
			div.append($("<button class='btn btn-dark' type='button' name='deleteIng'>").text("삭제"));
			$("#additional").append(div)	
		});
		console.log($("button[name=deleteIng]"));
		$(document).on("click","button[name=deleteIng]" ,function(){
			$(this).parent().remove();
		});
		

		$(document).on("change","#image",function(event){
		    var reader = new FileReader();
		
		    reader.onload = function(event) {
		      
		      var img = document.createElement("img");
		      img.setAttribute("src", event.target.result);
		      img.setAttribute("style", "max-width:70%; max-height:400px ");
		      $("#image_container").html("");
		      document.querySelector("div#image_container").appendChild(img);
		    };
		
		    reader.readAsDataURL(event.target.files[0]);
		    $("#remove").remove();
		    $("#mainImageDiv").append('<button class="mb-3" id="remove" type="button">x</button>');
		  });
		
		
		
		$("#sb").click(function(){
			var isValid = true;
			$('.chk').each(function() {
//				console.log($(this).val().trim());
//				console.log($(this).val());
				if($(this).val().trim()==''){
					alert("음식이름, 재료, 수량을 전부 입력해주세요");
					isValid =false;
					return false;
				}
			});
			var content = CKEDITOR.instances.editor.getData();
			var content_len = content.length;
			if(content.trim()==''){
				alert("게시글 내용을 입력해주세요");
				isValid =false;
				return false;
			}
			if(content_len<18){
				alert("10글자 이상 입력해주세요.");
				isValid =false;
				return false;
			}
			if(!isValid){
				return false;
			}
			var formDataS=$("#frm").serialize();
			formDataS+="&content="+encodeURIComponent(content);
			//console.log(formData);
			
			var serializedArray = formDataS.match(/([^&]+)/g).map(function(item) {
			  var pair = item.split("=");
			  return { name: decodeURIComponent(pair[0]), value: decodeURIComponent(pair[1]) };
			});
			
			
			var formData = new FormData();
			serializedArray.forEach(function(item) {
			  formData.append(item.name, item.value);
			});
			
			var img = CKEDITOR.instances.editor.document.find('img').getItem(0);
			var imgUrl = img ? img.getAttribute('src') : '';
			
			formData.append('image', $('input[type=file]')[0].files[0]);
			formData.append('firstImage',imgUrl);
			
			/*
			for (var pair of formData.entries()) {
				  console.log(pair[0] + ': ' + pair[1]);
			}
			*/
			$.ajax({
			  url: "${pageContext.request.contextPath}/board/postajax",
			  type: "POST", 
			  data:formData,
			  processData : false,
	     	  contentType : false,
			  success: function(data) { 
			    if(data=='false'){
			    	alert("비속어를 포함한 게시글은 등록할 수 없습니다.");
			    }else if(data=='true'){
			    	location.href="${pageContext.request.contextPath}/board/list/"
			    }
			  },
			
			});
			
			
		})
		
	$(document).on("click","#remove" ,function() {
		$("#image").val('');
		$("#image_container").empty();
		$("#remove").remove();
		
	});
		
	if($("#image-container").text()!=''){
		console.log($("#image-container").text());
		$("#mainImageDiv").append('<button class="mb-3" id="remove" type="button">x</button>');
		
	}
		
		
	</script>
</body>

</html>