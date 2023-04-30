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
	<div class="container">
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center">선택한 재료 목록</h3>
    </div>
  </div>
  <div class="row">
    <div class="col">
      ${chosenList}
    </div>
  </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center">선택한 재료들로 만들 수 있는 레시피 목록</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList0}" var="list">
	      <div class="col">
	        <div class="card mb-3">
	          <div class="card-body p-3">
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}">${list.foodName}</a> </h5>
	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient} ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center">1개의 재료만 더 있으면 가능한 레시피</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList1}" var="list" varStatus="status">
	      <div class="col">
	        <div class="card mb-3">
	          <div class="card-body p-3">
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}">${list.foodName}</a> </h5>
	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient} ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	            <p class="card-text">부족한 재료: ${needList1[status.index]}</p>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center">2개의 재료만 더 있으면 가능한 레시피</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList2}" var="list" varStatus="status">
	      <div class="col">
	        <div class="card mb-3">
	          <div class="card-body p-3">
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}">${list.foodName}</a> </h5>	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient} ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	            <p class="card-text">부족한 재료: ${needList2[status.index]}</p>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  <div class="row mt-5">
    <div class="col">
      <h3 class="text-center">3개의 재료만 더 있으면 가능한 레시피</h3>
    </div>
  </div>
    <div class="row">
	  <c:forEach items="${recList3}" var="list" varStatus="status">
	      <div class="col-3 ">
	        <div class="card mb-3">
	          <div class="card-body p-3">
	            <h5 class="card-title"><a href="<%=request.getContextPath()%>/board/list/${list.postId}">${list.foodName}</a> </h5>
	            <ul>
	              <c:forEach items="${list.ingredients}" var="ing">
	                <li>${ing.ingredient} ${ing.amount}</li>
	              </c:forEach>
	            </ul>
	            <p class="card-text">부족한 재료: ${needList3[status.index]}</p>
	          </div>
	        </div>
	      </div>
	  </c:forEach>
    </div>
  </div>
  

	<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
</body>
</html>