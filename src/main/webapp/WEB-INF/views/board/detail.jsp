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
<!-- Fonts -->
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>



<sec:authorize var="loggedIn" access="isAuthenticated()" />






<div class="container">
	
		<!-- Begin Post -->
		
			<div class="mainheading">

				<!-- Begin Top Meta -->
				<h1 class="posttitle">${post.foodName }</h1>
				<div class="row post-top-meta">
					<div class="col-md-2">
						<a href="author.html"><img class="author-thumb" src="${member.profileUrl}" alt="Sal"></a>
					</div>
					<div class="col-md-10">
						<a class="link-dark" href="<%=request.getContextPath()%>/member/info/${post.userId}">작성자 : ${post.nickname } </a>
							<c:if test="${loggedIn}">
								<span class="row"> 
									<c:if test="${loggedIn}">
										<c:set var="user" value="<%=request.getUserPrincipal().getName() %>"/>
										<c:if test="${user ne post.userId}">
											<div id="follow">
												팔로우 :
	
												<c:if test="${isFollowed }">
													<span id="isFollowed">O</span>
													<button id="followBtn">팔로우 취소</button>
												</c:if>
												<c:if test="${isFollowed eq false }">
													<span id="isFollowed">X</span>
													<button id="followBtn">팔로우</button>
												</c:if>
	
											</div>
										</c:if>
									</c:if>
								</span>
							</c:if>
							<a href="#" class="btn follow">Follow</a>
						<div>
							<span class="author-description">${member.profile }</span>
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
							<li><a href="#"> ${ing.ingredient } </a> : ${ing.amount }</li>
						</c:forEach>
    				</ul>
				</blockquote>
				<div id="post_content">    				
	    				${post.content }
    			</div>
			</div>
			<!-- End Post Content -->

<c:if test="${loggedIn}">
	<c:set var="user" value="<%=request.getUserPrincipal().getName() %>"/>
	<div class="row justify-content-center">
		<div class="col-2" id="bookmark">
		북마크 :
		
			<c:if test="${isBookmarked }">
				<span id="isBookmarked">O</span>
				<button id="bookmarkBtn">북마크 취소</button>
			</c:if>
			<c:if test="${isBookmarked eq false }">
				<span id="isBookmarked">X</span>
				<button id="bookmarkBtn">북마크 하기</button>
			</c:if>
		
		</div>
		<c:if test="${user ne post.userId}">
			
			<div class="col-2" id="like">
			좋아요 :
					<c:if test="${isLiked }">
					 	<span id="isLiked">O</span> 
						<button id="likeBtn">좋아요 취소</button>
					</c:if>
					<c:if test="${isLiked eq false }">
						<span id="isLiked">X</span>
						<button id="likeBtn">좋아요</button>
					</c:if>
			</div>
			<div>
				좋아요 수 : ${likeCount } 
			</div> 
		
		</c:if>
	</div>
