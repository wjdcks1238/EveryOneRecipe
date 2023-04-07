<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원 상세페이지</title>
	    <!-- Custom fonts for this template -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style>
		button {
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

$('input[name="${memberDto.authority }"]').change(function(){
	var value = $(this).val();
	var checked = $(this).prop('checked');
	if(value === 'ROLE_ADMIN'){
	    $(this).closest('td').prev('td').find('input').prop('disabled', true);
    } else {
        $(this).closest('td').prev('td').find('input').prop('disabled', false);
    }

});
</script>
  <h1 class="h3 mb-3 text-gray-800 text-center mt-3">상세페이지</h1>
	  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
	        	<th>권한부여</th>
	        	<td>
	        		승인 <input type="radio" name="authority" value="ROLE_ADMIN"/>
	        		회수 <input type="radio" name="authority" value="ROLE_MEMBER"/>
	        	</td>
	        </tr>
	        <tr>
	          <th>입사일</th>
	          <td>${memberDto.createAt}</td>
	        </tr>
	        <tr>
	          <th>퇴사일</th>
	          <td>${memberDto.createAt}</td>
	        </tr>
	        
	        <tr>
	          <th>
	          </th>
	          <td>
	       		 <button type="submit">수정</button>
				 <button onclick='window.close()'>닫기</button>
	          </td>
	        </tr>
	  </table>
</body>
</html>
