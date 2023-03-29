<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/template-pintereso/assets/css/app.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/template-pintereso/assets/css/theme.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/mediumish/assets/css/mediumish.css" rel="stylesheet">

</head>
<body>
<%@ include file="../header.jsp" %>

<!-- Begin Top Author Page
================================================== -->
    <main role="main">

    <div class="container-fluid">
    	<div class="row">
    		<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
    			<c:forEach items="${postList }" var="list" >
	    			<div class="col-md-2 card card-pin mt-3">
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
    	</div>
    </div>

    </main>
	

	<!-- End Top Author Meta
================================================== -->

<%@ include file="../footer.jsp" %>

<!-- Bootstrap core JavaScript 
================================================== -->

    <script src="<%=request.getContextPath()%>/resources/template-pintereso/assets/js/app.js"></script>
    <script src="<%=request.getContextPath()%>/resources/template-pintereso/assets/js/theme.js"></script>
    
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
                        $(".container-fluid").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
                        $(window).off("scroll");
                    } 
                    
         
                    if(data.length != 0){
                    	console.log("작동중");
                    	console.log("### 3: " + start.param.curPage);
                    	
                    	
                		for(i = 0 ; i<data.length;i++){
    	            		var reply = data[i];	
    	            		
    	            		var card = $('<div class="col-md-2 card card-pin mt-3">'+
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
