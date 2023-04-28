<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>게시글 상세</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/detail.css" rel="stylesheet">
<!-- Fonts -->

<style type="text/css">
.modal {
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    display: none;

    background-color: rgba(0, 0, 0, 0.4);
     
}

.modal.show {
    display: block;
}

.modal_body {
    position: absolute;
    top: 50%;
    left: 50%;

    width: 400px;
    height: 200px;

    padding: 40px;

    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);
   
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

	<div class="modal">
	  	<div class="modal_body">
	  		<div>정말 삭제하시겠습니까?</div>
			<button class="mt-5" id="deletePost">삭제</button>
		</div>
	</div>

<div class="container">
	
		<!-- Begin Post -->
			<div class="mainheading">

				<!-- Begin Top Meta -->
				<h1 class="posttitle" id="posttitle">${post.foodName }</h1>
				<div class="row post-top-meta">
					<div class="col-md-2">
						<a href="<%=request.getContextPath()%>/member/info/${post.userId}"><img class="author-thumb" src="${post.profileUrl}" alt="Sal"></a>
					</div>
					<div class="col-md-10">
						<a class="link-dark" href="<%=request.getContextPath()%>/member/info/${post.userId}">작성자 : ${post.nickname } </a>
							<c:if test="${loggedIn}">
								<span class="row ml-1"> 
									<c:if test="${loggedIn}">
										<c:set var="user" value="<%=request.getUserPrincipal().getName() %>"/>
										<c:if test="${user ne post.userId}">
											<span  id="follow">
												<c:if test="${isFollowed }">
													 <img id="followBtn" style="cursor: pointer;" alt="" width="30px" src="<%=request.getContextPath()%>/resources/icons/added.png">
												</c:if>
												<c:if test="${isFollowed eq false }">													
													 <img id="followBtn" style="cursor: pointer;" alt="" width="30px" src="<%=request.getContextPath()%>/resources/icons/add.png">
													 
												</c:if>
												
											</span>
											<span>
												<button type="button" class="ml-2 btn_open_postreport" style="border: none; background: none; font-size: xx-small;">신고</button>
											</span>
										</c:if>
										<c:if test="${user eq post.userId}">
											<span>
												<a href="<%=request.getContextPath()%>/board/list/update/${post.postId}" style="border: none; background: none; font-size: xx-small;" type="button" >수정</a>
											</span>
											<span class="ml-2">
												<a href="#" style="border: none; background: none; font-size: xx-small;" type="button" class="btn-open-popup">삭제</a>
											</span>
										</c:if>
									</c:if>
								</span>
								
							</c:if>
							<!-- 
							<a href="#" class="btn follow">Follow</a>
							 -->
						<div>
							<span class="author-description">${post.profile }</span>
						</div>
						<span class="post-date">작성일자 : ${post.createDate }</span><span class="dot"></span><span class="post-read">조회수 : ${post.lookUp }</span>
					</div>
				</div>
				<!-- End Top Menta -->


			</div>

			<!-- Begin Featured Image -->
			<img class="featured-image img-fluid" src="assets/img/demopic/10.jpg" alt="">
			<!-- End Featured Image -->

			<!-- Begin Post Content -->
			<div class="article-post">
				<blockquote>
					<ul>
	    				<c:forEach items="${post.ingredients }" var="ing" varStatus="status">
							<li><a href="#"> ${ing.ingredient } </a> : ${ing.amount }
							<button style="height: 30px" type="button" class="btn_open btn btn-sm btn-success ml-3" value="${ing.ingredient }" 
							onclick="openPopup();">구매</button>
							</li>							
						</c:forEach>						
    				</ul>
    				<div id="wrap">
	    				<div class="shadow"></div>
						<div class="popup" style="width:970px; height:800px; overflow:auto;">							
							<button type="button" class="close" onclick="closePopup();"></button>	
							<div id="ing_title"></div>					
							<div id="Context"></div>
						</div>
					</div>
				</blockquote>
				<div id="post_content">    				
	    				${post.content }
    			</div>
			</div>
			<!-- End Post Content -->

