<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<title>모두의 레시피 관리자 모드</title>

<!--스위치 스타일 추가 -->
<style type="text/css">
.toggleSwitch {
	width: 70px;
	margin: 30px;
	height: 35px;
	display: block;
	position: relative;
	border-radius: 30px;
	background-color: #fff;
	box-shadow: 0 0 16px 3px rgba(0 0 0/ 15%);
	cursor: pointer;
}

.toggleSwitch .toggleButton {
	width: 28px;
	height: 28px;
	position: absolute;
	top: 50%;
	left: 4px;
	transform: translateY(-50%);
	border-radius: 50%;
	background: #f03d3d;
}

.toggleSwitch.active {
	background: #f03d3d;
}

.toggleSwitch.active .toggleButton {
	left: calc(100% - 44px);
	background: #fff !important;
}

.toggleSwitch, .toggleButton {
	transition: all 0.2s ease-in;
}

.toggleSwitch.blue.active {
	background: #5151e5;
}

.toggleSwitch.blue .toggleButton {
	background: #5151e5;
}
/* checked 부분을 active란 클래스가 포함되어있는지 여부로 바꾸기 */
.toggleSwitch.active {
	background: #f03d3d;
}

.toggleSwitch.active .toggleButton {
	left: calc(100% - 32px);
	background: #fff;
}
</style>
<!-- Custom fonts for this template -->
<link
	href="<%=request.getContextPath()%>/resources/sbadmin2/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/sbadmin2/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Custom styles for this page -->
<link
	href="<%=request.getContextPath()%>/resources/sbadmin2//vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>
