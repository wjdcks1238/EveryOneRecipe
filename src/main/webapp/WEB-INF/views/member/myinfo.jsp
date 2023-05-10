<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html >
<head>
<title>내 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<style type="text/css">



.card-pin:hover .card-title {
  color: #ffffff;
  margin-top: 10px;
  text-align: center;
  font-size: 1.2em; 
  }
.card-pin:hover .overlay {
  opacity: .5;
  border: 5px solid #f3f3f3;
  -webkit-transition: ease .2s;
  transition: ease .2s;
  background-color: #000000;
  }
.card-pin:hover .card-title {
  color: #ffffff;
  margin-top: 10px;
  text-align: center;
  font-size: 1.2em; 
  }

.card-pin:hover .more a {
  text-decoration: none;
  color: #ffffff; }

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
  	
  main{
  height: auto;
  min-height:48vh;
  padding-bottom: 63.19px;
}
.footer{
  height: 63.19px;
  position : relative;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div  id='wrapper' class="container">
	<div class="row">

		<div class="col-md-2 col-xs-12">
				<ul class="navbar-nav">
					<li class="nav-item active" ><a class="nav-link" href="<%=request.getContextPath()%>/member/myinfo">내 정보 보기</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/update">내 정보 수정 </a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/infoupdate">개인정보 수정</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/bookmark/1">북마크</a></li>
					<li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/member/like/1">좋아요</a></li>
				</ul>
			
		</div>


		<div class="col-md-8 col-md-offset-2 col-xs-12">
			<div class="row">
				<div class="col-4">
						<div>
							<!-- <label>프로필 이미지</label> --> 
							<img  width="100%" alt="<%=request.getContextPath() %>/resources/tempProfileImg/food.svg" src="${memberDto.profileUrl }">
						</div>
				</div>
				<div class="col-8">
						<div>
							<h3>${memberDto.nickName }(${memberDto.userId })</h3>
						</div>
						<div class="row">
							<div class="col-4">
							    <a href="<%=request.getContextPath()%>/member/follower/<%=request.getUserPrincipal().getName() %> ">팔로워 ${followerCount }</a>	
							</div>
							<div class="col-4">
							    <a href="<%=request.getContextPath()%>/member/following/<%=request.getUserPrincipal().getName() %> ">팔로잉 ${followingCount }</a>	
							</div>
						</div>
						<div class="profile">
							${memberDto.profile }
						</div>
						<!-- 내정보보기이지만 다른 회원의 페이지와 화면이 동일해야 좋을거같아서 일단 주석처리합니다.
						닉네임(아이디)
						팔로워 팔로잉
						프로필설명 -->
						<%-- <div>
							아이디: ${memberDto.userId }
						</div> --%>
						<%-- <div>	
							이메일: ${memberDto.email }
						</div> --%>
						<%-- <div>
							가입일: ${memberDto.createAt }
						</div> --%>
				</div>
			</div>
    <main role="main">

    <div style="margin-top: 5%;">
    	
    		<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
    			<c:forEach items="${postList }" var="list" >
	    			<div class="col-md-2 card card-pin mt-3 ml-3" style="padding: 0">
	    				<img class="card-img" src="${list.mainImage }" alt="Card image">
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


		</div>
	</div>
</div>
	


<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>


    
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
                        $("#end").append('<div class="noList"><span>더 이상 표시할 항목이 없습니다.</span></div>');
                        $(window).off("scroll");
                    } 
                    
         
                    if(data.length != 0){
                    	console.log("작동중");
                    	console.log("### 3: " + start.param.curPage);
                    	
                    	
                		for(i = 0 ; i<data.length;i++){
    	            		var reply = data[i];	
    	            		
    	            		var card = $('<div class="col-md-2 card card-pin mt-3 ml-3" style="padding: 0">'+
    	            				'<img class="card-img" src="'+reply.mainImage +'" alt="Card image">'+
    	            				'<div class="overlay">'+
    	            					'<h2 class="card-title title">'+reply.foodName+'</h2>'+
    	            					'<div class="more">'+
    	            						'<div class="card-block">'+
    	            							'<a href="${pageContext.request.contextPath}/board/list/'+reply.postId+'">'+
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
