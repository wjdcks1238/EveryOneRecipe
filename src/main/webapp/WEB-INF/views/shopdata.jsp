<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchResult</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<style>
.img_div{
widht: 270px;
height: 270px;
border-radius: 20px;
border-color: gray;
border-style: solid;
border-width: 1px;
}
.ing_img{
  width:100%;
  height:100%;
  object-fit:cover;
  border-radius: 20px;
}

.title_lg{
overflow: hidden;
text-overflow: ellipsis;
word-break: break-word;

display: -webkit-box;
-webkit-line-clamp: 2;
-webkit-box-orient: vertical;
}

li > div{
color: black;
font-style: normal;
font-family: 'Malgun Gothic';
font-size: 17px;
}

#ing_price{
font-weight: bolder;
font-size: 22px;
}
.def-div{
width: 350px;
margin: auto;
padding-top: 20px;
color: black;
font-style: normal;
font-family: 'Malgun Gothic';
font-size: 17px;
}
</style>
</head>
<body>
<c:if test="${empty query }">
	<div style="width: 100%;">
		<div class="def-div">재료의 검색결과가 존재하지 않습니다.</div>
	</div>
</c:if>
<div>
<ul style="padding-top: 10px;">
<c:forEach var="search" items="${query}">
<li class="nullchk" onclick="window.open('${search.link}')" style="display:inline-block; margin:0 20px 45px 7px;
		float: left; width: 270px; height:350px; cursor: pointer;">
		<div class="img_div">
		<img src="${search.image}" class="ing_img"/>
		</div>
		<div class="title_lg">
		${search.title}
		</div>
		<div id="ing_price">
		<fmt:formatNumber value="${search.lprice}" pattern="#,###'원'"/>
		</div>	
</li>	
</c:forEach>
</ul>
</div>
<script>
$(document).ready(function(){
	if($(".nullchk").text() == ''){
		alert("검색결과가 존재하지 않습니다.")
	}
})
</script>
</body>
</html>