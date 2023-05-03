<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 찾기</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/detail.css" rel="stylesheet">
<style type="text/css">
input[type="text"]:focus{
	outline: none;
	border-color: black;
}


button[name=cancel-btn] {
  border-color:#28a745;
  border-radius: 7px;
  display: inline;
  align-items: center;
  justify-content: space-between;
  background-color: transparent;
  font-size: 16px;
  padding: 0;
  background-color: #28a745;
  color: white;
}

span[name=cancel-icon] {
  margin-left: 5px;
}

span[name=cancel-icon] i {
  font-size: 16px;
}
button[name=ing]{
	border-radius: 7px;
	box-shadow: 1px 1px 1px ;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="container" style="min-height: 80vh">
	<div class="mt-5">
		<h3>가지고 있는 모든 재료를 선택해 주세요.</h3>
		 <p class="mt-3"> 선택한 재료들을 조합하여, 현재 만들 수 있는 레시피를 찾아드립니다.</p> 
	</div>
	<input style="width: 20%" class="form-control mt-5" type="text" name="ingSearch" placeholder="재료를 입력해 주세요">
	<form id="ingForm">
	
		<div  class="chosen mt-3" >
			<input type="hidden" name="list" id="chosenList">	
		</div>
	
	
	<div id="searchResult" class="mt-3">
	
	</div>
	
	<button class="btn btn-primary mt-2" id="submit" >레시피 찾기</button>
	</form>
</div>




<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
<script type="text/javascript">

	$("input[name=ingSearch]").on("propertychange change paste input",function(){
		var ingSearch= $("input[name=ingSearch]").val();
			$.ajax({
			  url: "${pageContext.request.contextPath}/board/searchAjax",
			  type: "POST", 
			  data: {ingSearch: ingSearch},
			  async : false,
			  success:function(result){
					$("#searchResult").text("");
					for(i =0; i<result.length;i++){
						var existEqaulCing = false;
						//console.log("### "+result[i]);
						$("button[name=cancel-btn]").each(function(){
							//console.log("# " +$(this).text());
							//console.log($(this).children("span[name=selected-text]").text().trim());
							if($(this).children("span[name=selected-text]").text().trim() && result[i]){
								if(result[i] == $(this).children("span[name=selected-text]").text().trim()){
									existEqaulCing = true;
									return;
								}
							}
						});
						if(existEqaulCing == false){
							//console.log("확인"+result[i]);
							//var a = $('<a name="ing" href="#">'+result[i]+'</a><span>/</span>');
							
							var a=`<button type="button" name="ing" class="btn pl-1 pr-1 mr-3 mb-2">
								  <span>`+result[i]+`</span>
								</button>`;
							
							
							$("#searchResult").append(a);	
						}
					}
					
			  },
			  error:function(){
				  console.log("실패");
			  }
			});
		
		})
	$(document).on("click", "button[name=ing]", function() {
		//console.log($(this).text());
		var cList =$("#chosenList").val();
		//var span= $("<span name='cing'>").html('<a href="#" style="color: #007bff">'+$(this).text()+'</a>');
		//$(this).next().remove();
		$(this).remove();
		
		var a=`<button type="button" name="cancel-btn" class=" pl-1 pr-1 mr-2 mb-1">
			  <span name="selected-text">`+$(this).text()+`</span>
			  <span name="cancel-icon"><i class="fa fa-times"></i></span>
			</button>`;
//		$(".chosen").append(span).append($('<span>/</span>'));
		$(".chosen").append(a);
		$("#chosenList").val(cList+ $(this).text().trim()+'$');
		
		
	});
	$(document).on("click", "button[name=cancel-btn]", function() {
	    //$(this).next().remove();	
	    $(this).remove();
	    var cList = $("#chosenList").val().replace($(this).children("span[name=selected-text]").text()+'$', '');
	    $("#chosenList").val(cList);
	    
	    var a=`<button type="button" name="ing" class="btn pl-1 pr-1 mr-3 mb-2">
			  <span>`+$(this).children("span[name=selected-text]").text()+`</span>
			</button>`;
		
		$("#searchResult").append(a);
	    
	});
	$(document).on("click", "#submit", function() {
		  var ingForm= $('#ingForm');
		  if($("#chosenList").val()==""){
			  
			  alert("재료를 선택해 주세요");
			  location.reload(true);	 
			  return
		  }
		  // 요청 URL과 HTTP 메서드 설정
		  ingForm.attr('action', 'recommend');
		  ingForm.attr('method', 'POST');

		  // 폼 제출
		  ingForm.submit();
	});
		
</script>


</body>


</html>