<div class="row justify-content-center">
<c:if test="${loggedIn}">
	<c:set var="user" value="<%=request.getUserPrincipal().getName() %>"/>
		<c:if test="${user ne post.userId}">
			<div class="col-2" id="bookmark">
			
				<c:if test="${isBookmarked }">
					<img id="bookmarkBtn" style="cursor: pointer;" alt="" width="60px" src="<%=request.getContextPath()%>/resources/icons/addedB.png">
				</c:if>
				<c:if test="${isBookmarked eq false }">
					<img id="bookmarkBtn" style="cursor: pointer;" alt="" width="60px" src="<%=request.getContextPath()%>/resources/icons/addB.png">
				</c:if>
			
			</div>
			
			<div class="col-1" id="like">
			
					<c:if test="${isLiked }">
					 	<img id="likeBtn" style="cursor: pointer;" alt="" width="60px" src="<%=request.getContextPath()%>/resources/icons/addedL.png">
					</c:if>
					<c:if test="${isLiked eq false }">
						<img id="likeBtn" style="cursor: pointer;" alt="" width="60px" src="<%=request.getContextPath()%>/resources/icons/addL.png">
					</c:if>
			</div>
		
		</c:if>
</c:if>
<c:if test="${!loggedIn}">
			<div class="col-1">	
				<img alt="" width="60px" src="<%=request.getContextPath()%>/resources/icons/addedL.png">
			</div>
</c:if>
<c:if test="${loggedIn}">
	<c:set var="user" value="<%=request.getUserPrincipal().getName() %>"/>
		<c:if test="${user eq post.userId}">
			<div class="col-1">	
					<img alt="" width="60px" src="<%=request.getContextPath()%>/resources/icons/addedL.png">
			</div>
		</c:if>
</c:if>
			<div class="ml-2" id="likeCount">
				: ${likeCount } 
			</div> 
</div>








			<!-- Begin Tags -->
			<div class="after-post-tags">
				<ul class="tags">
					<c:forEach items="${hashtags }" var="hashtag" >
							<li><a href="#">${hashtag }</a> </li>
					</c:forEach>
					
				</ul>
			</div>
			<!-- End Tags -->

		<!-- End Post -->


		<div id="comments" class="mt-4">
			<fieldset>
				<span>댓글</span> <span>${cmtCount }</span>
				<table id="tb_comment" style="width: 100%">
					<c:forEach items="${comment }" var="cvo" varStatus="s">
						<tr>
							<td colspan="2" id="cmtUser${cvo.cmtId}">${cvo.userId }</td>
							<td><button type="button" data-cmtid="${cvo.cmtId }" class="btn_open_commentreport" style="border: none; background: none; font-size: xx-small;">신고</button></td>
						</tr>
						<tr>
							<td colspan="2" id="commentContent${cvo.cmtId }">${cvo.content }</td>
						</tr>
						<tr>
							<td colspan="2">${cvo.updateAt }&nbsp;
								<c:choose>
									<c:when test="${loggedIn}">
										<c:if test="${uName eq cvo.userId }">
											<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="openEdit(${cvo.cmtId})">댓글 수정</button>
											<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="deleteCmt(${cvo.cmtId})">댓글 삭제</button>
										</c:if>
									</c:when>
								</c:choose>
							</td>
						<tr class="editbox ${cvo.cmtId }">
							<td colspan="2"><textarea rows="3" cols="61" name="updateBox">${cvo.content }</textarea>
								<br>
								<button type="button" data-cmtid="${cvo.cmtId}" onclick="clickUpdateComment()">수정</button>
								<button type="button" onclick="closeEdit(${cvo.cmtId})">취소</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</fieldset>
		</div>
		<div>
			<c:choose>
				<c:when test="${loggedIn}">
					<form id="frmReply">
						<fieldset>
						<legend>댓글 작성</legend>
						<div><textarea rows="3"   style="width:80%;" name="commentContent" id="commentContent"></textarea></div>
						<input type="hidden" name="boardNum" value="${post.postId }">
						<button type="button" data-uname="${uName }" class="btn reply">댓글 작성</button>
						</fieldset>
					</form>
				</c:when>
			</c:choose>
		</div>





	
	
