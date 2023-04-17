<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>게시글 유저 신고페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
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
</style>
</head>
<body>
	<div>
		신고하기
		<input type="text" name="reportId" value="${cmtId }" hidden="hidden">
		<input type="text" name="reportContent" value="${content }" hidden="hidden">
		<input type="text" name="reportUaer" value="${reportUser }" hidden="hidden">
		<input type="text" name="loginedUser" value="${userName }" hidden="hidden">
	</div>
	<div>
		<table border="1" style="width: 100%; height: 100%">
			<tr>
				<td>신고사유</td>
				<td>
					<ul>
						<li><input class="form-check-input" type="radio" name="reportOption" id="inlineRadio1" value="욕설/비방" checked="checked">
				 			<label class="form-check-label" for="inlineRadio1">욕설/비방</label>
				 		</li>
						<li><input class="form-check-input" type="radio" name="reportOption" id="inlineRadio2" value="광고">
				 			<label class="form-check-label" for="inlineRadio2">광고</label>
				 		</li>
						<li><input class="form-check-input" type="radio" name="reportOption" id="inlineRadio3" value="커뮤니티 운영규칙 위반">
				 			<label class="form-check-label" for="inlineRadio3">커뮤니티 운영규칙 위반</label>
				 		</li>
						<li><input class="form-check-input" type="radio" name="reportOption" id="inlineRadio4" value="기타">
				 			<label class="form-check-label" for="inlineRadio4">기타</label><br>
				 			<textarea rows="3" cols="50" id="otherReport" placeholder="위 항목에 없거나 추가할 내용이 있으시면 세부 내용을 적어주세요." disabled></textarea>
				 		</li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
	<hr>
	<div>
		<button type="button" id="submitReport">신고하기</button>
		<button type="button" id="closeWindow" onclick="closeWindow()">취소</button>
	</div>

<script>
	function closeWindow() {
		window.close();
	}

	$('input:radio[name=reportOption]').change(function() {
		toggleRadio();
	});
	
	function toggleRadio() {
		var inlineRadio4 = document.getElementById("inlineRadio4");
		var otherReport = document.getElementById("otherReport");
		
		if(!inlineRadio4.checked) {
			otherReport.disabled = true;
			console.log(inlineRadio4.checked);
		} else {
			otherReport.disabled = false;
			console.log(inlineRadio4.checked);
		}
	}
	
	$("#submitReport").click(function() {
		var id = $("[name=reportId]").val();
		var content = $("[name=reportContent]").val();
		var user = $("[name=reportUaer]").val();
		var loginedUser = $("[name=loginedUser]").val();
		var reportOption = document.getElementsByName("reportOption");
		var inlineRadio4 = document.getElementById("inlineRadio4");
		var otherReport = document.getElementById("otherReport");
		
		var selectedRadio = "";
		var otherReportContext = "";
		for(var i=0;i<reportOption.length;i++) {
			if(reportOption[i].checked) {
				if(reportOption[i].checked == inlineRadio4.checked) {
					selectedRadio = reportOption[i].value;
					otherReportContext = otherReport.value;
					break;
				} else {
					selectedRadio = reportOption[i].value;
					break;
				}
			}
		}
		
		console.log(id);
		console.log(content);
		console.log(user);
		console.log(loginedUser);
		console.log(selectedRadio);
		console.log(otherReportContext);
		
		
		
		$.ajax({
			type: "POST",
			url: "<%=request.getContextPath()%>/report/comment",
			data: {
				selectedRadio: selectedRadio,
				otherReportContext: otherReportContext,
				cmtId: id
			},
			async: false,
			success: function(result) {
				if(result == 1) {
					alert("신고가 정상적으로 접수되었습니다.");
				} else if(result == 0){
					alert("신고가 정상 접수가 되지 않았습니다. 확인 후 다시 신고 바랍니다.");
				} else {
					alert("알 수 없는 이유로 신고 기능이 작동하지 않았습니다. 관리자에게 문의 바랍니다.");
				}
				window.close();
			}
		});
	});
</script>
</body>
</html>