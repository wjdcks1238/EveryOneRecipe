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

button[name=cancel-btn] {
  border-color:#dc3545;
  border-radius: 7px;
  display: inline;
  align-items: center;
  justify-content: space-between;
  font-size: 16px;
  padding: 0;
  background-color: #dc3545;
  color: white;
}
button[name=cancel-cancel-btn] {
  border-color:#28a745;
  border-radius: 7px;
  display: inline;
  align-items: center;
  justify-content: space-between;
  font-size: 16px;
  padding: 0;
  background-color: #28a745;
  color: white;
}

span[name=cancel-icon] {
  margin-left: 5px;
}

span[name=cancel-icon] i {
  font-size: 16px;
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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
                <!-- End of Topbar -->
                
                <div class="container-fluid">
                    <!-- Page Heading -->
                	 <h1 class="h3 mb-5 text-gray-800">비속어, 금지어 삭제</h1>
                	 <div id="badwordDiv">
	                     <c:forEach items="${badwords }" var="word">
	                     	
	                     		<button type="button" name="cancel-btn" class=" pl-1 pr-1 mr-2 mb-1">
				 		 			<span name="selected-text">${word }</span>
				  					<span name="cancel-icon"><i class="fa fa-times"></i></span>
								</button>
	                     	
	                     </c:forEach>
                	 </div>
                     
                    <hr> 
                    <div id="deleteDiv">
                    
                    </div>
                    <input id="search" class="form-control mt-3" style="width:400px;"  type="text" placeholder="검색"> 
                    <button id="submit" class="mt-3 btn btn-primary" type="button">적용</button>
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

    $(document).on("click","button[name=cancel-btn]", function(){
    	//console.log($(this).children("span[name=selected-text]").text().trim());
    	$("#deleteDiv").append(`
    			<button type="button" name="cancel-cancel-btn" class=" pl-1 pr-1 mr-2 mb-1">
		 			<span name="selected-text2">`+$(this).children("span[name=selected-text]").text().trim()+`</span>
					<span name="cancel-icon"><i class="fa fa-times"></i></span>
				</button>`);
    	$(this).remove();
    	
    });
    $(document).on("click","button[name=cancel-cancel-btn]", function(){
    	//console.log($(this).children("span[name=selected-text2]").text().trim());
    	$("#badwordDiv").append(`
    			<button type="button" name="cancel-btn" class=" pl-1 pr-1 mr-2 mb-1">
		 			<span name="selected-text">`+$(this).children("span[name=selected-text2]").text().trim()+`</span>
					<span name="cancel-icon"><i class="fa fa-times"></i></span>
				</button>`);
    	$(this).remove();
    	
    });
    
    
    $("#search").on("propertychange change paste input",function(){
    	var keyword= $("#search").val().trim();
    	$.ajax({
			  url: "${pageContext.request.contextPath}/admin/badwordSearch",
			  type: "POST", 
			  data: {keyword: keyword},
			  async : false,
			  success:function(result){
				  console.log(result);
				  $("#badwordDiv").empty();
				  
				  for(i=0;i<result.length;i++){
					  var existWord = false;
					  $("span[name=selected-text2]").each(function(){
						  console.log(result[i].trim());
						  console.log($(this).text().trim());
						  console.log(result[i].trim()==$(this).text().trim());
						  if($(this).text().trim()&&result[i].trim()){
							  if(result[i]==$(this).text().trim()){
								  existWord = true;
								  return;
							  }
						  }
						  
					  })
					  
					  if(existWord==false){
						  $("#badwordDiv").append(`<button type="button" name="cancel-btn" class=" pl-1 pr-1 mr-2 mb-1">
									 		 			<span name="selected-text">`+result[i]+`</span>
									  					<span name="cancel-icon"><i class="fa fa-times"></i></span>
													</button>`);
						  
					  }
				  }
				  
			  },
			  error:function(){
				  console.log("실패");
			  }
			});
    });
    $("#submit").on("click",function(){
    	var words = $('span[name="selected-text2"]').map(function() {
    	    return $(this).text().trim();
    	}).get();
    	console.log(words);
    	//var words= $("#deleteDiv").text();
    	if(words==''){
    		alert("취소할 비속어/금지어를 선택해주세요");
    		return;
    	}
    	$.ajax({
			  url: "${pageContext.request.contextPath}/admin/deleteWords",
			  type: "POST", 
			  data: {words: words},
			  success:function(result){
				  if(result=="true"){
					  alert("적용되었습니다.");
				  }else{
					  alert("에러가 발생했습니다. 이미 삭제되었을 수 있습니다.");
					  
				  }
				  location.reload();

				  
			  },
			  error:function(){
				  console.log("실패");
			  }
			});
    });
    
    
    
    
    </script>

</body>
</html>