</div>







<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$(".editbox").hide();
	$(".insertbox").hide();
});

function openEdit(num) {
	$(".editbox."+num).show();
}

function closeEdit(num) {
	$(".editbox."+num).hide();
}

function clickUpdateComment() {
	var cid = $(this).data('cmtid');
	
	$.ajax({
		url: "${pageContext.request.contextPath}/member/checkuserblocked",
		type: "GET",
		dataType:"text",
		success: function(data) {
			console.log(data);
			if(data === 'N') {
				updateComment(cid);
			} else if(data === 'Y') {
				getReason();
			}
		}
	});
	
}

function updateComment(cid) {
	$.ajax({
		url:"${pageContext.request.contextPath}/board/updateReplyAjax",
		type: "POST",
		data:{
			cmtId: cid,
			postId: ${post.postId},
			content: $("[name=updateBox]").val()
		},
		dataType:"json",
		async:false,
		success: function(result){
			if(result.length >= 0) {
				alert("댓글이 수정되었습니다.")
			} else {
				alert("댓글이 수정 되지 않았습니다. 댓글 확인 후, 다시 수정해 주세요.")
			}
			displayReply(result);
		}
	});
}

function deleteCmt(cid) {
	$.ajax({
		url: "${pageContext.request.contextPath}/board/deleteReplyAjax",
		type: "POST",
		data: {cmtId: cid
			  , postId: ${post.postId}
		},
		dataType:"json",
		async: false,
		success: function(result) {
			if(result.length >= 0) {
				alert("댓글이 삭제되었습니다.")
			} else {
				alert("댓글이삭제 되지 않았습니다. 확인하시고 다시 삭제해주세요.")
			}
			
			displayReply(result);
		},
		error: function(){
			
		}
	});
	
}

$(document).on("click", ".btn.reply", function() {
	$.ajax({
		url: "${pageContext.request.contextPath}/member/checkuserblocked",
		type: "GET",
		dataType:"text",
		success: function(data) {
			console.log(data);
			if(data === 'N') {
				submitReply();
			} else if(data === 'Y') {
				getReason();
			}
		}
	});
});

function getReason() {
	$.ajax({
		url: "${pageContext.request.contextPath}/member/getuserblocked",
		type: "GET",
		dataType: "json",
		success: function(data) {
			console.log(data);
			var reason = data.Reason;
			var startTime = data.startTime;
			var endTime = data.endTime;
			
			console.log(reason);
			console.log(startTime);
			console.log(endTime);
			alert("현재 이용이 정지되어 커뮤니티 활동이 불가능합니다.\n정지일자 : " + startTime + " ~ " + endTime +"\n정지사유 : " + reason);
			document.getElementById("commentContent").value = "";
		}
	});
}

function submitReply() {
	$.ajax({
		url: "${pageContext.request.contextPath}/board/insertReplyAjax",
		type: "POST",
		data:{
			postId: ${post.postId},
			content: $("[name=commentContent]").val()
		},
		dataType:"json",
		async:false,
		success: function(result){
			console.log(result.length);
			$("#frmReply")[0].reset();
			if(result.length > 0) {
				alert("댓글이 작성되었습니다.")
			} else {
				alert("댓글이 작성이 되지 않았습니다. 다시 작성해 주세요.")
			}
			
			displayReply(result);
		}
		, error: function() {
			
		}
	});
}

