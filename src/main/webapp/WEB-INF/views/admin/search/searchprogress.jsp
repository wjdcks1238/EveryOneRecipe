<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>모두의 레시피 관리자 모드</title>

    <!-- Custom fonts for this template -->
    <link href="<%=request.getContextPath() %>/resources/sbadmin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/resources/sbadmin2/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="<%=request.getContextPath() %>/resources/sbadmin2//vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style>
		td {
			text-align: center;
		}
	</style>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath() %>/admin">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">모두의 레시피</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath() %>/admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>관리자 모드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Management
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>직원관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/employee">계정관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>회원관리</span>
                </a>                
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/members">계정관리</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/members">권한관리</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">Ranking</div>

			<!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>검색어</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/searchword">검색어 관리</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/searchrank">검색어 순위</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/searchprogress">검색 추이</a>
                        <div class="collapse-divider"></div>
                    </div>
                </div>
            </li>


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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
                <!-- End of Topbar -->
                
                <div class="container-fluid">
                
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">검색 추이</h1>
                   		<table border="1" style="width: 70%; margin: auto;">
                   			<tr>
                   				<td>
                   					검색어
                   				</td>
                    			<td>
								  <input type="text" id="keyword" style="width: 100%;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                    			</td>
                   			</tr>
                   			<tr>
                   				<td>검색유형</td>
                   				<td>
                   					<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="레시피">
								  <label class="form-check-label" for="inlineRadio1">레시피</label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="해시태그">
								  <label class="form-check-label" for="inlineRadio2">해시태그</label>
								</div>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td>검색날짜</td>
                   				<td>
                   					<span>시작일</span>
                   					<span><input type="date" value="<%=java.time.LocalDate.now().minusDays(5)%>" id="startdate"></span>
                   					~
                   					<span>종료일</span>
                   					<span><input type="date" value="<%=java.time.LocalDate.now()%>" id="enddate"></span>
                   				</td>
                   			</tr>
                   			<tr>
                   			<td colspan="2">
                   				<button type="button" onclick="searchdata()">검색</button>
                   			</td>
                   		</table>
                   	<div class="card-header py-3">
                   		<h6 class="m-0 font-weight-bold text-primary">검색어 별 검색 통계</h6>
                   	</div>
                   	<div class="card-body">
                        <div class="chart-area">
                            <canvas id="myAreaChart"></canvas>
                        </div>
                    </div>
                  </div>
            </div>
            <!-- End of Main Content -->
         </div>
      </div>
      	

    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//js/demo/datatables-demo.js"></script>
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//js/demo/chart-area-demo.js"></script>
    
    
<!-- footer -->   
<%@ include file="/WEB-INF/views/admin/adminFooter.jsp" %> 

<script>

</script>
</body>
</html>