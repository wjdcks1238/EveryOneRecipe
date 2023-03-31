<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>프로필 수정</title>

<link rel="icon" href="<%=request.getContextPath()%>/resources/mediumish/assets/img/favicon.ico">
<!-- Fonts -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/mediumish.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css">
 <style>
.navbar{
	padding-left:0;
}
.modal {
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    display: none;

    background-color: rgba(0, 0, 0, 0.4);
    
}

.modal.show {
    display: block;
}

.modal_body {
    position: absolute;
    top: 50%;
    left: 50%;

    width: 400px;
    height: 600px;

    padding: 40px;

    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="modal">
  	<div class="modal_body">
		<form id="uploadPiForm" method="post" enctype="multipart/form-data">
			<div>
				<label for="image">
  					<a  class="btn btn-primary">프로필 이미지 선택</a>
  					
				</label>
				<input style="display: none" type="file" id="image" accept="image/*" onchange="setThumbnail(event);" name="report" >
			</div>
			<div id="image_container"></div>
			<div>
				<button type="button" id="updatePI">프로필 사진 변경</button>
							</div>
			<div id="error"></div>
		</form>				
	</div>
</div>
<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="#">비밀번호 변경</a></li>
				</ul>
			</div>
			<div class="col-2">
					<label>프로필 사진</label>
					<img width="100%" alt="<%=request.getContextPath()%>/resources/tempProfileImg/food.svg" src="${memberDto.profileUrl }">
   	 				<button type="button" class="btn-open-popup">프로필 사진 변경</button>
   	 				<button type="button" id="deletePI">프로필 사진 삭제</button>
   	 				
			</div>
			<div class="col-4">
				<form id="updateForm">
					<div>
						<h3>아이디: ${memberDto.userId }</h3>
					</div>
					<label>닉네임</label>
					<input type="text" name="nickName" value="${memberDto.nickName }">
					<label>프로필 설명</label>
					<input type="text" name="profile" value="${memberDto.profile }">
					
					<button id="updateBtn" type="button">프로필 업데이트</button>
				</form>
				<!-- 
				<img  width="300" alt="" src="<%=request.getContextPath() %>/resources/tempProfileImg/food.svg">
				 -->
			</div>
				
					
		</div>
	</div>
<%@ include file="../footer.jsp" %>

<script>

	function setThumbnail(event) {
	    var reader = new FileReader();
	
	    reader.onload = function(event) {
	      
	      var img = document.createElement("img");
	      img.setAttribute("src", event.target.result);
	      img.setAttribute("width", '90%');
	      $("#image_container").html("");
	      document.querySelector("div#image_container").appendChild(img);
	    };
	
	    reader.readAsDataURL(event.target.files[0]);
	  }







      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      
      
      $(document).on("click","#updatePI" ,function() {
    	  var form = document.getElementById("uploadPiForm");
    	  if($("#image_container").html()!=""){
    		  form.action = 'updatepi';
    		  form.mothod = 'post';
    		  form.submit();
    	  }else{
    		  $("#error").text("이미지를 먼저 업로드 해주세요");
    	  }
    	  
      });
      
      $(document).on("click","#updateBtn" ,function() {
      	
      	var map = {nickName:$("input[name=nickName]").val(),profile:$("input[name=profile]").val()};
      	
      	console.log(map);
      	$.ajax({
      		url: '<%=request.getContextPath()%>/member/update',
      		type: 'POST', 
      		data: map,
      		success:function(result){
      			
      			location.href="<%=request.getContextPath()%>/member/myinfo"
      			
      		}
      		
      	});
      }); 
      $(document).on("click","#deletePI" ,function() {
      	$.ajax({
      		url: '<%=request.getContextPath()%>/member/deletepi',
      		type: 'POST', 
      		data: {userId : '${memberDto.userId }'},
      		success:function(result){
      			console.log("성공");
      			location.href="<%=request.getContextPath()%>/member/myinfo"
      			
      		}
      		
      	});
      }); 
      
    </script>
</body>
</html>