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
<style type="text/css">

.modal-xl {
  max-width: 1600px;
}
</style>
</head>
<body id="page-top" style="overflow: auto;">

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

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
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/reported-posts">계정관리</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/reported-comments">권한관리</a>
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
                
                <div class="container-fluid" id>
                
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시글 신고 목록</h1>
                    	<div id="table">
                    	
                                     <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>                                        	
                                            <th>게시글 번호</th>
                                            <th>게시글 이름</th>
                                            <th>작성자 ID</th>
                                            <th>작성자 닉네임</th>
                                            <th>신고 횟수</th>
                                            <th>처리 상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    		
                                    	<c:forEach items="${reportList }" var="list">
	                                        <tr >
	                                            <td><a href="<%=request.getContextPath() %>/board/list/${list.postId }">${list.postId }</a> </td>
	                                            <td>${list.foodName }</td>
	                                            <td>${list.userId }</td>
	                                            <td>${list.nickName }</td>
	                                            <td><a  data-toggle="modal" data-target="#exampleModal" class="detail" href="#">${list.reportCnt }</a></td>
	                                            <td>${list.status }</td>
	                                        </tr>	                                       
                                    	</c:forEach>
                                    </tbody>
                                </table>
	                   </div>                 
                  <button type="button" id="viewAll" class="btn btn-primary mt-2">게시글 신고내역 전체 보기</button>
                  </div>
            </div>
            <!-- End of Main Content -->
         </div>
      </div>
      	
<!-- footer -->    
<%@ include file="adminFooter.jsp" %>   
<script src="<%=request.getContextPath()%>/resources/mediumish/assets/js/jquery.min.js"></script>
   
    
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

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/resources/sbadmin2//js/demo/datatables-demo.js"></script>

  	<script type="text/javascript">
  	$('#exampleModal').on('show.bs.modal', function () {
  		 $('body').removeAttr("style");
  	})
  	$(document).on("click",".detail" ,function() {
  		$(".modal-body").empty();
  		$(".modal-title").empty();
	  	var postId=$(this).parent().parent().children().first().text();
	  	console.log(postId);
	  	console.log($(this));
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/modal-p",
			type: "POST", 
			data: {postId: postId},
			success:function(result){
				var tbody = $("<tbody></tbody>");
				for(i = 0; i < result.length; i++){
				    var list = result[i];
				    var ms = list.reportTime;
				    var date = new Date(ms); 
				    var yyyy = date.getFullYear();
				    var mm = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
				    var dd = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
				    var hh = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
				    var mi = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
				    var ss = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
				    var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;

				    var tr = $("<tr></tr>");
				    tr.append($("<td></td>").text(list.reportId));
				    tr.append($("<td></td>").text(list.userId));
				    tr.append($("<td></td>").text(list.reportContent));
				    tr.append($("<td></td>").text(formattedDate));

				    tbody.append(tr);
				}

				var table = $('<table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">'+
				            '<thead>'+
				                '<tr>'+
				                    '<th>신고 번호</th>'+
				                    '<th>신고자 ID</th>'+
				                    '<th>신고 내용</th>'+
				                    '<th>신고 시각</th>'+
				                '</tr>'+
				            '</thead>'+
				        '</table>');

				table.append(tbody);
				$(".modal-body").append(table);
				$('#dataTable2').DataTable({
				  	searching: true,
			  	    ordering: true
			  	});
				
				
			}
			
		});
  	});
  	$(document).on("click","#viewAll" ,function() {
  		$("#table").empty();

		$.ajax({
			url: "${pageContext.request.contextPath}/admin/all-reported-p",
			type: "POST", 
			success:function(result){
				console.log(result[0]);
				
				
			
				var tbody = $("<tbody></tbody>");
				for(i = 0; i < result.length; i++){
				    var list = result[i];
				    var ms = list.reportTime;
				    var date = new Date(ms); 
				    var yyyy = date.getFullYear();
				    var mm = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
				    var dd = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
				    var hh = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
				    var mi = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
				    var ss = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
				    var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;

				    var tr = $("<tr></tr>");
				    tr.append($("<td></td>").text(list.reportId));
				    tr.append($("<td></td>").html('<a href="${pageContext.request.contextPath}/board/list/${list.postId }">'+list.postId+'</a>'));
				    tr.append($("<td></td>").text(list.foodName));
				    tr.append($("<td></td>").text(list.puserId));
				    tr.append($("<td></td>").text(list.nickName));
				    tr.append($("<td></td>").text(list.ruserId));
				    tr.append($("<td></td>").text(list.reportContent));
				    tr.append($("<td></td>").text(list.status));
				    tr.append($("<td></td>").text(formattedDate));

				    tbody.append(tr);
				}

				var table = $('<table class="table table-bordered" id="dataTable3" width="100%" cellspacing="0">'+
				            '<thead>'+
				                '<tr>'+
				                    '<th>신고 번호</th>'+
				                    '<th>게시글 ID</th>'+
				                    '<th>게시글 이름</th>'+
				                    '<th>게시글 작성자 ID</th>'+
				                    '<th>게시글 작성자 닉네임</th>'+
				                    '<th>신고자 ID</th>'+
				                    '<th>신고 내용</th>'+
				                    '<th>처리 상태</th>'+
				                    '<th>신고 시각</th>'+
				                '</tr>'+
				            '</thead>'+
				        '</table>');

				table.append(tbody);
				$("#table").append(table);
				$('#dataTable3').DataTable({
				  	searching: true,
			  	    ordering: true
			  	});
			$("#viewAll").text("게시글 ID별로 보기");
			$("#viewAll").attr("id", "reload");
			
			}
			
		});
  	});
	$(document).on("click","#reload" ,function() {
		location.reload();	
	});
  	
  	</script>
    

		</body>
</html>