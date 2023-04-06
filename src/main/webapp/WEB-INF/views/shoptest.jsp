<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
</head>
<body>
<h1>네이버쇼핑 API</h1>

<!-- 
<form action="/everyrecipe/shopdata" method="GET">
	<input type="text" name="query">
	<button type="submit">검색</button>
</form>
 -->

<input type="text" name="query">
<button type="button" id="ingbtn">구매</button>

<div id="Context">
</div>


<script>
$("#ingbtn").on("click", getShopList);
function getShopList(){
	var querys = $("input[name=query]").val();
	console.log(querys);
	$.ajax({
		type : "GET"
		, url : "<%=request.getContextPath()%>/shopdata"
		, async: false
		, dataType: "text"
		, data: 'query=' + querys
		, success:function(data){
			console.log(data)
			$('#Context').html(data);
		}
	});
}
</script>
</body>
</html>


