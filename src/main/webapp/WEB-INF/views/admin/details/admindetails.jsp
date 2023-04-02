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
  <h1>사용자 상세페이지</h1>
  
  
  
  <!-- 왜 안불러오지..? -->
  <div>
  아이디 : ${admin.userId}
  </div>
  <div>
  이메일 : ${admin.email}
  </div>
  
  
  			<form id="updateForm">
					<div>
						<h3>아이디: ${memberDto.userId }</h3>
					</div>
					<label>닉네임</label>
					<input type="text" name="nickName" value="${memberDto.nickName }">
					<label>프로필 설명</label>
					<input type="text" name="profile" value="${memberDto.profile }">
					
					<button id="updateBtn" type="button">프로필 업데이트</button>
				</form>
  
	  <table>
	      <c:forEach var="admin" items="${members}">
	        <tr>
	          <th>아이디</th>
	          <td>${admin.userId}</td>
	        </tr>
	        <tr>
	          <th>닉네임</th>
	          <td>
	            <form method="post" action="<%=request.getContextPath()%>/admin/details/${admin.userId}">
	              <input type="text" name="nickName" value="${admin.nickName}" />
	              <input type="submit" value="Update" />
	            </form>
	          </td>
	        </tr>
	        <tr>
	          <th>Email</th>
	          <td>
	            <form method="post" action="<%=request.getContextPath()%>/admin/details/${admin.userId}">
	              <input type="text" name="email" value="${admin.email}" />
	              <input type="submit" value="Update" />
	            </form>
	          </td>
	        </tr>
	        <tr>
	          <th>Created At</th>
	          <td>${admin.createAt}</td>
	        </tr>
	      </c:forEach>
	  </table>
</body>
</html>
