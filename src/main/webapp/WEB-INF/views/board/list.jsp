<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
<c:forEach items="${ postList}" var="list" varStatus="status" >
	<table>
	<tr>
		<th>닉네임 </th>
		<th>아이디</th>
		<th>음식 이름</th>
		<th>음식 재료</th>
		<th>내용</th>
		<th>작성일</th>
	</tr>	
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

<div>
 	<button id="testDelete" type="button">임시 삭제버튼</button>
</div>

<div class="gridList"></div>


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
 $("#testDelete").click(function(){
	 	var postId=86;
			$.ajax({
			  url: "./delete",
			  type: "POST", 
			  data: {postId: postId},
			  success:function(result){
					console.log(result);
				}
			});
		
		})
 </script>
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
            curPage : 1,
            pageListSize : 20,
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
        	var map = {curPage:start.param.curPage, pageListSize :start.param.pageListSize};
        	console.log(map);
            $.ajax({
                type     : 'POST',
                url      : '${pageContext.request.contextPath}/testAjax',
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
                    $(".gridList").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
                   	window.removeEventListener('scroll',testEvent);
                } 
                
     
                if(data.length != 0){
                	console.log(data[0]);
            		console.log(data[0].postId);
                	console.log("작동중");
                	console.log("### 3: " + start.param.curPage);
                	 $(".gridList").append('<div class="List">'+data[0].content+'</div>');
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