<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>every recipe</title>
<%@ include file="/WEB-INF/views/css_import.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<style>
.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 200, 'GRAD' 0, 'opsz' 24
}

.btn-raised {
	padding: .5em 1.2em;
	text-decoration: none;
	color: #fff;
	background: #6E6E6E;
	text-align: center;
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	border-style: none;
	font-size: 14px;
}

.btn-raised:hover {
	background: #A4A4A4;
}

select {
	font-size: 18px;
	height: 30px;
	padding: 5px;
	transition: all 0.5s ease;
}

.selectUp {
	transform: translateY(-30px);
}

#selectBox {
	width: 15em;
	height: 50px;
}

#slide_wrap_div {
	width: 100%;
	position: relative;
}

#slide_wrap_div img {
	width: 100%;
	height: 350px;
	vertical-align: middle;
}

#slide_wrap_div .title_div {
	width: 100%;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.slick-prev {
	left: 3%;
	z-index: 1;
}

.slick-next {
	right: 3%;
	z-index: 1;
}

body {
	padding-top: 57.38px;
}

.select_postbar {
	padding-top: 0;
	padding-bottom: 0;
	margin-bottom: 30px;
}

.select_postbar .row div {
	text-align: center;
	padding-top: 8px;
	padding-bottom: 8px;
}

.select_postbar .row div:hover {
	color: yellow;
	background-color: #6EE5A3;
	opacity: 0.8;
}