</c:if>








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
							<td colspan="2">${cvo.userId }</td>
						</tr>
						<tr>
							<td colspan="2">${cvo.content }</td>
						</tr>
						<tr>
							<td colspan="2">${cvo.updateAt }&nbsp;
							 	<c:if test="${loggedIn }">
									<c:set var="lgnuser"><%=request.getUserPrincipal().getName()%></c:set>
								</c:if> <c:choose>
									<c:when test="${loggedIn}">
										<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="openInsert(${cvo.cmtId})">답글 쓰기</button>
										<c:if test="${lgnuser eq cvo.userId }">
											<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="openEdit(${cvo.cmtId})">댓글 수정</button>
											<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="deleteCmt(${cvo.cmtId})">댓글 삭제</button>
										</c:if>
									</c:when>
								</c:choose>
							</td>
						<tr class="editbox ${cvo.cmtId }">
							<td colspan="2"><textarea rows="3" cols="61" id="updateBox">${cvo.content }</textarea>
								<br>
								<button type="button">수정</button>
								<button type="button" onclick="closeEdit(${cvo.cmtId})">취소</button>
							</td>
						</tr>
						<tr class="insertbox ${cvo.cmtId }">
							<td colspan="2"><textarea rows="3" cols="61" id="insertBox"></textarea>
								<br>
								<button type="button">작성</button>
								<button type="button" onclick="closeInsert(${cvo.cmtId})">취소</button>
							</td>
						</tr>
						<c:forEach items="${replyComment }" var="rcvo" varStatus="rs">
							<c:if test="${cvo.cmtId eq rcvo.cmtId }">
								<tr>
									<td style="width: 10%">ㄴRe:</td>
									<td style="width: 90%">${rcvo.userId }</td>
								</tr>
								<tr>
									<td style="width: 10%"></td>
									<td style="width: 90%">${rcvo.content }</td>
								</tr>
								<tr>
									<td style="width: 10%"></td>
									<td style="width: 90%">${rcvo.updateAt }&nbsp;
										<c:if test="${loggedIn }">
											<c:set var="lgnuser"><%=request.getUserPrincipal().getName()%></c:set>
										</c:if> <c:choose>
											<c:when test="${loggedIn}">
												<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="openReInsert(${rcvo.rcmId})">답글 쓰기</button>
												<c:if test="${lgnuser eq rcvo.userId }">
													<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="openReEdit(${rcvo.rcmId})">답글 수정</button>
													<button type="button" style="border-style: none; background-color: white; font-size: xx-small;"	onclick="RedeleteCmt(${rcvo.rcmId})">답글 삭제</button>
												</c:if>
											</c:when>
										</c:choose>
									</td>
								</tr>
								<tr class="editRebox ${rcvo.rcmId }">
									<td colspan="2"><textarea rows="3" cols="100%" id="updateReBox">${rcvo.content }</textarea> <br>
										<button type="button">수정</button>
										<button type="button" onclick="closeReEdit(${rcvo.rcmId})">취소</button>
									</td>
								</tr>
								<tr class="insertRebox ${rcvo.rcmId }">
									<td colspan="2"><textarea rows="3" cols="100%" id="insertReBox"></textarea> <br>
										<button type="button">작성</button>
										<button type="button" onclick="closeReInsert(${rcvo.rcmId})">취소</button>
									</td>
								</tr>
							</c:if>
						</c:forEach>
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
						<div><textarea rows="3"   style="width:80%;" name="commentContent" ></textarea></div>
						<input type="hidden" name="boardNum" value="${post.postId }">
						<button type="button" class="btn reply">댓글 작성</button>
						</fieldset>
					</form>
				</c:when>
			</c:choose>
		</div>





	
	
</div>























