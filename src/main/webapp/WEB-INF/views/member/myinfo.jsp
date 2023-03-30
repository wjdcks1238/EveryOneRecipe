<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>내 정보</title>

<link rel="icon" href="<%=request.getContextPath()%>/resources/mediumish/assets/img/favicon.ico">
<!-- Fonts -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<!-- !!!!!!!!!!!! ===================app.css 파일의 nav와 충돌함 !!!!!!!!!
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/template-pintereso/assets/css/app.css">-->
<!-- 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/template-pintereso/assets/css/theme.css">
 -->
 
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/mediumish.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css">



<style type="text/css">

.card-pin:hover .card-title {
  color: #ffffff;
  margin-top: 10px;
  text-align: center;
  font-size: 1.2em; }
.card-pin:hover .overlay {
  opacity: .5;
  border: 5px solid #f3f3f3;
  -webkit-transition: ease .2s;
  transition: ease .2s;
  background-color: #000000;
  cursor: -webkit-zoom-in;
  cursor: zoom-in; }
.card-pin:hover .card-title {
  color: #ffffff;
  margin-top: 10px;
  text-align: center;
  font-size: 1.2em; }

/* line 73, src/assets/scss/theme.scss */
.card-pin:hover .more a {
  text-decoration: none;
  color: #ffffff; }

/* line 78, src/assets/scss/theme.scss */
.card-pin:hover .download a {
  text-decoration: none;
  color: #ffffff; }
.more {
  color: white;
  font-size: 14px;
  position: absolute;
  bottom: 0;
  right: 0;
  text-transform: uppercase;
  -webkit-transform: translate(-20%, -20%);
          transform: translate(-20%, -20%);
  -ms-transform: translate(-50%, -50%); }
.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  -webkit-transition: .2s ease;
  transition: .2s ease;
  background-color: #008CBA; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<!-- Begin Top Author Page
================================================== -->
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-1 bd-sidebar">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="#">내 정보 보기</a></li>
				</ul>
			</div>
				<div class="container">
				
				
					<div>
						프로필 이미지
						<img  width="300" alt="" src="../resources/tempProfileImg/food.svg">
						<!-- 
							<img alt="" src="${memberDto.profileUrl }">
						 -->
				 
					</div>
					<div>
						아이디: ${memberDto.userId }
					</div>
					<div>
						닉네임: ${memberDto.nickName }
					</div>
					<div>	
						이메일: ${memberDto.email }
					</div>
					<div>
						프로필 설명: ${memberDto.profile }
					</div>
					<div>
						가입일: ${memberDto.createAt }
					</div>
				</div>
		</div>
	</div>
    <main role="main">

    <div class="container-fluid">
    	
    		<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
    			<c:forEach items="${postList }" var="list" >
	    			<div class="col-md-2 card card-pin mt-3 ml-3" style="padding: 0">
	    				<img class="card-img" src="https://images.unsplash.com/photo-1489743342057-3448cc7c3bb9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6d284a2efbca5f89528546307f7e7b87&auto=format&fit=crop&w=500&q=60" alt="Card image">
	    				<div class="overlay">
	    					<h2 class="card-title title">${list.foodName }</h2>
	    					<div class="more">
	    						<a href="<%=request.getContextPath()%>/board/list/${list.postId}">
	    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> 더보기 </a>
	    					</div>
	    				</div>
	    			</div>
    			</c:forEach>
    			
    		</div>
    <div id="end"></div>
    </div>

    </main>
	

	<!-- End Top Author Meta
================================================== -->

<%@ include file="../footer.jsp" %>

<!-- Bootstrap core JavaScript 
================================================== 
    <script src="<%=request.getContextPath()%>/resources/template-pintereso/assets/js/app.js"></script>
    <script src="<%=request.getContextPath()%>/resources/template-pintereso/assets/js/theme.js"></script>
-->

    
    <script type="text/javascript">$(document).ready(function(){
        start.init();
    });
    var start = {
            param : {
                curPage : 2,
            },
            
            init : function() {
               this.testEvent();
            },
           testEvent : function() {
                // 무한 스크롤
                $(window).scroll(function() {
                    // 맨 밑으로 스크롤이 갔을경우 if문을 탑니다.
                    if($(window).scrollTop() > $(document).height() - $(window).height() - 500) { 
                        start.param.curPage++; // 현재 페이지에서 +1 처리.
                        start.testAjax(); //ajax 호출
                    } 
                }); 
            },
            // 무한 스크롤 ajax 요청
            testAjax : function() {
            	var userId='${memberDto.userId}';
            	var arr = [ {curPage:start.param.curPage, pageListSize :start.param.pageListSize} ];
            	var map = {curPage:start.param.curPage,userId:userId};
            	console.log(map);
                $.ajax({
                    type     : 'POST',
                    url      : '${pageContext.request.contextPath}/board/ISajax',
                    async : false,
                    data : map,
                    dataType : 'json',
                    success : successCallback,
                    error : errorCallback
                });
                // 성공
                function successCallback(data) {
                	
                    if(data.length == 0 ){
                        $("#end").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
                        $(window).off("scroll");
                    } 
                    
         
                    if(data.length != 0){
                    	console.log("작동중");
                    	console.log("### 3: " + start.param.curPage);
                    	
                    	
                		for(i = 0 ; i<data.length;i++){
    	            		var reply = data[i];	
    	            		
    	            		var card = $('<div class="col-md-2 card card-pin mt-3 ml-3">'+
    	            				'<img class="card-img" src="https://images.unsplash.com/photo-1489743342057-3448cc7c3bb9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6d284a2efbca5f89528546307f7e7b87&auto=format&fit=crop&w=500&q=60" alt="Card image">'+
    	            				'<div class="overlay">'+
    	            					'<h2 class="card-title title">'+reply.foodName+'</h2>'+
    	            					'<div class="more">'+
    	            						'<div class="card-block">'+
    	            							'<a href="+<%=request.getContextPath()%>/board/list/${list.postId}">'+
    	            							'<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> 더보기 </a>'+
    	            							'</div>'+
    	            							'</div>'+
    	            						'</div>');
    	                	
    	            		$("#postList").append(card);
                		}
                    	
                    	
                   
                    	
    	           }    
                }
                
                // 실패
                function errorCallback() {
                    alert("실패");
                }
            }
            

    }


    </script>
</body>
</html>
