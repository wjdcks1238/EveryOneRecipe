<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/detail.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="wrap">
	<div class="shadow" style="z-index: 99" ></div>
	<div  class="popup" style="width:970px; height:800px; overflow:auto; z-index: 100;">							
		<button type="button" class="close" onclick="closePopup();"></button>	
		<div id="ing_title"></div>					
		<div id="Context"></div>
	</div>
</div>

	<div class="container">
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center mb-4">선택한 재료 목록</h3>
    </div>
  </div>
  <div class="row text-center">
    <div class="col">
    	<c:forEach var="list" items="${chosenList  }" > 
     		<button type="button" name="ing" class="btn pl-1 pr-1 mr-3 mb-2">
				<span> ${list }</span>
			</button>
    	</c:forEach>
    </div>
  </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center mb-5">선택한 재료들로 만들 수 있는 레시피 목록</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList0}" var="list">
	      <div class="col">
	        <div class="card mb-3" style="max-width: 253px;">
	          <div class="card-body p-3" >
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}"><b>${list.foodName}</b></a> </h5>
	            <img style="max-height: 350px" alt="" src="${list.mainImage }" width="100%" >
	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient}: ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center mb-5">1개의 재료만 더 있으면 가능한 레시피</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList1}" var="list" varStatus="status">
	      <div class="col">
	        <div class="card mb-3" style="max-width: 253px;">
	          <div class="card-body p-3" >
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}"><b>${list.foodName}</b></a> </h5>
	             <img style="max-height: 350px" alt="" src="${list.mainImage }" width="100%">
	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient}: ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	            <p class="card-text">부족한 재료: 
	            	<c:forEach var="ing" items="${needList1[status.index]}" varStatus="status">
						<a class="open" href="#" onclick="openPopup();event.preventDefault()">${ing }</a><c:if test="${not status.last}">,</c:if>
	            	</c:forEach>
	            </p>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center mb-5">2개의 재료만 더 있으면 가능한 레시피</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList2}" var="list" varStatus="status">
	      <div class="col">
	        <div class="card mb-3" style="max-width: 253px;">
	          <div class="card-body p-3" >
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}"><b>${list.foodName}</b></a> </h5>
	             <img style="max-height: 350px" alt="" src="${list.mainImage }" width="100%" >	
	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient}: ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	            <p class="card-text">부족한 재료: 
	            	<c:forEach var="ing" items="${needList2[status.index]}" varStatus="status">
						<a href="#" class="open" onclick="openPopup();event.preventDefault()">${ing }</a><c:if test="${not status.last}">,</c:if>
	            	</c:forEach>
	            </p>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center mb-5">3개의 재료만 더 있으면 가능한 레시피</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList3}" var="list" varStatus="status">
	      <div class="col-3 ">
	        <div class="card mb-3" style="max-width: 253px;">
	          <div class="card-body p-3" >
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}"><b>${list.foodName}</b></a> </h5>
	             <img style="max-height: 350px" alt="" src="${list.mainImage }" width="100%" >
	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient}: ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	             <p class="card-text">부족한 재료: 
	            	<c:forEach var="ing" items="${needList3[status.index]}" varStatus="status">
						<a class="open" href="#" onclick="openPopup();event.preventDefault()">${ing }</a><c:if test="${not status.last}">,</c:if>
	            	</c:forEach>
	            </p>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  </div>
  

	<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>

<script type="text/javascript">

//연관상품 관련
//팝업창 열기
function openPopup(){
	$('.popup').show();
	$('.shadow').show();	
	
};

//팝업창 닫기
function closePopup(){
	$('.popup').hide();
	$('.shadow').hide();
};

//esc 누르면 팝업창 닫힘
$(document).keydown(function(e){
	var code = e.keyCode || e.which;
	if(code == 27){
		$('.popup').hide();
		$('.shadow').hide();
	}	
});

//팝업 외부영역 누르면 팝업창 닫힘
$(document).mouseup(function(e){
	if($('.popup').has(e.target).length ===0){
		$('.popup').hide();
		$('.shadow').hide();
	}
});


//버튼을 누르면 검색 데이터 가져오기 + 검색명 상단 출력
$(document).ready(function(){
	$(".open").click(function(){
		var querys = $(this).text();
		var title = $('#ing_title')[0];		
		title.innerText = querys
	$.ajax({
		type : "GET"
		, url : "${pageContext.request.contextPath}/shopdata"
		, async: false
		, dataType: "text"
		, data: 'query=' + querys
		, success:function(data){
			console.log(data);
			$('#Context').html(data);
			
		}
	});
	});
});	

</script>


</body>
</html>