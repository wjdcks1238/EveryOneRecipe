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
<style type="text/css">
input[type="text"]:focus{
	outline: none;
	border-color: black;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="container" style="min-height: 80vh">

	<input style="width: 20%" class="form-control mt-5" type="text" name="ingSearch" placeholder="재료를 입력해 주세요">
	<form action="recommend" method="post">
	
		<div  class="chosen mt-3" >
			<input type="hidden" name="list" id="chosenList">	
		</div>
	
	
	<div id="searchResult">
	
	</div>
	
	<button class="btn btn-dark mt-2" type="submit">레시피 찾기</button>
	</form>
</div>






<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
<script type="text/javascript">

	$("input[name=ingSearch]").on("propertychange change paste input",function(){
		var ingSearch= $("input[name=ingSearch]").val();
			$.ajax({
			  url: "searchAjax",
			  type: "POST", 
			  data: {ingSearch: ingSearch},
			  async : false,
			  success:function(result){
					$("#searchResult").text("");
					for(i =0; i<result.length;i++){
						var existEqaulCing = false;
						console.log("### "+result[i]);
						$("span[name=cing]").each(function(){
							console.log("# " +$(this).text());
							if($(this).text() && result[i]){
								if(result[i] == $(this).text()){
									existEqaulCing = true;
									return;
								}
							}
						});
						if(existEqaulCing == false){
							console.log("확인"+result[i]);
							var a = $('<a name="ing" href="#">'+result[i]+'</a><span>/</span>');
							$("#searchResult").append(a);	
						}
					}
					
			  },
			  error:function(){
				  console.log("실패");
			  }
			});
		
		})
	$(document).on("click", "a[name=ing]", function() {
		console.log($(this).text());
		var cList =$("#chosenList").val();
		var span= $("<span name='cing'>").text($(this).text());
		$(this).remove();
		$(".chosen").append(span).append($('<span>/</span>'));
		$("#chosenList").val(cList+ $(this).text()+'$');
		
		
	});
		
</script>


</body>


</html>