.floating {
	position: absolute;
	width: 150px;
	height: 350px;
	right: 25px;
	top: 470px;
	border: 1px solid;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- Begin Site Title================================================== -->
	<div id="slide_wrap_div">
		<div id="slide_div">
			<div>
				<img src="./resources/img/image4.jpg">
			</div>
			<div>
				<img src="./resources/img/image5.jpg">
			</div>
			<div>
				<img src="./resources/img/image3.jpg">
			</div>
		</div>
		<div class="title_div col-8">
			<div class="mainheading">
				<h1 class="sitetitle">every recipe</h1>
				<p class="lead" style="color: white;">소중한 나의 식사 기록장</p>
			</div>
		</div>
	</div>
	<%if(request.getUserPrincipal() != null || request.isUserInRole("MEMBER")){%>
	<nav class="select_postbar navbar navbar-light bg-success text-white">
		<div class="row">
			<div class="col-md-3" style="cursor: pointer;" onclick="bestrc()">BEST
				RECIPE</div>
			<div class="col-md-3" style="cursor: pointer;" onclick="followrc()">FOLLOW
				RECIPE</div>
			<div class="col-md-3" style="cursor: pointer;" onclick="recorc()">RECOMMEND
				RECIPE</div>
			<div class="col-md-3" style="cursor: pointer;" onclick="weekrc()">WEEK
				RECIPE</div>
		</div>
	</nav>
	<%} else{%>
	<nav class="select_postbar navbar navbar-light bg-success text-white">
		<div class="row">
			<div class="col-md-4" style="cursor: pointer;" onclick="bestrc()">BEST
				RECIPE</div>
			<div class="col-md-4" style="cursor: pointer;" onclick="recorc()">RECOMMEND
				RECIPE</div>
			<div class="col-md-4" style="cursor: pointer;" onclick="weekrc()">WEEK
				RECIPE</div>
		</div>
	</nav>
	<%} %>

	<div class="container">
		<!-- End Site Title================================================== -->

		<!-- Begin Featured	================================================== -->

		<%if(request.getUserPrincipal() != null || request.isUserInRole("MEMBER")){%>
		<!-- 로그인 시 표출 -->
		<!-- 팔로잉 게시글 피드  (작성일자순) -->
		<section class="featured-posts follow_post">
			<div class="section-title">
				<h2>
					<span>FOLLOW RECIPE</span>
				</h2>
			</div>
			<div class="card-columns listfeaturedtag"
				style="display: flex; flex-flow: row wrap; justify-content: center;">
				<!-- begin post -->
				<c:forEach var="fw" items="${fwpost }">
					<div class="card card-width">
						<div class="row">
							<div class="col-md-5 wrapthumbnail">
								<a href="<%=request.getContextPath() %>/board/list/${fw.postId}">
									<div class="thumbnail"
										style="background-image:url(${fw.mainImage});"></div>
								</a>
							</div>
							<div class="col-md-7">
								<div class="card-block">
									<div>
										<h2 class="card-title">
											<a
												href="<%=request.getContextPath() %>/board/list/${fw.postId}">${fw.foodName }</a>
										</h2>
										<span class="post-read-more"><a
											href="<%=request.getContextPath() %>/board/list/${fw.postId}"
											title="Read Story"><svg class="svgIcon-use" width="25"
													height="25" viewbox="0 0 25 25">
													<path
														d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z"
														fill-rule="evenodd"></path></svg></a></span>
									</div>
									<h4 class="card-text"
										style="overflow: hidden; text-overflow: ellipsis; word-break: break-word; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">${fw.content }</h4>
									<div class="metafooter">
										<div class="wrapfooter">
											<span class="meta-footer-thumb"> <a
												href="<%=request.getContextPath() %>/member/info/${fw.userId}"><img
													class="author-thumb" src="${fw.profileUrl }" alt="Sal"></a>
											</span> <span class="author-meta"> <span class="post-name"><a
													href="<%=request.getContextPath() %>/member/info/${fw.userId}">${fw.nickname }</a></span><br />
												<span class="post-date">${fw.createAt }</span> <span
												class="post-read" style="white-space: pre-line;">
													조회수: ${fw.lookUp}</span>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="card-columns listfeaturedtag fw-ISdiv"
				style="display: flex; flex-flow: row wrap; justify-content: center;"></div>
		</section>
		<%} %>

		<!-- 게시글(조회수) 피드 -->
		<section class="featured-posts sort_lkup">
			<div class="section-title">
				<h2>
					<span>BEST RECIPE</span>
				</h2>
			</div>
			<div class="card-columns listfeaturedtag"
				style="display: flex; flex-flow: row wrap; justify-content: center;">
				<!-- begin post -->
				<c:forEach var="lu" items="${lupost }">
					<div class="card card-width">
						<div class="row">
							<div class="col-md-5 wrapthumbnail">
								<a href="<%=request.getContextPath() %>/board/list/${lu.postId}">
									<div class="thumbnail"
										style="background-image:url(${lu.mainImage});"></div>
								</a>
							</div>
							<div class="col-md-7">
								<div class="card-block">
									<div>
										<h2 class="card-title">
											<a
												href="<%=request.getContextPath() %>/board/list/${lu.postId}">${lu.foodName }</a>
										</h2>
										<span class="post-read-more"><a
											href="<%=request.getContextPath() %>/board/list/${lu.postId}"
											title="Read Story"><svg class="svgIcon-use" width="25"
													height="25" viewbox="0 0 25 25">
													<path
														d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z"
														fill-rule="evenodd"></path></svg></a></span>
									</div>
									<h4 class="card-text"
										style="overflow: hidden; text-overflow: ellipsis; word-break: break-word; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">${lu.content }</h4>
									<div class="metafooter">
										<div class="wrapfooter">
											<span class="meta-footer-thumb"> <a
												href="<%=request.getContextPath() %>/member/info/${lu.userId}"><img
													class="author-thumb" src="${lu.profileUrl }" alt="Sal"></a>
											</span> <span class="author-meta"> <span class="post-name"><a
													href="<%=request.getContextPath() %>/member/info/${lu.userId}">${lu.nickname }</a></span><br />
												<span class="post-date">${lu.createAt }</span> <span
												class="post-read" style="white-space: pre-line;">
													조회수: ${lu.lookUp }</span>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="card-columns listfeaturedtag lookup-ISdiv"
				style="display: flex; flex-flow: row wrap; justify-content: center;"></div>
		</section>


		<!-- 추천 게시글 피드 (좋아요순) -->
		<section class="featured-posts sort_like">
			<div class="section-title">
				<h2>
					<span>RECOMMEND RECIPE</span>
				</h2>
			</div>
			<div class="card-columns listfeaturedtag"
				style="display: flex; flex-flow: row wrap; justify-content: center;">
				<!-- begin post -->
				<c:forEach var="post" items="${rcpost }">
					<div class="card card-width">
						<div class="row">
							<div class="col-md-5 wrapthumbnail">
								<a
									href="<%=request.getContextPath() %>/board/list/${post.postId}">
									<div class="thumbnail"
										style="background-image:url(${post.mainImage});"></div>
								</a>
							</div>
							<div class="col-md-7">
								<div class="card-block">
									<div>
										<h2 class="card-title">
											<a
												href="<%=request.getContextPath() %>/board/list/${post.postId}">${post.foodName }</a>
										</h2>
										<span class="post-read-more"><a
											href="<%=request.getContextPath() %>/board/list/${post.postId}"
											title="Read Story"><svg class="svgIcon-use" width="25"
													height="25" viewbox="0 0 25 25">
													<path
														d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z"
														fill-rule="evenodd"></path></svg></a></span>
									</div>
									<h4 class="card-text"
										style="overflow: hidden; text-overflow: ellipsis; word-break: break-word; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">${post.content }</h4>
									<div class="metafooter">
										<div class="wrapfooter">
											<div style="width: 80%; display: inline-block">
												<span class="meta-footer-thumb"> <a
													href="<%=request.getContextPath() %>/member/info/${post.userId}"><img
														class="author-thumb" src="${post.profileUrl}" alt="Sal"></a>
												</span> <span class="author-meta"> <span class="post-name"><a
														href="<%=request.getContextPath() %>/member/info/${post.userId}">${post.nickname }</a></span><br />
													<span class="post-date" style="padding-right: 6px">${post.createAt }</span>
												</span>
											</div>
											<div style="width: 15%; display: inline-block;">
												<span class="material-symbols-outlined" style="color: red;">favorite</span>
												<span class="post-read" style="display: inline-block">
													${post.cntlike }</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="card-columns listfeaturedtag reco-ISdiv"
				style="display: flex; flex-flow: row wrap; justify-content: center;"></div>
		</section>


		<!-- End Featured
	================================================== -->

		<!-- Begin List Posts
	================================================== -->

		<!-- 주간 게시글 (월~일요일)-->
		<section class="recent-posts week_post">
			<div class="section-title">
				<h2>
					<span>WEEK RECIPE</span>
				</h2>
			</div>
			<div>
				<div class="card-columns listrecent"
					style="display: flex; flex-flow: row wrap; justify-content: center;">
					<c:forEach items="${weekboard }" var="list">
						<div class="card" style="width: 356.5px; height: 50%;">
							<a
								href="<%=request.getContextPath() %>/board/list/${list.postId}">
								<img class="img-fluid" src="${list.mainImage}"
								style="width: 100%; height: 268px;">
							</a>
							<div class="card-block">
								<h2 class="card-title">
									<a
										href="<%=request.getContextPath() %>/board/list/${list.postId}"
										id="chk_data">${list.foodName }</a>
								</h2>
								<span class="post-read-more exp" style="margin-top: 0;"><a
									href="<%=request.getContextPath() %>/board/list/${list.postId}"
									title="Read Story"><svg class="svgIcon-use" width="25"
											height="25" viewbox="0 0 25 25">
											<path
												d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z"
												fill-rule="evenodd"></path></svg></a></span>
								<h4 class="card-text"
									style="overflow: hidden; text-overflow: ellipsis; word-break: break-word; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; height: 42.56px;">
									${list.content }</h4>
								<div class="metafooter">
									<div class="wrapfooter">
										<span class="meta-footer-thumb"> <a
											href="<%=request.getContextPath() %>/member/info/${list.userId}"><img
												class="author-thumb" src="${list.profileUrl }" alt="Sal"></a>
										</span> <span class="author-meta"> <span class="post-name"><a
												href="<%=request.getContextPath() %>/member/info/${list.userId}">${list.nickname }</a></span><br />
											<span class="post-date" style="white-space: pre-line;">${list.createAt }</span><span
											class="dot"></span><span class="post-read"
											style="white-space: pre-line;">조회수: ${list.lookUp }</span>
										</span>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="card-columns listrecent week-ISdiv"
				style="display: flex; flex-flow: row wrap; justify-content: center;"></div>
		</section>
		<!-- End List Posts	================================================== -->

	</div>
	<!-- /.container -->

	<div class="floating bg-success bg-gradient text-white"
		style="opacity: 0.9;">
		<div style="height: 200px; margin-top: 15px;">
			실시간 검색어 순위 <br> <select class="form-select" id="selectBox"
				onchange="redirectToSearch(this)" style="width: 140px;">
				<c:forEach var="pw" items="${pword }">
					<option
						value="${pageContext.request.contextPath }/board/search?keyword=${pw.keword}">${pw.rownum}.
						${pw.keword }</option>
				</c:forEach>
			</select>
		</div>
		<div class="chat_div" style="margin-bottom: 15px; margin-left: 15px;">
			<a href="<%=request.getContextPath() %>/chat/chatroom"
				onclick="chk_id(event)" style="color: white; text-decoration: none;">
				<img src="./resources/img/chat-icon2.png"> 채팅방
			</a>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<%@ include file="/WEB-INF/views/js_import.jsp"%>

	<script>
/* 슬라이드 배너 slick */
$(document).ready(function(){
	$("#slide_div").slick(
		{
			autoplay: true,
			autoplaySpeed: 5000		
		}
	);
});
$.noConflict();



var curPage=1;
var recocurPage=1;
var weekcurPage=1;
var fwcurPage=1;

/* 추천, 주간, 팔로잉 게시글 숨김. 조회순 게시글만 표출  */
$(document).ready(function(){
	$(".sort_like").hide();
	$(".week_post").hide();
	$(".follow_post").hide();
	$(".reco-hide").remove();
	$(".fw-hide").remove();
	$(".week-hide").remove();
	
});

/* 추천 버튼 누르면 추천순 게시글 표출 + 조회순, 주간, 팔로잉 게시글 숨김 */
function recorc(){
	$(".sort_lkup").hide();
	$(".week_post").hide();	
	$(".follow_post").hide();
	$(".sort_like").show();
	$(".reco-hide").show();
	$(".reco-hide").remove();
	$(".lookup-hide").remove();
	$(".week-hide").remove();
	$(".fw-hide").remove();
	
	curPage = 1;
	recocurPage=1;
	weekcurPage=1;
	fwcurPage=1;
};

/* 조회순 버튼 누르면 조회순 게시글 표출 + 주간, 추천순, 팔로잉 게시글 숨김 */
function bestrc(){
	$(".sort_like").hide();  
	$(".week_post").hide();
	$(".follow_post").hide();
	$(".sort_lkup").show();
	$(".lookup-hide").show();
	$(".lookup-hide").remove();
	$(".reco-hide").remove();
	$(".week-hide").remove();
	$(".fw-hide").remove();	
	
	curPage = 1;
	recocurPage=1;
	weekcurPage=1;
	fwcurPage=1;
};

/* 주간게시글 버튼 누르면 주간 게시글 표출 + 추천순, 조회순, 팔로잉 게시글 숨김 */
function weekrc(){
	$(".sort_lkup").hide();
	$(".sort_like").hide();		
	$(".follow_post").hide();
	$(".week_post").show();
	$(".week-hide").show();
	$(".week-hide").remove();
	$(".lookup-hide").remove();
	$(".reco-hide").remove();
	$(".fw-hide").remove();	
	
	curPage = 1;
	recocurPage=1;
	weekcurPage=1;
	fwcurPage=1;
};

/* 팔로잉게시글 버튼 누르면 팔로잉 게시글 표출 + 추천순, 조회순, 주간 게시글 숨김 */
function followrc(){
	$(".sort_lkup").hide();
	$(".sort_like").hide();			
	$(".week_post").hide();
	$(".follow_post").show();
	$(".fw-hide").show();
	$(".fw-hide").remove();
	$(".lookup-hide").remove();
	$(".reco-hide").remove();
	$(".week-hide").remove();
	
	curPage = 1;
	recocurPage=1;
	weekcurPage=1;
	fwcurPage=1;
};


/* 채팅 진입시 로그인 여부 확인 */
function chk_id(e){
	var userid = "${userId}";
	if(userid == ""){
		alert("로그인이 필요한 기능입니다.")
		e.preventDefault();
	}	
}

/* 플로팅 배너 */
$(document).ready(function(){
    var pst = parseInt($(".floating").css('top'));
    $(window).scroll(function(){
        var menu_pst = $(window).scrollTop() + pst + "px";
        $(".floating").stop().animate({
            "top": menu_pst
        }, 500);
    }).scroll();
});


const week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
const month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

//조회순 피드 무한스크롤


$(window).scroll(function() {
    if($(window).scrollTop() > $(document).height() - $(window).height() - 500) { 
        curPage+=1;
        $.ajax({
            type : 'GET',
            url  : '${pageContext.request.contextPath}/lookupIS',
            async : false,
            data : {curPage:curPage},
            success : function(result){
            	 if(result.length != 0){
            		 for(i=0; i<result.length;i++){
            			 var lookup=result[i];            			 
            			 var luDate = new Date(lookup.createAt);
            			 
            			 const dayOfWeek = week[new Date(luDate).getDay()];            			
            			 const dayOfMonth = month[new Date(luDate).getMonth()];            			 
            			 const format_day = (("00" + luDate.getDate().toString()).slice(-2));           			 
            			 var luDate_format = dayOfWeek + " " + dayOfMonth + " " + format_day + " " + luDate.getHours() + ":" + 
            			 				luDate.getMinutes() + ":" + luDate.getSeconds() + " KST " + luDate.getFullYear();
            			 				
            			 var a= `
            				<div class="card lookup-hide card-width">
            					<div class="row">
            						<div class="col-md-5 wrapthumbnail">
            							<a href="<%=request.getContextPath() %>/board/list/`+lookup.postId+`">
            								<div class="thumbnail" style="background-image:url(`+lookup.mainImage+`);">
            								</div>
            							</a>
            						</div>
            						<div class="col-md-7">
            							<div class="card-block">
            							<div>
            								<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/`+lookup.postId+`">`+lookup.foodName+`</a>							
            								</h2>
            								<span class="post-read-more"><a href="<%=request.getContextPath() %>/board/list/`+lookup.postId+`" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
            							</div>
            								<h4 class="card-text"
            								style= "overflow: hidden;
            								text-overflow: ellipsis;
            								word-break: break-word;							
            								display: -webkit-box;
            								-webkit-line-clamp: 5;
            								-webkit-box-orient: vertical;"						
            								>`+lookup.content+`</h4>
            								<div class="metafooter">
            									<div class="wrapfooter">
            										<span class="meta-footer-thumb">
            										<a href="<%=request.getContextPath() %>/member/info/`+lookup.userId+`"><img class="author-thumb" src="`+lookup.profileUrl+`" alt="Sal"></a>
            										</span>
            										<span class="author-meta">
            										<span class="post-name"><a href="<%=request.getContextPath() %>/member/info/`+lookup.userId+`">`+lookup.nickname+`</a></span><br/>
            										<span class="post-date">`+luDate_format+`</span>
            										<span class="post-read" style="white-space: pre-line;">									
            										조회수: `+lookup.lookUp+`</span>
            										</span>								
            									</div>
            								</div>
            							</div>
            						</div>
            					</div>
            				</div>
            			`           				
            			$(".lookup-ISdiv").append(a);	
            		 }          	
           		 }
       	 	}
    	}) 
	}
});

// 추천(좋아요순)피드 무한스크롤

$(window).scroll(function() {
    if($(window).scrollTop() > $(document).height() - $(window).height() - 500) { 
        recocurPage+=1;
        $.ajax({
            type : 'GET',
            url  : '${pageContext.request.contextPath}/recommendIS',
            async : false,
            data : {recocurPage:recocurPage},
            success : function(result){
            	 if(result.length != 0){
            		 for(i=0; i<result.length;i++){
            			 var reco = result[i];   
            			 var recoDate = new Date(reco.createAt);
            			 
            			 const dayOfWeek = week[new Date(recoDate).getDay()];            			
            			 const dayOfMonth = month[new Date(recoDate).getMonth()];            			 
            			 const format_day = (("00" + recoDate.getDate().toString()).slice(-2));           			 
            			 var recoDate_format = dayOfWeek + " " + dayOfMonth + " " + format_day + " " + recoDate.getHours() + ":" + 
            			 				recoDate.getMinutes() + ":" + recoDate.getSeconds() + " KST " + recoDate.getFullYear();
            			 	
            			 var a= `            
            				<div class="card reco-hide card-width">
            					<div class="row">
            						<div class="col-md-5 wrapthumbnail">
            							<a href="<%=request.getContextPath() %>/board/list/`+reco.postId+`">
            								<div class="thumbnail" style="background-image:url(`+reco.mainImage+`);">
            								</div>
            							</a>
            						</div>
            						<div class="col-md-7">
            							<div class="card-block">
            							<div>
            								<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/`+reco.postId+`">`+reco.foodName+`</a>							
            								</h2>
            								<span class="post-read-more"><a href="<%=request.getContextPath() %>/board/list/`+reco.postId+`" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
            							</div>
            								<h4 class="card-text"
            								style= "overflow: hidden;
            								text-overflow: ellipsis;
            								word-break: break-word;							
            								display: -webkit-box;
            								-webkit-line-clamp: 5;
            								-webkit-box-orient: vertical;"						
            								>`+reco.content+`</h4>
            								<div class="metafooter">
            									<div class="wrapfooter">
	            									<div style="width: 80%; display:inline-block">
	            									<span class="meta-footer-thumb">
	            									<a href="<%=request.getContextPath() %>/member/info/`+reco.userId+`"><img class="author-thumb" src="`+reco.profileUrl+`" alt="Sal"></a>
	            									</span>
	            									<span class="author-meta">
	            									<span class="post-name"><a href="<%=request.getContextPath() %>/member/info/`+reco.userId+`">`+reco.nickname+`</a></span><br/>
	            									<span class="post-date" style="padding-right: 6px">`+recoDate_format+`</span>
	            									</span>
	            									</div>
	            									<div style="width: 15%; display:inline-block;">
	            									<span class="material-symbols-outlined" style="color:red;">favorite</span>
	            									<span class="post-read" style="display:inline-block">
	            									`+reco.cntlike+`
	            									</span>
	            									</div>								
            									</div>
            								</div>
            							</div>
            						</div>
            					</div>
            				</div>
            			`           				
            			$(".reco-ISdiv").append(a);           			
            		 }          	
           		 }
       	 	}
    	}) 
	}
});

// 팔로잉(최신순)피드 무한스크롤

$(window).scroll(function() {
    if($(window).scrollTop() > $(document).height() - $(window).height() - 500) { 
        fwcurPage+=1;
        $.ajax({
            type : 'GET',
            url  : '${pageContext.request.contextPath}/mainfwIS',
            async : false,
            data : {fwcurPage:fwcurPage},
            success : function(result){
            	 if(result.length != 0){
            		 for(i=0; i<result.length;i++){
            			 var fw = result[i];            			 
            			 var fwDate = new Date(fw.createAt);
            			 
            			 const dayOfWeek = week[new Date(fwDate).getDay()];            			
            			 const dayOfMonth = month[new Date(fwDate).getMonth()];            			 
            			 const format_day = (("00" + fwDate.getDate().toString()).slice(-2));           			 
            			 var fwDate_format = dayOfWeek + " " + dayOfMonth + " " + format_day + " " + fwDate.getHours() + ":" + 
            			 				fwDate.getMinutes() + ":" + fwDate.getSeconds() + " KST " + fwDate.getFullYear();
           				
            			 var a= `
            				<div class="card fw-hide card-width">
	         					<div class="row">
	         						<div class="col-md-5 wrapthumbnail">
	         							<a href="<%=request.getContextPath() %>/board/list/`+fw.postId+`">
	         								<div class="thumbnail" style="background-image:url(`+fw.mainImage+`);">
	         								</div>
	         							</a>
	         						</div>
	         						<div class="col-md-7">
	         							<div class="card-block">
	         							<div>
	         								<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/`+fw.postId+`">`+fw.foodName+`</a>							
	         								</h2>
	         								<span class="post-read-more"><a href="<%=request.getContextPath() %>/board/list/`+fw.postId+`" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
	         							</div>
	         								<h4 class="card-text"
	         								style= "overflow: hidden;
	         								text-overflow: ellipsis;
	         								word-break: break-word;							
	         								display: -webkit-box;
	         								-webkit-line-clamp: 5;
	         								-webkit-box-orient: vertical;"						
	         								>`+fw.content+`</h4>
	         								<div class="metafooter">
	         									<div class="wrapfooter">
	         										<span class="meta-footer-thumb">
	         										<a href="<%=request.getContextPath() %>/member/info/`+fw.userId+`"><img class="author-thumb" src="`+fw.profileUrl+`" alt="Sal"></a>
	         										</span>
	         										<span class="author-meta">
	         										<span class="post-name"><a href="<%=request.getContextPath() %>/member/info/`+fw.userId+`">`+fw.nickname+`</a></span><br/>
	         										<span class="post-date">`+fwDate_format+`</span>
	         										<span class="post-read" style="white-space: pre-line;">									
	         										조회수: `+fw.lookUp+`</span>
	         										</span>								
	         									</div>
	         								</div>
	         							</div>
	         						</div>
	         					</div>
         					</div>
         				`           				
         			$(".fw-ISdiv").append(a);	          			
            		 }          	
           		 }
       	 	}
    	}) 
	}
});

//주간 게시글 피드 무한스크롤

$(window).scroll(function() {
    if($(window).scrollTop() > $(document).height() - $(window).height() - 500) { 
        weekcurPage+=1;
        $.ajax({
            type : 'GET',
            url  : '${pageContext.request.contextPath}/weekIS',
            async : false,
            data : {weekcurPage:weekcurPage},
            success : function(result){
            	 if(result.length != 0){
            		 for(i=0; i<result.length;i++){
            			 var week = result[i];            			 
            			 var weekDate = new Date(week.createAt); 
            			 
            			 const week1 = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            			             			 
            			 const dayOfWeek = week1[new Date(weekDate).getDay()];            			
            			 const dayOfMonth = month[new Date(weekDate).getMonth()];            			 
            			 const format_day = (("00" + weekDate.getDate().toString()).slice(-2));           			 
            			 var weekDate_format = dayOfWeek + " " + dayOfMonth + " " + format_day + " " + weekDate.getHours() + ":" + 
            			 				weekDate.getMinutes() + ":" + weekDate.getSeconds() + " KST " + weekDate.getFullYear();
            			 var a= `
            				 <div class="card week-hide" style="width: 356.5px; height: 50%;">
            					<a href="<%=request.getContextPath() %>/board/list/`+week.postId+`}">
            						<img class="img-fluid" src=`+week.mainImage+` style="width: 100%; height: 268px;">
            					</a>
            					<div class="card-block">
            						<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/`+week.postId+`" id="chk_data">`+week.foodName+`</a></h2>
            						<span class="post-read-more exp" style="margin-top:0;"><a href="<%=request.getContextPath() %>/board/list/`+week.postId+`" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
            						<h4 class="card-text" 
            						style= "overflow: hidden;
            								text-overflow: ellipsis;
            								word-break: break-word;							
            								display: -webkit-box;
            								-webkit-line-clamp: 2;
            								-webkit-box-orient: vertical;
            								height: 42.56px;">
            						`+week.content+`
            						</h4>
            						<div class="metafooter">
            							<div class="wrapfooter">
            								<span class="meta-footer-thumb">
            								<a href="<%=request.getContextPath() %>/member/info/`+week.userId+`"><img class="author-thumb" src="`+week.profileUrl+`" alt="Sal"></a>
            								</span>
            								<span class="author-meta">
            								<span class="post-name"><a href="<%=request.getContextPath() %>/member/info/`+week.userId+`">`+week.nickname+`</a></span><br/>
            								<span class="post-date" style="white-space: pre-line;">`+weekDate_format+`</span><span class="dot"></span><span class="post-read" style="white-space: pre-line;">조회수: `+week.lookUp+`</span>
            								</span>            								
            							</div>
            						</div>
            					</div>
            				</div>
         				`           				
         			$(".week-ISdiv").append(a);	          			
            		 }          	
           		 }
       	 	}
    	}) 
	}
});















const selectBox = document.getElementById("selectBox");
let currentIndex = 0;

setInterval(() => {
  if (currentIndex === selectBox.options.length - 1) {
    currentIndex = 0;
  } else {
    currentIndex++;
  }
  selectBox.selectedIndex = currentIndex;
  //selectBox.classList.add("selectUp");
  setTimeout(() => {
    //selectBox.classList.remove("selectUp");
  }, 500);
}, 2000);

function redirectToSearch(select) {
	  var selectedValue = select.value;
	  if (selectedValue) {
	    window.location.href = selectedValue;
	  }
	}

</script>



</body>
</html>