<main role="main">
    <section class="bg-gray200 pt-5 pb-5">
    <div class="container">
    	<div class="row justify-content-center">
    		<div class="col-md-7">
    			<article class="card">
    			<img class="card-img-top mb-2" src="https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e0245bb4e87077312cc3d102e68c1efd&auto=format&fit=crop&w=735&q=80" alt="Card image">
    			<div class="card-body">
    				<h1 class="card-title display-4">
    				${post.foodName }
    				</h1>
    				<span class="btn btn-sm">작성자 : ${post.nickname }</span>
    				<span class="btn btn-sm" style="float: right;">작성일자 : ${post.createDate }</span>
    				<hr>
    				<h3>재료</h3>
    				<ul>
	    				<c:forEach items="${post.ingredients }" var="ing" varStatus="status">
							<li>${ing.ingredient } : ${ing.amount }</li>
						</c:forEach>
    				</ul>
    				<hr>
    				<div id="post_content">    				
	    				${post.content }
    				</div>
    				<!-- Begin Comments -replace demowebsite with your own id
                    ================================================== -->
    				<div id="comments" class="mt-4">
	   					<fieldset>
	   						<span>댓글</span>
	   						<span>${cmtCount }</span>
	   						<table id="tb_comment"style="width: 100%">
								<c:forEach items="${comment }" var="cvo" varStatus="s">
									<tr>
										<td colspan="2">${cvo.userId }</td>
									</tr>
									<tr>
										<td colspan="2">${cvo.content }</td>
									</tr>
									<tr>
										<td  colspan="2">${cvo.updateAt }&nbsp;
										<c:if test="${loggedIn }">
											<c:set var="lgnuser"><%=request.getUserPrincipal().getName() %></c:set>
										</c:if>
											<c:choose>
												<c:when test="${loggedIn}">
													<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="openInsert(${cvo.cmtId})">답글 쓰기</button>
													<c:if test="${lgnuser eq cvo.userId }">
														<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="openEdit(${cvo.cmtId})">댓글 수정</button> 
														<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="deleteCmt(${cvo.cmtId})">댓글 삭제</button>
													</c:if>
												</c:when>
												<c:otherwise />
											</c:choose>
										</td>
										<tr class="editbox ${cvo.cmtId }">
											<td colspan="2">
												<textarea rows="3" cols="61" id="updateBox">${cvo.content }</textarea>
												<br>
												<button type="button">수정</button>
												<button type="button" onclick="closeEdit(${cvo.cmtId})">취소</button>
											</td>
										</tr>
										<tr class="insertbox ${cvo.cmtId }">
											<td colspan="2">
												<textarea rows="3" cols="61" id="insertBox"></textarea>
												<br>
												<button type="button">작성</button>
												<button type="button" onclick="closeInsert(${cvo.cmtId})">취소</button>
											</td>
										</tr>
										<c:forEach items="${replyComment }" var="rcvo" varStatus="rs">
											<c:if test="${cvo.cmtId eq rcvo.cmtId }">
												<tr>
													<td style="width: 10%">ㄴRe:</td>
													<td style="width: 90%">${rcvo.userId }</td>
												</tr>
												<tr>
													<td style="width: 10%"></td>
													<td style="width: 90%">${rcvo.content }</td>
												</tr>
												<tr>
													<td style="width: 10%"></td>
													<td style="width: 90%">${rcvo.updateAt }&nbsp;
													<c:if test="${loggedIn }">
														<c:set var="lgnuser"><%=request.getUserPrincipal().getName() %></c:set>
													</c:if>
													<c:choose>
														<c:when test="${loggedIn}">
															<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="openReInsert(${rcvo.rcmId})">답글 쓰기</button>
															<c:if test="${lgnuser eq rcvo.userId }">
																<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="openReEdit(${rcvo.rcmId})">답글 수정</button> 
																<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="RedeleteCmt(${rcvo.rcmId})">답글 삭제</button>
															</c:if>
														</c:when>
														<c:otherwise />
													</c:choose>
													</td>
												</tr>
												<tr class="editRebox ${rcvo.rcmId }">
													<td colspan="2">
														<textarea rows="3" cols="61" id="updateReBox">${rcvo.content }</textarea>
														<br>
														<button type="button">수정</button>
														<button type="button" onclick="closeReEdit(${rcvo.rcmId})">취소</button>
													</td>
												</tr>
												<tr class="insertRebox ${rcvo.rcmId }">
													<td colspan="2">
														<textarea rows="3" cols="61" id="insertReBox"></textarea>
														<br>
														<button type="button">작성</button>
														<button type="button" onclick="closeReInsert(${rcvo.rcmId})">취소</button>
													</td>
												</tr>
											</c:if>
										</c:forEach>
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
										<div><textarea rows="3" cols="64" name="commentContent" ></textarea></div>
										<input type="hidden" name="boardNum" value="${post.postId }">
										<button type="button" class="btn reply">댓글 작성</button>
									</fieldset>
								</form>
							</c:when>
							<c:otherwise />
						</c:choose>
					</div>
    				<!--End Comments
                    ================================================== -->
    			</div>
    			</article>
    		</div>
    	</div>
    </div>
  </section>
        
    
</main>
<table border="1">
		<tr>
			<th>글번호</th>
			<th>닉네임 </th>
			<th>음식 이름</th>
			<th>음식 재료</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>

		<tr>
			<td>${post.postId }</td>
			<td>${post.nickname }</td>
			<td>${post.foodName }</td>
			<td>
				<c:forEach items="${post.ingredients }" var="ing" varStatus="status">
					${ing.ingredient } : ${ing.amount } /
				</c:forEach>
			</td>
			<td>${post.content }</td>
			<td>${post.createDate }</td>
		</tr>
</table>
<div>
${hashtags } 
</div>

아이콘으로 대체 예정


<div>
	<table id="tb_comment">
		<c:forEach items="${comment }" var="cvo" varStatus="s">
			<tr>
				<td colspan="2">${cvo.userId }</td>
			</tr>
			<tr>
				<td colspan="2">${cvo.content }</td>
			</tr>
			<tr>
				<td>${cvo.updateAt }</td>
				<td>
				댓글쓰기
				<c:if test="${loggedIn }">
					<c:set var="lgnuser23"><%=request.getUserPrincipal().getName() %></c:set>
				</c:if>
					<c:choose>
						<c:when test="${loggedIn}">
							<c:if test="${lgnuser eq cvo.userId }">
								| 댓글수정 | 댓글삭제
							</c:if>
						</c:when>
						<c:otherwise />
					</c:choose>
				</td>
			</tr>
			<tr class="editbox ${cvo.cmtId }">
				<td colspan="2">
					<textarea rows="3" cols="64">${cvo.content }</textarea>
					<br>
					<button type="button">수정</button>
					<button type="exit_box_${cvo.cmtId }">취소</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div>
	<c:choose>
		<c:when test="${loggedIn}">
			<form id="frmReply42">
				<fieldset>
					<legend>댓글 작성</legend>
					<div><textarea rows="3" cols="70" name="commentContent" ></textarea></div>
					<input type="hidden" name="boardNum" value="${post.postId }">
					<button type="button" class="btn reply">댓글 작성</button>
				</fieldset>
			</form>
		</c:when>
		<c:otherwise />
	</c:choose>
