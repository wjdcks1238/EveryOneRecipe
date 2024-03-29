<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <!-- 로고 클릭시 메인페이지로 이동 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath() %>/">
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
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>검색어</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/searchword">검색어 관리</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/keywordsearchprogress">키워드 검색 추이</a>
                        <a class="collapse-item" href="<%=request.getContextPath() %>/admin/search/datasearchprogress">일자별 검색 추이</a>
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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">Dashboard</nav>
                
                 <div class="container-fluid">
                 	<div class="row">
	                 	<!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                	게시글 신고 Total</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${reportPostCount }건</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                	댓글 신고 Total</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${reportCommentCount }건</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                 	</div>
                 	
                 	<div class="row">
                 		 <div class="col-xl-7 col-lg-7">
                 		 	<div class="card shadow mb-4">
	                 		 	<div class="card-header py3">
		                        	<h6 class="m-0 font-weight-bold text-primary">1시간 이내 실시간 검색 Top10</h6>
		                    	</div>
		                    	<div class="card-body">
			                        <div class="chart-pie" id="div_dashPie">
			                            <canvas id="dashboardPie"></canvas>
			                        </div>
			                    </div>
                 		 	</div>
                 		 </div>
                 		 <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">1주일 검색 추이 Top10</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4" id="div_weekPie">
                                        <canvas id="dashboardSearchPie"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
	                     <!-- Card Header - Dropdown -->
	                     
	                     <!-- Card Body -->
	                     
	                 </div>
                    <!-- Page Heading -->
                   
                  </div>
                
                <!-- End of Topbar -->
            </div>
            <!-- End of Main Content -->
         </div>
      </div>

</header>