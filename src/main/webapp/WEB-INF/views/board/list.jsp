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
<link rel="icon" href="<%=request.getContextPath()%>/resources/mediumish/assets/img/favicon.ico">
<title>Mediumish - A Medium style template by WowThemes.net</title>
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Fonts -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/mediumish.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
<!-- Begin Nav
================================================== -->
<nav class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="container">
	<!-- Begin Logo -->
	<a class="navbar-brand" href="<%=request.getContextPath()%>/resources/mediumish/pages/index.html">
	<img src="<%=request.getContextPath()%>/resources/mediumish/assets/img/logo.png" alt="logo">
	</a>
	<!-- End Logo -->
	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		<!-- Begin Menu -->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active">
			<a class="nav-link" href="<%=request.getContextPath()%>/resources/mediumish/index.html">Stories <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath()%>/board/list">Post</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath()%>/resources/mediumish/author.html">Author</a>
			</li>
		</ul>
		<sec:authorize var="loggedIn" access="isAuthenticated()" />
		<c:choose>
			<c:when test="${loggedIn}">
				<!-- 내정보 버튼 -->
				<a href="<%=request.getContextPath() %>/member/profile" class="btn">내정보</a>
				<!-- 로그아웃 버튼 -->
				<form class="form-logout" method="post" action="/logout">
				  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token} ">
				  <button class="btn" type="submit" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">로그아웃</button>
				</form>
			</c:when>
			<c:otherwise>
				<!-- 회원가입  -->
				<a href="<%=request.getContextPath() %>/member/signup" class="btn">회원가입</a>
				<!-- 로그인  -->
				<a href="<%=request.getContextPath() %>/member/login" class="btn">로그인</a>
			</c:otherwise>
		</c:choose>
		
		
		

		<form id="logout-form" action="${pageContext.request.contextPath}/logout" method="post" style="display: none;">
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>

		<!-- End Menu -->
		<!-- Begin Search -->
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search">
			<span class="search-icon"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M20.067 18.933l-4.157-4.157a6 6 0 1 0-.884.884l4.157 4.157a.624.624 0 1 0 .884-.884zM6.5 11c0-2.62 2.13-4.75 4.75-4.75S16 8.38 16 11s-2.13 4.75-4.75 4.75S6.5 13.62 6.5 11z"></path></svg></span>
		</form>
		<!-- End Search -->
	</div>
</div>
</nav>
<!-- End Nav
================================================== -->
<br>
<div class="card-columns listrecent">
	<c:forEach items="${postList }" var="list" varStatus="stqatus">
		<div class="card">
			<a href="<%=request.getContextPath() %>/board/list/${list.postId}">
				이미지 삽입 예정.
			</a>
			<div class="card-block">
				<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></h2>
				<h4 class="card-text">${list.content }</h4>
				<div class="wrapfooter">
					<span class="meta-footer-thumb">
						프로필이미지
					</span>
					<span class="author-meta">
						<span class="post-name">${list.nickname }</span>
						<span class="post-date">${list.createDate }</span><span class="post-read"></span>
					</span>
					<span class="post-read-more"><a href="<%=request.getContextPath()%>/board/list/${list.postId}" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<!-- 
<c:forEach items="${ postList}" var="list" varStatus="status" >
	<table border="1">
	<thead>
		<tr>
			<th>닉네임 </th>
			<th>아이디</th>
			<th>음식 이름</th>
			<th>음식 재료</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>	
	</thead>
	
	<tr>
		<td>${list.nickname} </td>
		<td>${list.userId} </td>
		<td>${list.foodName} </td>
		<td>
	<c:forEach items="${list.ingredients }" var="ing" varStatus="status" >
		${ing.ingredient } : ${ing.amount } /
	</c:forEach>
		</td>
		<td>${list.content} </td>
		<td>${list.createDate} </td>
	</tr>
	
	</table>
</c:forEach>



<div class="list">


</div>



 -->
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
 var scrolltop = $(document).scrollTop();
 console.log(scrolltop);
 var height = $(document).height();
 console.log(height);
 var height_win = $(window).height();
 console.log(height_win);
 
 
$(document).ready(function(){
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
                    console.log("### 2: " + start.param.curPage);
                    start.testAjax(); //ajax 호출
                } 
            }); 
        },
        // 무한 스크롤 ajax 요청
        testAjax : function() {
        	var arr = [ {curPage:start.param.curPage, pageListSize :start.param.pageListSize} ];
        	var map = {curPage:start.param.curPage};
        	console.log(map);
            $.ajax({
                type     : 'POST',
                url      : '${pageContext.request.contextPath}/board/ISajax',
                async : false,
                //contentType: "application/json",
                //data     : JSON.stringify(map),
                data : map,
                dataType : 'json',
                success : successCallback,
                error : errorCallback
            });
            // 성공
            function successCallback(data) {
            	
                if(data.length == 0 ){
                    $(".list").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
                    $(window).off("scroll");
                } 
                
     
                if(data.length != 0){
                	console.log("작동중");
                	console.log("### 3: " + start.param.curPage);
                	
                	
            		for(i = 0 ; i<data.length;i++){
	            		var reply = data[i];	
            			
            			var table = $('<table border="1"></table>');
	                	var htmlVal= "";
            			
	                	var ing= "";
	                	for(j=0; j<reply.ingredients.length;j++){
	                		ing+=reply.ingredients[j].ingredient +" : " + reply.ingredients[j].amount + " / ";
            			}
            			
	                	htmlVal+='<tr>';
            			htmlVal+='<th>닉네임</th>';
            			htmlVal+='<th>아이디</th>';
            			htmlVal+='<th>음식 이름</th>';
            			htmlVal+='<th>음식 재료</th>';
            			htmlVal+='<th>내용</th>';
            			htmlVal+='<th>작성일</th>';
            			htmlVal+='</tr>';
            			
            			htmlVal+='<tr>';
            			htmlVal+='<td>'+reply.nickname+'</td>';
            			htmlVal+='<td>'+reply.userId+'</td>';
            			htmlVal+='<td>'+reply.foodName +'</td>';
            			htmlVal+='<td>'+ing+'</td>';
            			
            			
            			htmlVal+='<td>'+reply.content +'</td>';
            			htmlVal+='<td>'+reply.createDate +'</td>';
            			htmlVal+='</tr>';
            			table.html(htmlVal);
	            		$(".list").append(table);	
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