function displayReply(result) {
	console.log(result);
	
	var htmlval = '';
	for(i = 0; i<result.length; i++) {
		var reply = result[i];
		htmlval +='<tr>';
		htmlval +='<td colspan="2">'+reply.userId+'</td>';
		htmlval +='</tr>';
		htmlval +='<tr>';
		htmlval +='<td colspan="2">'+reply.content+'</td>';
		htmlval +='</tr>';
		htmlval +='<tr>';
		htmlval +='<td>'+reply.updateAt+'&nbsp;';
		var aaa = ${loggedIn};
		var userName = "${uName}";
		if(aaa) {
			htmlval += '<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="openInsert('+reply.cmtId+')">답글 쓰기</button>';
			if(userName === reply.userId) {
				htmlval += '<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="openEdit('+reply.cmtId+')">댓글 수정</button> <button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="deleteCmt('+reply.cmtId+', '+reply.postId+')">댓글 삭제</button>';
			}
		}
		htmlval +='</td>';
		htmlval +='</tr>';
		htmlval +='<tr class="editbox '+reply.cmtId +'" style="display: none;">';
		htmlval +='<td colspan="2">';
		htmlval +='<textarea rows="3" cols="64" name="updateBox">'+reply.content +'</textarea>';
		htmlval +='<br>';
		htmlval +='<button type="button" onclick="updateComment('+reply.cmtId+')">수정</button>';
		htmlval +='<button type="button" onclick="closeEdit('+reply.cmtId+')">취소</button>';
		htmlval +='</td>';
		htmlval +='</tr>';
		htmlval +='<tr class="insertbox '+reply.cmtId +'" style="display: none;">';
		htmlval +='<td colspan="2">';
		htmlval +='<textarea rows="3" cols="64" name="insertReplyBox"></textarea>';
		htmlval +='<br>';
		htmlval +='<button type="button">작성</button>';
		htmlval +='<button type="button" onclick="closeInsert('+reply.cmtId+')">취소</button>';
		htmlval +='</td>';
		htmlval +='</tr>';
	}
	
	console.log(htmlval);
	$("#tb_comment").html(htmlval);
}

$(document).on("click","#bookmarkBtn" ,function() {
	$.ajax({
		url: "${pageContext.request.contextPath}/bookmark",
		type: "POST", 
		data: {postId: ${post.postId}},
		async : false,
		success:function(result){
			if(result==false){
				var htmlVal= "<img id='bookmarkBtn' style='cursor: pointer;' alt='' width='60px' src='${pageContext.request.contextPath}/resources/icons/addB.png'>";
				//var htmlVal= "북마크 : <span id='isBookmarked'> X </span><button id='bookmarkBtn'>북마크</button>";
				$("#bookmark").html(htmlVal);
			}else if(result==true){
				var htmlVal= "<img id='bookmarkBtn' style='cursor: pointer;' alt='' width='60px' src='${pageContext.request.contextPath}/resources/icons/addedB.png'>";
				//var htmlVal= "북마크 : <span id='isBookmarked'> O </span><button id='bookmarkBtn'>북마크 취소</button>";
				$("#bookmark").html(htmlVal);
			}
		}
		
	});
});


$(document).on("click","#followBtn" ,function() {
	var isFollowed = $("#isFollowed").text();
	$.ajax({
		url: "${pageContext.request.contextPath}/follow",
		type: "POST", 
		data: {userId: "${post.userId }" },
		async : false,
		success:function(result){
			if(result==false){
				
				var htmlVal= "<img id='followBtn' style='cursor: pointer;' alt='' width='30px' src='${pageContext.request.contextPath}/resources/icons/add.png'>";
				$("#follow").html(htmlVal);
			}else if(result==true){
				var htmlVal= "<img id='followBtn' style='cursor: pointer;' alt='' width='30px' src='${pageContext.request.contextPath}/resources/icons/added.png'>";
				$("#follow").html(htmlVal);
			}
		}
		
	});
});


