<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로잉</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<style type="text/css">
.wrapper{
	min-height: 80vh;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>


<div class="container wrapper">
		<input type="hidden" value="${userId }" id="userId">
		<div class="row ">
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
			  <div class="card">
			    <div class="card-header">
			      <h5 class="mb-0">
			            <span>팔로잉</span>
			      </h5>
			    </div>
			    <div class="card-body">
			          <ul class="list-group">
			            <c:forEach var="fw" items="${following}">
			              <li class="list-group-item d-flex justify-content-between align-items-center">
							  <div class="media">
							    <img style="width: 30px; height: 30px; border-radius: 50%;object-fit: cover;" src="${fw.profileUrl}" class="mr-3 rounded-circle" alt="프로필 이미지">
							    <div class="media-body">
							      <a href="<%=request.getContextPath() %>/member/info/${fw.userId}" id="${fw.userId}">
							        ${fw.nickname}
							        ${fw.userId}
							      </a>
							    </div>
							  </div>
							  <span>팔로워: ${fw.followerCnt}</span>
						  </li>
			            </c:forEach>
			          </ul>
			    </div>
			  </div>
			</div>
			
			
		</div>
	</div>


<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
<script type="text/javascript">
var curPage=1;
$(window).scroll(function() {
    if($(window).scrollTop() > $(document).height() - $(window).height() - 500) { 
        curPage+=1;
        console.log("### 2: "+curPage);
        $.ajax({
            type	 : 'POST',
            url      : '${pageContext.request.contextPath}/member/followingIS',
            async : false,
            data : {curPage:curPage, userId:$("#userId").val()},
            success : function(result){
            	 if(result.length == 0 ){
                     $(".card").after('<div class="noList"><span>더 이상 표시할 항목이 없습니다.</span></div>');
                     $(window).off("scroll");
                 } 
            	 if(result.length != 0){
            		 for(i=0; i<result.length;i++){
            			 var reply=result[i];
            			 console.log(reply);
            			 var a=`<li class="list-group-item d-flex justify-content-between align-items-center">
			   							<div class="media">
										    <img style="width: 30px; height: 30px; border-radius: 50%;object-fit: cover;" src="`+reply.profileUrl+`" class="mr-3 rounded-circle" alt="프로필 이미지">
										    <div class="media-body">
										      <a href="<%=request.getContextPath() %>/member/info/`+reply.userId+`" id="`+reply.userId+`">
										      	`+reply.nickname+`
										       	`+reply.userId+`
										      </a>
										    </div>
									  	</div>
									  <span>팔로워: `+reply.followerCnt+`</span>
								  </li>`
            			 $(".list-group").append(a);
            		 }
            	 }
            	
            	
            },
        });
    } 
}); 




</script>
</body>
</html>