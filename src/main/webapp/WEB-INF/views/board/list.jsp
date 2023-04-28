<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>게시글 목록</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div id="temp">
</div>
<br>
<div  class="listrecent">
<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
	<c:forEach items="${postList }" var="list" varStatus="stqatus">
	<div class="col-md-3 mt-3">
		<div class="card">
			<img alt="" src="${list.mainImage }" width="100%">
			<div class="card-block">
				<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></h2>
				<h4 class="card-text">${list.content }</h4>
				<div class="wrapfooter">
					<span class="meta-footer-thumb">
						프로필이미지
						<a href="<%=request.getContextPath() %>/member/info/${list.userId }">
							<img class="author-thumb" alt="" src="${list.profileUrl }">
						</a>
					</span>
					<span class="author-meta">
						<span class="post-name">${list.nickname }</span>
						<span class="post-date">${list.createDate }</span><span class="post-read"></span>
					</span>
					<span class="post-read-more">
						<c:if test="${loggedIn}">
							<c:set var="user" value="${pageContext.request.userPrincipal.name }"/>
							<c:if test="${user ne list.userId}">
								<span>
									<c:if test="${list.bookmarkCnt eq 1 }">
										<img data-postid="${list.postId }" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addedB.png">
									</c:if>
									<c:if test="${list.bookmarkCnt eq 0 }">
										<img data-postid="${list.postId }" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addB.png">
									</c:if>
								</span>
								<span>
									<c:if test="${list.likeCnt eq 1 }">
										 <img data-postid="${list.postId }" class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addedL.png">
									</c:if>
									<c:if test="${list.likeCnt eq 0 }">													
										 <img data-postid="${list.postId }" class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addL.png">
									</c:if>
								</span>
							</c:if>
						</c:if>
						<!-- 
						<img class="svgIcon-use" id="bookmarkBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addB.png">					
						<img class="svgIcon-use" id="likeBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addL.png">					
						 -->
					</span>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</div>

<div class="list">
</div>
 
<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
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
	            		//var table = $('<table border="1"></table>');
	            		bImg='';
	            		lImg='';
	            		
	            		if(${loggedIn} && reply.userId != '${pageContext.request.userPrincipal.name }'){
			            		if(reply.bookmarkCnt==1){
			            			bImg= ' <img data-postid="'+reply.postId+'" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="${pageContext.request.contextPath}/resources/icons/addedB.png">';
			            		}else{
			            			bImg= ' <img data-postid="'+reply.postId+'" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="${pageContext.request.contextPath}/resources/icons/addB.png">';
			            		}
			            		
								if(reply.likeCnt==1){
			            			lImg= ' <img data-postid="'+reply.postId+'"class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="${pageContext.request.contextPath}/resources/icons/addedL.png">';
			            		}else{
			            			lImg= ' <img data-postid="'+reply.postId+'"class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="${pageContext.request.contextPath}/resources/icons/addL.png">';
			            		}
	            		}
	            		
	            		
	            		var card = $('<div class="col-md-3 mt-3">'+
	            						'<div class="card">'+
	            						'<img alt="" src="'+reply.mainImage +'" width="100%">'+
		            						'<div class="card-block">'+
		            							'<h2 class="card-title"><a href="${pageContext.request.contextPath}/board/list/'+reply.postId+'">'+reply.foodName+'</a></h2>'+
		            							'<h4 class="card-text">'+reply.content+'</h4>'+
		            							'<div class="wrapfooter">'+
		            								'<span class="meta-footer-thumb">'+
		            									'프로필이미지'+
		            									'<a href="${pageContext.request.contextPath}/member/info/'+reply.userId+'">'+
		            										'<img class="author-thumb" alt="" src="'+reply.profileUrl+'">'+
		            									'</a>'+
		            								'</span>'+
		            								'<span class="author-meta">'+
		            									'<span class="post-name">'+reply.nickname+'</span>'+
		            									'<span class="post-date">'+reply.createDate+'</span><span class="post-read"></span>'+
		            								'</span>'+
		            								'<span class="post-read-more">' +
		            									' <span>'+
		            										bImg+
		            									'</span>'+
		            									' <span>'+
		            										lImg+
	            										'</span>'+
		            								'</span>'+
		            							'</div>'+
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

$(document).on("click",".likeBtn" ,function() {
	id=$(this).data("postid");
	console.log(id);
	console.log($(this).parent().html());
	like=$(this);
	$.ajax({
		url: "${pageContext.request.contextPath}/like",
		type: "POST", 
		data: {postId: id },
		async : false,
		success:function(result){
			if(result[0]=='false'){
				var htmlVal= "<img data-postid='"+id+"' class='likeBtn' style='cursor: pointer;' alt='' width='25px' src='${pageContext.request.contextPath}/resources/icons/addL.png'>";
				like.parent().html(htmlVal);
				 
			}else if(result[0]=='true'){
				var htmlVal= "<img data-postid='"+id+"' class='likeBtn' style='cursor: pointer;' alt='' width='25px' src='${pageContext.request.contextPath}/resources/icons/addedL.png'>";
				like.parent().html(htmlVal);
			}
		}
		
	});
});
$(document).on("click",".bookmarkBtn" ,function() {
	id=$(this).data("postid");
	console.log(id);
	console.log($(this).parent().html());
	bookmark=$(this);
	$.ajax({
		url: "${pageContext.request.contextPath}/bookmark",
		type: "POST", 
		data: {postId: id },
		async : false,
		success:function(result){
			if(result==false){
				var htmlVal= "<img data-postid='"+id+"' class='bookmarkBtn' style='cursor: pointer;' alt='' width='25px' src='${pageContext.request.contextPath}/resources/icons/addB.png'>";
				bookmark.parent().html(htmlVal);
				 
			}else if(result==true){
				var htmlVal= "<img data-postid='"+id+"' class='bookmarkBtn' style='cursor: pointer;' alt='' width='25px' src='${pageContext.request.contextPath}/resources/icons/addedB.png'>";
				bookmark.parent().html(htmlVal);
			}
		}
		
	});
});
</script>


</body>
</html>