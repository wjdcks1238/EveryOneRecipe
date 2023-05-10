<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계정정보 찾기</title>
	    <!-- Custom fonts for this template -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="<%=request.getContextPath()%>/resources/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
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
</head>
<body>

  <h1 class="h3 mb-3 text-gray-800 text-center mt-3">계정정보 찾기</h1>
	  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	        
	        <tr>
	          <th>Email</th>
	          <td>
	            
	             <input type="text" name="email" id="emailInput"/>
	            
	          </td>
	        </tr>
	        
	        
	        <tr>
	          <th>
	          </th>
	          <td>
	       		 <button id="findInfo" type="submit" >찾기</button>
				 <button onclick='window.close()'>닫기</button>
	          </td>
	        </tr>
	        
	        
	  </table>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstl/1.2/jstl.min.js"></script>
<script>

	$(document).on("click", "#findInfo", function() {
		var email = $.trim($("input[name=email]").val());
	
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/member/findidAjax",
			data:{
				"email": email
			},
			success:function(data){
				alert("비밀번는 "+"'"+data+"'"+"입니다.");
			}
		});//ajax	
	
	});
</script>


</body>


</html>
