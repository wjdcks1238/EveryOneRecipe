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
                        <a class="collapse-item" href="<%=request.getContextPath()%>/admin/search/searchrank">검색어 순위</a>
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
		                                                 차단여부: <b> ${bvo.status }</b>
		                    </div>
		                    <div>
		                                                 최근 차단기간: ${fn:replace(bvo.startTime, 'T', ' ')} ~ ${fn:replace(bvo.endTime, 'T', ' ')}
		                    </div>
		                    <div>
		                                                 최근 차단 사유: ${bvo.reason }
		                    </div>
		                    <div>
		                      <a data-toggle="modal" data-target="#exampleModal" class="detail" href="#">전체 차단 횟수: ${bvo.blockCnt }</a> 
		                    </div>
							<c:if test="${bvo.status eq 'Y'}">
			                    <div class="mt-3">
			                    	<input type="hidden" name="blockId" value="${bvo.blockId }">
			                        <label><h4> 차단 해제일 변경</h4></label>
				                 
				                    <input 
				                    value="${bvo.endTime }" 
				                    min="2021-04-01T00:00" max="2031-04-28T00:00" 
				                    style="width: 15%" class="form-control" type="datetime-local" id="datetime" name="endTime">
			 					    <button class="btn btn-primary mt-2" type="button" id="changeBlockT">차단 해제일 변경 </button>
								    <button class="btn btn-primary mt-2" type="button" id="unblock">차단 해제</button>
			                    </div>
							</c:if>
	                  
						</c:if>
						<c:if test="${empty bvo }">
							<div>
								<c:choose>
									<c:when test="${empty userid}">
										회원이 존재하지 않습니다.
									</c:when>
									<c:otherwise>
										<b>회원 ID:${userid } </b>
										<div>
											 차단 기록이 없습니다.
										</div>
									</c:otherwise>
								</c:choose>
								
							</div>
								
						</c:if>
						
						<c:if test="${(not empty userid && empty bvo) || bvo.status eq 'N'}">
							
								<label class="mt-5"><h4>차단하기</h4></label>
							    <div class="row">
									<input disabled style="width: 15%" class="form-control ml-2" type="datetime-local" id="startTime">
									<span class="ml-1 mr-1" style="margin-top: 5px"><h4>~</h4> </span>
									<input style="width: 15%" class="form-control  " type="datetime-local" id="endTime" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new java.util.Date().getTime() + 3*24*60*60*1000) %>">
							    </div>	
								<div>
									<button id="addDay1" class="btn btn-secondary">+1 day</button>
									<button id="addDay3" class="btn btn-secondary">+3 days</button>
									<button id="addDay7" class="btn btn-secondary">+1 week</button>
								</div>
								<label class="mt-4"><h5>차단 사유</h5></label>
								<div>
								<textarea class="form-control" rows="5%" style="width: 32%" id="reason"></textarea>
								</div>
								<button class="mt-2 btn btn-danger" type="button" id="block">차단하기</button>
							
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
	$('#exampleModal').on('show.bs.modal', function () {
 		 $('body').removeAttr("style");
 	})
    
    
    // input 요소 선택
   	const startTimeInput = $('#startTime');
    
    // 1초마다 현재 시간을 가져와서 input 요소에 할당
	 setInterval(() => {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const dateString = year+'-'+month+'-'+day+'T'+hours+':'+minutes;
    startTimeInput.val(dateString);
  }, 1000);
    
    
   
	 $(document).ready(function() {
		  $('#addDay1').click(function() {
		    var datetimeInput = $('#endTime');
		    var currentDatetime = new Date(datetimeInput.val() + 'Z'); // UTC 시간을 기준으로 계산하기 위해 'Z'를 추가
		    currentDatetime.setDate(currentDatetime.getDate() + 1);
		    var newDatetimeString = currentDatetime.toISOString().slice(0, 16);
		    datetimeInput.val(newDatetimeString);
		  });
		});
	 $(document).ready(function() {
		  $('#addDay3').click(function() {
		    var datetimeInput = $('#endTime');
		    var currentDatetime = new Date(datetimeInput.val() + 'Z'); 
		    currentDatetime.setDate(currentDatetime.getDate() + 3);
		    var newDatetimeString = currentDatetime.toISOString().slice(0, 16);
		    datetimeInput.val(newDatetimeString);
		  });
		});
	 $(document).ready(function() {
		  $('#addDay7').click(function() {
		    var datetimeInput = $('#endTime');
		    var currentDatetime = new Date(datetimeInput.val() + 'Z');
		    currentDatetime.setDate(currentDatetime.getDate() + 7);
		    var newDatetimeString = currentDatetime.toISOString().slice(0, 16);
		    datetimeInput.val(newDatetimeString);
		  });
		});
    
    
    
    
    
    
    
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
	        data: {startTime: $('#startTime').val(), endTime: $('#endTime').val(), userId:'${userid}', reason:$('#reason').val() },
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
	
  	$(document).on("click",".detail" ,function() {	
  		$(".modal-body").empty();
  		$(".modal-title").empty();
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/modal-b",
			type: "POST", 
			data: {userId: '${bvo.userId }'},
			success:function(result){
				var tbody = $("<tbody></tbody>");
				for(i = 0; i < result.length; i++){
				    var list = result[i];
				    var sdate = new Date(list.startTime); 
				    var edate = new Date(list.endTime); 
				    
				    var syyyy = sdate.getFullYear();
				    var smm = sdate.getMonth() + 1 < 10 ? "0" + (sdate.getMonth() + 1) : sdate.getMonth() + 1;
				    var sdd = sdate.getDate() < 10 ? "0" + sdate.getDate() : sdate.getDate();
				    var shh = sdate.getHours() < 10 ? "0" + sdate.getHours() : sdate.getHours();
				    var smi = sdate.getMinutes() < 10 ? "0" + sdate.getMinutes() : sdate.getMinutes();
				    var sss = sdate.getSeconds() < 10 ? "0" + sdate.getSeconds() : sdate.getSeconds();
				    var startTime = syyyy + "-" + smm + "-" + sdd + " " + shh + ":" + smi + ":" + sss;
				    console.log(startTime);
				    var eyyyy = edate.getFullYear();
				    var emm = edate.getMonth() + 1 < 10 ? "0" + (edate.getMonth() + 1) : edate.getMonth() + 1;
				    var edd = edate.getDate() < 10 ? "0" + edate.getDate() : edate.getDate();
				    var ehh = edate.getHours() < 10 ? "0" + edate.getHours() : edate.getHours();
				    var emi = edate.getMinutes() < 10 ? "0" + edate.getMinutes() : edate.getMinutes();
				    var ess = edate.getSeconds() < 10 ? "0" + edate.getSeconds() : edate.getSeconds();
				    var endTime = eyyyy + "-" + emm + "-" + edd + " " + ehh + ":" + emi + ":" + ess;
				    console.log(endTime);
				    var tr = $("<tr></tr>");
				    tr.append($("<td></td>").text(list.blockId));
				    tr.append($("<td></td>").text(list.userId));
				    tr.append($("<td></td>").text(list.reason));
				    tr.append($("<td></td>").text(startTime));
				    tr.append($("<td></td>").text(endTime));

				    tbody.append(tr);
				}

				var table = $('<table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">'+
				            '<thead>'+
				                '<tr>'+
				                    '<th>차단 ID</th>'+
				                    '<th>회원 ID</th>'+
				                    '<th>차단 사유</th>'+
				                    '<th>시작 시각</th>'+
				                    '<th>종료 시각</th>'+
				                '</tr>'+
				            '</thead>'+
				        '</table>');

				table.append(tbody);
				$(".modal-body").append(table);

				
				
			}
			
		});
  	});
	
	
	
    </script>

</body>
</html>