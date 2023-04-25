<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
                
                <div class="container-fluid" >
                
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">회원 차단 관리</h1>
                    <br>
                   
                    <div class="form-group">
                  
                    	<c:if test="${not empty bvo }">
	                    
		                    <div>
		                      <b>회원 ID: ${bvo.userId }</b> 
		                    </div>
		                    <div>
		                                                 차단여부: ${bvo.status }
		                    </div>
		                    <div>
		                                                 최근 차단기간: ${fn:replace(bvo.startTime, 'T', ' ')} ~ ${fn:replace(bvo.endTime, 'T', ' ')}
		                    </div>
		                    <div>
		                                                 최근 차단 사유: ${bvo.reason }
		                    </div>
		                    <div>
		                                                전체 차단 횟수: ${bvo.blockCnt }
		                    </div>
							<c:if test="${bvo.status eq 'Y'}">
			                    <div class="mt-3">
			                    	<input type="hidden" name="blockId" value="${bvo.blockId }">
			                        <label><h4> 차단 해제일 변경</h4></label>
				                 
				                    <input 
				                    value="${bvo.endTime }" 
				                    min="2021-04-01T00:00" max="2031-04-28T00:00" 
				                    style="width: 15%" class="form-control" type="datetime-local" id="datetime" name="endTime">
			 					    <button class="mt-2" type="button" id="changeBlockT">차단 해제일 변경 </button>
								    <button type="button" id="unblock">차단 해제</button>
			                    </div>
							</c:if>
	                  
						</c:if>
						<c:if test="${empty bvo }">
							<div>
								<b>회원 ID: ${userId }</b>
							</div>
							<div>
								 차단 기록이 없습니다.
							</div>
						</c:if>
						
						<c:if test="${empty bvo || bvo.status eq 'N'}">
							
								<label class="mt-5"><h4>차단 하기</h4></label>
							    <div class="row">
									<input style="width: 15%" class="form-control ml-2" type="datetime-local" id="startTime"  value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new java.util.Date()) %>">
									<span class="ml-1 mr-1" style="margin-top: 5px"><h4>~</h4> </span>
									<input style="width: 15%" class="form-control  " type="datetime-local" id="endTime" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new java.util.Date().getTime() + 3*24*60*60*1000) %>">
							    </div>	
								<label class="mt-4"><h5>차단 사유</h5></label>
								<div>
								<textarea rows="5%" cols="40%" id="reason"></textarea>
								</div>
								<button class="mt-2" type="button" id="block">차단 하기</button>
							
						</c:if>
	    		
	    			</div>
				</div>
                    
                    	
                  </div>
            </div>
            <!-- End of Main Content -->
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
    	
	$(document).on("click","#changeBlockT" ,function() {
		var now = new Date();
		var endTime = $('input[name=endTime]').val();
		var endTimeDate = new Date(Date.parse(endTime));
		if(now<endTimeDate){			
	    	$.ajax({
	    		url: "${pageContext.request.contextPath}/admin/changeBlockT",
				type: "POST", 
				data: {endTime: $('input[name=endTime]').val(), blockId:$('input[name=blockId]').val() },
				success:function(result){
					if(result!=1){
						alert("변경에 실패했습니다.");
					}else if(result==1){
						alert("변경되었습니다.");
						location.reload();
					}
					
				}
				
	    	});
		}else{
			alert("현재시각 이후로 설정해주세요");
		}
	});
	
	
	$(document).on("click","#unblock" ,function() {
		
    	$.ajax({
    		url: "${pageContext.request.contextPath}/admin/unblock",
			type: "POST", 
			data: {blockId:$('input[name=blockId]').val()},
			success:function(result){
				if(result!=1){
					alert("해제에 실패했습니다.");
				}else if(result==1){
					alert("해제되었습니다.");
					location.reload();
				}
				
			}
			
    	});

	});
	
	
	$(document).on("click","#block" ,function() {
	    var now = new Date();
	    var endTimeDate = new Date(Date.parse($('#endTime').val()));
	    var startTimeDate = new Date(Date.parse($('#startTime').val()));
	    startTimeDate.setMinutes(startTimeDate.getMinutes() + 1);
	        
	    if (startTimeDate < now) {
	        alert("시작 시간은 현재 시간 이후여야 합니다.");
	        return;
	    }
	    if (endTimeDate <= startTimeDate) {
	        alert("종료 시간은 시작 시간 이후여야 합니다.");
	        return;
	    }
	    if ($('#reason').val().trim()=='') {
	        alert("차단 사유를 입력해야 합니다.");
	        return;
	    }
	        
	    $.ajax({
	        url: "${pageContext.request.contextPath}/admin/block",
	        type: "POST", 
	        data: {startTime: $('#startTime').val(), endTime: $('#endTime').val(), userId:'${bvo.userId}', reason:$('#reason').val() },
	        success:function(result){
	            if(result!=1){
	                alert("차단에 실패했습니다.");
	            }else if(result==1){
	                alert("차단되었습니다.");
	                location.reload();
	            }
	        }
	    });
	});
    </script>

</body>
</html>