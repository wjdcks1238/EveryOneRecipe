<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/board/fileupload" method="post">
		<input type="button" value="파일추가" onClick="fn_addFile()">
		<div id="d_file">
		
		</div>
		<input type="submit" value="업로드">
	</form>
	
	<script>
		var cnt=1
		function fn_addFile(){
			$("#d_file").append("<br>"+"<input type='file' name='report"+cnt+"'>");
			cnt++;
		}
	</script>
</body>
</html>