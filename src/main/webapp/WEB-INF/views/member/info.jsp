<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원 정보</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

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
 }
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
<%@ include file="/WEB-INF/views/header.jsp" %>


<sec:authorize var="loggedIn" access="isAuthenticated()" />
	<div class="container-fluid">
		<div class="row flex-nowrap">
			
				<div class="container row col-12">
					<div class="col-3"></div>
				
					<div class="col-2">
						<!-- 프로필 이미지 -->
						<img  width="100%" alt="<%=request.getContextPath() %>/resources/tempProfileImg/food.svg" src="${memberDto.profileUrl }">
				 
					</div>
					<div class="col-4">
						<div class="row ml-0">
							<h3>${memberDto.nickName }(${memberDto.userId })</h3> 
							<c:if test="${loggedIn}">
								<c:set var="user" value="<%=request.getUserPrincipal().getName() %>"/>
								<c:if test="${user ne memberDto.userId}">
								<div id="follow">
									<c:if test="${isFollowed }">
										<img id="followBtn" style="cursor: pointer;" alt="" width="30px" src="<%=request.getContextPath()%>/resources/icons/added.png">
									</c:if>
									<c:if test="${isFollowed eq false }">
										<img id="followBtn" style="cursor: pointer;" alt="" width="30px"	src="<%=request.getContextPath()%>/resources/icons/add.png">
									</c:if>
	
								</div>
								</c:if>
							</c:if>
						</div>
						<div class="row">
							<div class="col-4">
							    <a href="<%=request.getContextPath()%>/member/follower/${memberDto.userId } ">팔로워 ${followerCount }</a>	
							</div>
							<div class="col-4">
							    <a href="<%=request.getContextPath()%>/member/following/${memberDto.userId } ">팔로잉 ${followingCount }</a>	
							</div>
						</div>
						<%-- <div>
							아이디: ${memberDto.userId }
						</div> --%>
						<div class="profile">
							${memberDto.profile }
						</div>
						<%-- <div>
							가입일: ${memberDto.createAt }
						</div> --%>
						
					
						
						
					</div>
	
				
				</div>
		</div>
	</div>

    <main role="main">

    <div class="container-fluid" style="margin-top: 10%;padding-left:10%">
    	
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
    	            				'<img class="card-img" src="'+reply.mainImage +'"alt="Card image">'+
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
    $(document).on("click","#followBtn" ,function() {
    	var isFollowed = $("#isFollowed").text();
    	$.ajax({
    		url: "${pageContext.request.contextPath}/follow",
    		type: "POST", 
    		data: {userId: "${memberDto.userId }" },
    		async : false,
    		success:function(result){
    			if(result==false){
    				
    				var htmlVal= "<img id='followBtn' style='cursor: pointer;' alt='' width='30px' src='<%=request.getContextPath()%>/resources/icons/add.png'>";
    				$("#follow").html(htmlVal);
    			}else if(result==true){
    				var htmlVal= "<img id='followBtn' style='cursor: pointer;' alt='' width='30px' src='<%=request.getContextPath()%>/resources/icons/added.png'>";
    				$("#follow").html(htmlVal);
    			}
    		}
    		
    	});
    });


    </script>
    
</body>
</html>