</div>

<div>
	<c:if test="${loggedIn}">
		
		<c:if test="${user eq post.userId}">
			<a href="<%=request.getContextPath()%>/board/list/update/${post.postId }">게시글 수정</a>
			<button id="deletePost">게시글 삭제</button>
		</c:if>
	</c:if>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$(".editbox").hide();
	$(".insertbox").hide();
	$(".editRebox").hide();
	$(".insertRebox").hide();
});

function openEdit(num) {
	$(".editbox."+num).show();
}

function closeEdit(num) {
	$(".editbox."+num).hide();
}

function openInsert(num) {
	$(".insertbox."+num).show();
}

function closeInsert(num) {
	$(".insertbox."+num).hide();
}

function openReEdit(num) {
	$(".editRebox."+num).show();
}

function closeReEdit(num) {
	$(".editRebox."+num).hide();
}

function openReInsert(num) {
	$(".insertRebox."+num).show();
}

function closeReInsert(num) {
	$(".insertRebox."+num).hide();
}

function updateComment(cid) {
	$.ajax({
		url:"<%=request.getContextPath()%>/board/updateReplyAjax",
		type: "POST",
		data:{
			cmtId: cid,
			postId: ${post.postId},
			content: $("[name=updateBox]").val()
		},
		dataType:"json",
		async:false,
		success: function(result){
			if(result.length > 0) {
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
		url: "<%=request.getContextPath() %>/board/deleteReplyAjax",
		type: "POST",
		data: {cmtId: cid
			  , postId: ${post.postId}
		},
		dataType:"json",
		async: false,
		success: function(result) {
			if(result.length > 0) {
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
		url: "<%=request.getContextPath()%>/board/insertReplyAjax",
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
});

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
		var aaa = "${loggedIn}";
		if(aaa) {
			var lgnuser = '<%=request.getUserPrincipal().getName() %>';
		}
		if(aaa) {
			htmlval += '<button type="button" style="border-style: none; background-color: white; font-size: xx-small;" onclick="openInsert('+reply.cmtId+')">답글 쓰기</button>';
			if(lgnuser === reply.userId) {
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
		url: "<%=request.getContextPath()%>/bookmark",
		type: "POST", 
		data: {postId: ${post.postId}},
		async : false,
		success:function(result){
			if(result==false){
				var htmlVal= "북마크 : <span id='isBookmarked'> X </span><button id='bookmarkBtn'>북마크</button>";
				$("#bookmark").html(htmlVal);
			}else if(result==true){
				var htmlVal= "북마크 : <span id='isBookmarked'> O </span><button id='bookmarkBtn'>북마크 취소</button>";
				$("#bookmark").html(htmlVal);
			}
		}
		
	});
});


$(document).on("click","#followBtn" ,function() {
	var isFollowed = $("#isFollowed").text();
	$.ajax({
		url: "<%=request.getContextPath()%>/follow",
		type: "POST", 
		data: {userId: "${post.userId }" },
		async : false,
		success:function(result){
			if(result==false){
				var htmlVal= "팔로우 : <span id='isFollowed'> X </span><button id='followBtn'>팔로우</button>";
				$("#follow").html(htmlVal);
			}else if(result==true){
				var htmlVal= "팔로우 : <span id='isFollowed'> O </span><button id='followBtn'>팔로우 취소</button>";
				$("#follow").html(htmlVal);
			}
		}
		
	});
});


$(document).on("click","#likeBtn" ,function() {
	$.ajax({
		url: "<%=request.getContextPath()%>/like",
		type: "POST", 
		data: {postId: ${post.postId}},
		async : false,
		success:function(result){
			if(result==false){
				var htmlVal= "좋아요 : <span id='isLiked'> X </span><button id='likeBtn'>좋아요</button>";
				$("#like").html(htmlVal);
			}else if(result==true){
				var htmlVal= "좋아요 : <span id='isLiked'> O </span><button id='likeBtn'>좋아요 취소</button>";
				$("#like").html(htmlVal);
			}
		}
		
	});
});

$("#deletePost").click(function(){
	$.ajax({
	  url: "<%=request.getContextPath()%>/board/delete",
	  type: "POST", 
	  data: {postId: ${post.postId}},
	  success:function(result){
			console.log(result);
			location.href ="<%=request.getContextPath()%>/board/list"
		}
	});

})



</script>

</body>
</html>