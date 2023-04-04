<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User Details</title>
	<style>
		table {
			border-collapse: collapse;
			width: 50%;
			margin: 20px;
		}
		th, td {
			padding: 8px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}
		input[type=text], select {
			padding: 6px 10px;
			margin: 8px 0;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
		}
		input[type=submit] {
			background-color: #4CAF50;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
	</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstl/1.2/jstl.min.js"></script>
</head>
<body>
<script>
	function openPopup(event, userId) {
		let newPopup;
		event.preventDefault();
		let openUrl = "${pageContext.request.contextPath}/admin/details/"+userId;
		let popOption = "width=700,height=700";
		
		newPopup = window.open(openUrl, "_blank", popOption);
	}
	function closePopup(){
		newPopup.close();
	}
</script>
  <h1>사용자 상세페이지</h1>
	  <table>
	        <tr>
	          <th>아이디</th>
	          <td>${memberDto.userId}</td>
	        </tr>
	        <tr>
	          <th>닉네임</th>
	          <td>
	            <form method="post" action="<%=request.getContextPath()%>/admin/details/${memberDto.userId}">
	              <input type="text" name="nickName" value="${memberDto.nickName}" />
	            </form>
	          </td>
	        </tr>
	        <tr>
	          <th>Email</th>
	          <td>
	            <form method="post" action="<%=request.getContextPath()%>/admin/details/${memberDto.userId}">
	              <input type="text" name="email" value="${memberDto.email}" />
	            </form>
	          </td>
	        </tr>
	        <tr>
	          <th>입사일</th>
	          <td>${memberDto.createAt}</td>
	        </tr>
	        
	  </table>
	       	<input type="submit" value="수정" />
	        <div><button onclick='closePopup()'>닫기</button></div>
</body>
</html>