<body id="page-top">
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


	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" />

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/admin">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">모두의 레시피</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>관리자 모드</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Management</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>직원관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/admin/employee">계정관리</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>회원관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">회원 관리:</h6>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/admin/members">계정관리</a> <a
							class="collapse-item"
							href="<%=request.getContextPath()%>/admin/members">권한관리</a>
					</div>
				</div></li>
			<li class="nav-item">
			    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
			        aria-expanded="true" aria-controls="collapseThree">
			        <i class="fas fa-fw fa-minus-circle"></i>
			        <span>신고 관리</span>
			    </a>
			    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
			        <div class="bg-white py-2 collapse-inner rounded">
			            <a class="collapse-item" href="<%=request.getContextPath()%>/admin/reported-posts">게시글 관리</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/reported-comments">댓글 관리</a>
			        </div>
			    </div>
			</li>
			<li class="nav-item">
			    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
			        aria-expanded="true" aria-controls="collapseFour">
			        <i style="margin-left: 3px" class="fas fa-ban"></i>
			        <span>비속어/금지어 관리</span>
			    </a>
			    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionSidebar">
			        <div class="bg-white py-2 collapse-inner rounded">
			            <a class="collapse-item" href="<%=request.getContextPath()%>/admin/addBadwords">추가</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/deleteBadwords">삭제</a>
			        </div>
			    </div>
			</li>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Ranking</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>검색어</span>
			</a>
				<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/searchword">검색어 관리</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/searchrank">검색어 순위</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/keywordsearchprogress">키워드 검색 추이</a>
                        <a class="collapse-item" href="<%=request.getContextPath() %>/admin/search/datasearchprogress">일자별 검색 추이</a>
                        <div class="collapse-divider"></div>
                    </div>
                </div>
				</div></li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
				<!-- End of Topbar -->

				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">직원목록</h1>

					<!--  회원목록 모달창으로 띄우기  -->
					<button id="open-modal" type="button" class="btn btn-primary"
						data-toggle="modal" data-target="#memberlist">회원목록</button>
					<div id="memberlist" class="modal">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 700px;">
								<div class="modal-header">
									<h5 class="modal-title">회원목록</h5>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<table class="table table-bordered dataTable no-footer"
										id="dataTable" width="100%" cellspacing="0" role="grid"
										aria-describedby="dataTable_info" style="width: 100%;">
										<thead>
											<tr role="row">
												<th class="sorting sorting_asc" tabindex="0"
													aria-controls="dataTable" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="ID: activate to sort column desending"
													style="width: 80.0312px">ID</th>
												<th>닉네임</th>
												<th>입사일</th>
												<th>권한부여</th>
											</tr>
										</thead>
										<c:forEach var="admin" items="${selectList}">
											<tr role="odd">
												<td class="sorting_1"><c:out value="${admin.userId }" /></td>
												<td><c:out value="${admin.nickName}" /></td>
												<td><c:out value="${admin.createAt}" /></td>
												<!-- 권한부여 버튼 -->
												<td>
													<div>
														<input type="checkbox" id="switch" hidden> <label
															for="username" class="toggleSwitch blue"
															data-user-id="${admin.userId}"
															data-user-role="${admin.authority} "> <span
															class="toggleButton"></span>
														</label>
													</div>
												</td>
											</tr>
										</c:forEach>
									</table>
									<div id="resultList"></div>
								</div>
								<div class="modal-footer">
									<button type="button" id="closebtn" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>



					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>직원ID</th>
								<th>닉네임</th>
								<th>입사일</th>
								<th>퇴사일</th>
								<th>권한</th>
								<th>권한여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="admin" items="${memberDto}">
								<tr>
									<td>
										<!-- 팝업을 모달로 변경하기 --> <a
										href="<%=request.getContextPath()%>/admin/details/${admin.userId}"
										onclick="openPopup(event, '${admin.userId}')"> <c:out
												value="${admin.userId }" />
									</a>
									</td>
									<td><c:out value="${admin.nickName}" /></td>
									<td><c:out value="${admin.createAt}" /></td>
									<td>퇴사</td>
									<!-- 관리자 -->
									<td><c:if test="${admin.authority =='ROLE_ADMIN' }">
											<c:out value="관리자" />
										</c:if> <c:if test="${admin.authority != 'ROLE_ADMIN' }">
											<c:out value="${admin.authority}" />
										</c:if></td>
									<!-- 권한여부 표시 코드 구현-->
									<td><c:out value="${admin.authority}" /></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- End of Main Content -->
		</div>
	

	<!-- Bootstrap core JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%=request.getContextPath()%>/resources/sbadmin2//js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/sbadmin2//js/demo/datatables-demo.js"></script>

	<!-- footer -->
	<%@ include file="adminFooter.jsp"%>

	<script>
const openModalBtn = document.getElementById('open-modal');
const modal = document.getElementById('modal');

$("[data-dismiss=modal]").click(function(){
  modal.style.display = 'none';
});

openModalBtn.addEventListener('click', ()=> {
  modal.style.display = 'block';
});

//권한 부여 스위치
const toggleList = document.querySelectorAll(".toggleSwitch");

toggleList.forEach(($toggle) => {
	
    var userId = $toggle.dataset.userId;
    var userRole = $toggle.dataset.userRole;
    
    if(userRole.trim() === "ROLE_ADMIN"){
    	$toggle.classList.add('active');
    	
    }else{
    	$toggle.classList.remove('active');
    	
    } 
    
  $toggle.onclick = () => {
	  $toggle.classList.toggle('active');
	  
	  var checked = $toggle.classList.contains('active') ? true : false;
	  
    $.ajax({
      url: "<%=request.getContextPath()%>/admin/employee",
      method: 'PATCH',
      contentType: 'application/json',
      data: JSON.stringify({
        userId: userId,
        role: checked ? 'ROLE_ADMIN' : 'ROLE_USER'
      }),
      success: function(response) {
        console.log(response);
        
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  }
});
//닫기 버튼 눌렀을 때 관리자 페이지 리로드 시키기
 const closeBtn = document.getElementById('closebtn');
 closeBtn.addEventListener('click', ()=> {
	  location.reload();
	});

</script>


</body>
</html>