$(document).on("click","#likeBtn" ,function() {
	$.ajax({
		url: "${pageContext.request.contextPath}/like",
		type: "POST", 
		data: {postId: ${post.postId}},
		async : false,
		success:function(result){
			if(result[0]=='false'){
				var htmlVal= "<img id='likeBtn' style='cursor: pointer;' alt='' width='60px' src='${pageContext.request.contextPath}/resources/icons/addL.png'>";
				$("#like").html(htmlVal);
				$("#likeCount").html(": "+result[1]);
			}else if(result[0]=='true'){
				var htmlVal="<img id='likeBtn' style='cursor: pointer;' alt='' width='60px' src='${pageContext.request.contextPath}/resources/icons/addedL.png'>";
				$("#like").html(htmlVal);
				$("#likeCount").html(": "+result[1]);
			}
		}
		
	});
	
	
});


const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');

if(btnOpenPopup!=null){
	
	btnOpenPopup.addEventListener('click', () => {
	  modal.classList.toggle('show');
	
	  if (modal.classList.contains('show')) {
	    body.style.overflow = 'hidden';
	  }
	});
}

modal.addEventListener('click', (event) => {
  if (event.target === modal) {
    modal.classList.toggle('show');

    if (!modal.classList.contains('show')) {
      body.style.overflow = 'auto';
    }
  }
});

$("#deletePost").click(function(){
	$.ajax({
	  url: "${pageContext.request.contextPath}/board/delete",
	  type: "POST", 
	  data: {postId: ${post.postId}},
	  success:function(result){
			console.log(result);
			location.href ="${pageContext.request.contextPath}/board/list"
		}
	});

})

// 연관상품 관련
// 팝업창 열기
function openPopup(){
	$('.popup').show();
	$('.shadow').show();	
	
};

// 팝업창 닫기
function closePopup(){
	$('.popup').hide();
	$('.shadow').hide();
};

// esc 누르면 팝업창 닫힘
$(document).keydown(function(e){
	var code = e.keyCode || e.which;
	if(code == 27){
		$('.popup').hide();
		$('.shadow').hide();
	}	
});

//팝업 외부영역 누르면 팝업창 닫힘
$(document).mouseup(function(e){
	if($('.popup').has(e.target).length ===0){
		$('.popup').hide();
		$('.shadow').hide();
	}
});


// 버튼을 누르면 검색 데이터 가져오기 + 검색명 상단 출력
$(document).ready(function(){
	$(".btn_open").click(function(){
		var querys = $(this).attr('value');
		var title = $('#ing_title')[0];		
		title.innerText = querys
	$.ajax({
		type : "GET"
		, url : "${pageContext.request.contextPath}/shopdata"
		, async: false
		, dataType: "text"
		, data: 'query=' + querys
		, success:function(data){
			$('#Context').html(data);
		}
	});
	});
});	

$(".btn_open_postreport").click(function() {
	var title = document.getElementById("posttitle").innerHTML;
	var context = document.getElementById("post_content").innerHTML;
	var sliceContext = (context.trim()).substring(0,30) + " ...";
	var postId = ${post.postId};
	var reportUser = "${uName}";
	
	console.log(title);
	console.log(sliceContext);
	console.log(postId);
	
	window.open("${pageContext.request.contextPath}/report/post?title=" + title + "&context=" + sliceContext + "&postId=" + postId, "게시글 신고", "width=525, height=300, resizable=no");
});

$(".btn_open_commentreport").click(function() {
	
	var cmtId = $(this).data('cmtid');
	var getContent = document.getElementById("commentContent"+cmtId);
	var content = getContent.innerHTML;
	var getUser = document.getElementById("cmtUser"+cmtId);
	var reportUser = getUser.innerHTML;
	
	console.log(cmtId);
	console.log(content);
	console.log(reportUser);
	
	window.open("${pageContext.request.contextPath}/report/comment?cmtId=" + cmtId + "&content=" + content + "&reportUser=" + reportUser, "댓글 신고", "width=525, height=300, resizable=no");
});





</script>

</body>
</html>