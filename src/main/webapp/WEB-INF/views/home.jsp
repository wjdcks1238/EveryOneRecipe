<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>every recipe</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 200,
  'GRAD' 0,
  'opsz' 24
}
.btn-raised {
    padding: .5em 1.2em;
    text-decoration: none;
    color: #fff;
    background: #6E6E6E;
    text-align: center;
    border-radius: 5px;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    border-style: none;
    font-size: 14px;
}
.btn-raised:hover {
    background: #A4A4A4;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- Begin Site Title================================================== -->
<div class="container">
	<div class="mainheading">
		<h1 class="sitetitle">every recipe</h1>
		<p class="lead">
			 소중한 나의 식사 기록장
		</p>
	</div>
	<!-- End Site Title================================================== -->

	<!-- Begin Featured	================================================== -->
	<%if(request.getUserPrincipal() != null || request.isUserInRole("MEMBER")){%>
	<!-- 로그인 시 표출 -->
	<!-- 팔로잉 게시글 피드  (작성일자순) -->
	<section class="featured-posts">
		<div class="section-title">
			<h2><span>FOLLOW RECIPE</span></h2>
		</div>
		<div class="card-columns listfeaturedtag">	
			<!-- begin post -->
			<c:forEach var="fw" items="${fwpost }">
			<div class="card">
				<div class="row">
					<div class="col-md-5 wrapthumbnail">
						<a href="<%=request.getContextPath() %>/board/list/${fw.postId}">
							<div class="thumbnail" style="background-image:url(<%=request.getContextPath()%>/resources/mediumish/assets/img/demopic/1.jpg);">
							</div>
						</a>
					</div>
					<div class="col-md-7">
						<div class="card-block">
							<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${fw.postId}">${fw.foodName }</a></h2>
							<h4 class="card-text"
							style= "overflow: hidden;
							text-overflow: ellipsis;
							word-break: break-word;							
							display: -webkit-box;
							-webkit-line-clamp: 5;
							-webkit-box-orient: vertical;"						
							>${fw.content }</h4>
							<div class="metafooter">
								<div class="wrapfooter">
									<span class="meta-footer-thumb">
									<a href="<%=request.getContextPath() %>/board/list/${fw.postId}"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
									</span>
									<span class="author-meta">
									<span class="post-name"><a href="<%=request.getContextPath() %>/board/list/${fw.postId}">${fw.nickname }</a></span><br/>
									<span class="post-date">${fw.createAt }</span><span class="dot"></span>									
									${fw.lookUp}</span>
									<span class="post-read-more"><a href="<%=request.getContextPath() %>/board/list/${fw.postId}" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</section>	
	<%} %>
		
	<!-- 게시글(조회수) 피드 -->
	<section class="featured-posts sort_lkup">
		<div class="section-title">
			<h2>
			<span>BEST RECIPE</span>
			<button class="change_like btn-raised" type="button" style="float:right">추천순</button>
			</h2>			
		</div>
		<div class="card-columns listfeaturedtag">	
			<!-- begin post -->
			<c:forEach var="lu" items="${lupost }">
			<div class="card">
				<div class="row">
					<div class="col-md-5 wrapthumbnail">
						<a href="<%=request.getContextPath() %>/board/list/${lu.postId}">
							<div class="thumbnail" style="background-image:url(<%=request.getContextPath()%>/resources/mediumish/assets/img/demopic/1.jpg);">
							</div>
						</a>
					</div>
					<div class="col-md-7">
						<div class="card-block">
							<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${lu.postId}">${lu.foodName }</a></h2>
							<h4 class="card-text"
							style= "overflow: hidden;
							text-overflow: ellipsis;
							word-break: break-word;							
							display: -webkit-box;
							-webkit-line-clamp: 5;
							-webkit-box-orient: vertical;"						
							>${lu.content }</h4>
							<div class="metafooter">
								<div class="wrapfooter">
									<span class="meta-footer-thumb">
									<a href="<%=request.getContextPath() %>/board/list/${lu.postId}"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
									</span>
									<span class="author-meta">
									<span class="post-name"><a href="<%=request.getContextPath() %>/board/list/${lu.postId}">${lu.nickname }</a></span><br/>
									<span class="post-date">${lu.createAt }</span><span class="dot"></span>
									<span class="post-read">									
									${lu.lookUp }</span>
									</span>
									<span class="post-read-more"><a href="<%=request.getContextPath() %>/board/list/${lu.postId}" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</section>
	
	
	<!-- 추천 게시글 피드 (좋아요순) -->
	<section class="featured-posts sort_like">
		<div class="section-title">
			<h2>
			<span>RECOMMEND RECIPE</span>
			<button class="change_lkup btn-raised" type="button" style="float:right">조회순</button>			
			</h2>			
		</div>
		<div class="card-columns listfeaturedtag">	
			<!-- begin post -->
			<c:forEach var="post" items="${rcpost }">
			<c:set var="i" value="${i+1}"/>
			<div class="card">
				<div class="row">
					<div class="col-md-5 wrapthumbnail">
						<a href="<%=request.getContextPath() %>/board/list/${post.postId}">
							<div class="thumbnail" style="background-image:url(<%=request.getContextPath()%>/resources/mediumish/assets/img/demopic/1.jpg);">
							</div>
						</a>
					</div>
					<div class="col-md-7">
						<div class="card-block">
							<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${post.postId}">${post.foodName }</a></h2>
							<h4 class="card-text"
							style= "overflow: hidden;
							text-overflow: ellipsis;
							word-break: break-word;							
							display: -webkit-box;
							-webkit-line-clamp: 5;
							-webkit-box-orient: vertical;"						
							>${post.content }</h4>
							<div class="metafooter">
								<div class="wrapfooter">
									<span class="meta-footer-thumb">
									<a href="<%=request.getContextPath() %>/board/list/${post.postId}"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
									</span>
									<span class="author-meta">
									<span class="post-name"><a href="<%=request.getContextPath() %>/board/list/${post.postId}">${post.nickname }</a></span><br/>
									<span class="post-date">${post.createAt }</span><span class="dot"></span>
									<span class="material-symbols-outlined" style="color:red">favorite</span>
									<span class="post-read">									
									${fwcnt[i-1] }</span>
									</span>
									<span class="post-read-more"><a href="<%=request.getContextPath() %>/board/list/${post.postId}" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</section>

	
	<!-- End Featured
	================================================== -->

	<!-- Begin List Posts
	================================================== -->
	
	<!-- 주간 게시글 (월~일요일)-->
	<section class="recent-posts">
		<div class="section-title">
			<h2><span>WEEK RECIPE</span></h2>
		</div>
		<div>
		<div class="card-columns listrecent">
			<c:forEach items="${weekboard }" var="list">
			<div class="card">
				<a href="<%=request.getContextPath() %>/board/list/${list.postId}">
					<img class="img-fluid" src="<%=request.getContextPath()%>/resources/mediumish/assets/img/demopic/5.jpg" alt="">
				</a>
				<div class="card-block">
					<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></h2>
					<h4 class="card-text" 
					style= "overflow: hidden;
							text-overflow: ellipsis;
							word-break: break-word;							
							display: -webkit-box;
							-webkit-line-clamp: 2;
							-webkit-box-orient: vertical;">
					${list.content }
					</h4>
					<div class="metafooter">
						<div class="wrapfooter">
							<span class="meta-footer-thumb">
							<a href="<%=request.getContextPath() %>/board/list/${list.postId}"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
							</span>
							<span class="author-meta">
							<span class="post-name"><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.nickname }</a></span><br/>
							<span class="post-date">${list.createAt }</span><span class="dot"></span><span class="post-read">${list.lookUp }</span>
							</span>
							<span class="post-read-more"><a href="<%=request.getContextPath() %>/board/list/${list.postId}" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			</div>
			<div style="text-align: center;">
			<div style="display: inline-block;">
				<c:if test="${prev}">
					<a href="/everyrecipe/?num=${startPageNum - 1 }">이전</a>
				</c:if>
				
				<c:forEach begin="${startPageNum }" end="${endPageNum}" var="num">
					<span>
						<c:if test="${select != num }">
							<a href="/everyrecipe/?num=${num }">${num }</a>
						</c:if>
						<c:if test="${select == num }">
							<b>${num }</b>
						</c:if>
					</span>
				</c:forEach>
				<c:if test="${next }">
					<a href="/everyrecipe/?num=${endPageNum + 1 }">다음</a>
				</c:if>
			</div>
			</div>			
			
		</div>
	</section>
	<!-- End List Posts	================================================== -->

</div>
<!-- /.container -->

<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>

<script>

$(document).ready(function(){
	$(".sort_like").hide();
});

$(".change_like").on("click", changeLike);
function changeLike(){
	$(".sort_lkup").hide();
	$(".sort_like").show();		
};

$(".change_lkup").on("click", changeLookUp);
function changeLookUp(){
	$(".sort_like").hide();
	$(".sort_lkup").show();	
};



</script>



</body>
</html>
