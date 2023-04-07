<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<style>
		
.popup{border: 1px solid #dcdcdc;position: fixed;left: 50%;top: 50%;transform: translate(-50%,-50%);padding: 10px;display: none;background: #fff}
.popup .close{background: none;border: 0;position: absolute;right: 10px;top: 10px;font-size: 20px; display:inline-block;*display:inline;}
.popup .close:after{display: inline-block; content:"\00d7"; font-size:30px;}		
.shadow{position: fixed;left: 0;top: 0;background: rgba(0, 0, 0, 0.52);width: 100%;height: 100vh;display: none}
</style>
</head>
<body>
<h1>네이버쇼핑 API</h1>

<!-- 
<form action="/everyrecipe/shopdata" method="GET">
	<input type="text" name="query">
	<button type="submit">검색</button>
</form>
 -->
 
<div id="wrap">
<input type="text" name="query">
<button type="button" class="btn_open" onclick="javascript:openPopup('shop');">구매</button>
	<div class="shadow"></div>
	<div class="popup shop" style="height:700px; overflow:auto; ">
		<button type="button" class="close" onclick="closePopup()">			
		</button>
		<div id="Context">
		</div>
	</div>
</div>

<script>
//팝업창 열기
function openPopup(name){
	document.get
	$('.'+ name).show();
	$(".shadow").show();	
	
}

//팝업창 닫기
function closePopup(cl){
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

//버튼을 누르면 검색값 가져오기
$(".btn_open").on("click", getShopList);
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


