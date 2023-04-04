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
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div id="temp">
</div>
<br>
<div  class="listrecent">
<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
	<c:forEach items="${postList }" var="list" varStatus="stqatus">
	<div class="col-md-3">
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
	            		var card = $('<div class="col-md-3">'+
	            						'<div class="card">'+
		            						'<a href="<%=request.getContextPath() %>/board/list/'+reply.postId+'">'+
		            							'이미지 삽입 예정.'+
		            						'</a>'+
		            						'<div class="card-block">'+
		            							'<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/'+reply.postId+'">'+reply.foodName+'</a></h2>'+
		            							'<h4 class="card-text">'+reply.content+'</h4>'+
		            							'<div class="wrapfooter">'+
		            								'<span class="meta-footer-thumb">'+
		            									'프로필이미지'+
		            								'</span>'+
		            								'<span class="author-meta">'+
		            									'<span class="post-name">'+reply.nickname+'</span>'+
		            									'<span class="post-date">'+reply.createDate+'</span><span class="post-read"></span>'+
		            								'</span>'+
		            								'<span class="post-read-more"><a href="<%=request.getContextPath()%>/board/list/'+reply.postId+'" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>'+
		            							'</div>'+
		            						'</div>'+
	            						'</div>'+
	            					'</div>');
            			
            			
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
            			//table.html(htmlVal);
	            		//$(".list").append(table);	
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