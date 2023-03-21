<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>

<div class="gridList"></div>


<script type="text/javascript">
$(document).ready(function(){
    start.init();
    start.testAjax();
});
var start = {
        param : {
            curPage : 1,
            pageListSize : 15,
        },
        
        init : function() {
           this.testEvent();
        },
       testEvent : function() {
            // 무한 스크롤
            $(window).scroll(function() {
                // 맨 밑으로 스크롤이 갔을경우 if문을 탑니다.
                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
                    start.param.curPage++; // 현재 페이지에서 +1 처리.
                    
                    start.testAjax(); //ajax 호출
                } 
            }); 
        },
        // 무한 스크롤 ajax 요청
        testAjax : function() {
            $.ajax({
                type     : 'POST',
                url      : '${pageContext.request.contextPath}/testAjax',
                data     : JSON.stringify(start.param), // 다음 페이지 번호와 페이지 사이즈를 가지고 갑니다.
                dataType : 'json',
                contentType: "application/json",
                success : successCallback,
                error : errorCallback
            });
            // 성공
            function successCallback(data) {
            	console.log(data[0]);
        		console.log(data[0].postId);
                if(data.size == 0 ){
                    $(".gridList").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
                } 
                
     
                if(data.size != 0){
                	 $(".gridList").append('<div class="List"><span>  </span></div>').val(data[0]);
                  
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