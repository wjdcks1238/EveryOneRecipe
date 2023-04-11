<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>검색 결과</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<!-- Fonts -->
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<sec:authorize var="loggedIn" access="isAuthenticated()" />
<div class="listrecent">
	<form>
		<div class="row post-top-meta">
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<input type="text" name="keyword" id="foodSearchKeyword" style="height: 60px; width: 90%" value="${keyword }">
			</div>
			<div class="col-md-3">
			</div>
		</div>
	</form>
		<div class="row post-top-meta">
			<div class="col-md-4">
			</div>
			<div class="col-md-5">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="searchoption" id="inlineRadio1" value="foodName" checked="checked">
				  <label class="form-check-label" for="inlineRadio1">음식 이름</label>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="searchoption" id="inlineRadio2" value="hashTag">
				  <label class="form-check-label" for="inlineRadio2">해시태그</label>
				</div>
			</div>
			<div class="col-md-3">
			</div>
		</div>
	<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach items="${postList }" var="list" varStatus="stqatus">
			<div class="col-md-3 mt-3">
				<div class="card">
					<a href="<%=request.getContextPath() %>/board/list/${list.postId}">
						이미지 삽입 예정.
					</a>
					<div class="card-block">
						<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></h2>
						<h4 class="card-text">${list.content }</h4>
						<div class="wrapfooter">
							<span class="meta-footer-thumb">
								프로필이미지
								<a href="<%=request.getContextPath() %>/member/info/${list.userId }">
									<img class="author-thumb" alt="" src="${list.profileUrl }">
								</a>
							</span>
							<span class="author-meta">
								<span class="post-name">${list.nickname }</span>
								<span class="post-date">${list.createDate }</span><span class="post-read"></span>
							</span>
							<span class="post-read-more">
								<c:if test="${loggedIn}">
									<c:set var="user" value="${pageContext.request.userPrincipal.name }"/>
									<c:if test="${user ne list.userId}">
										<span>
											<c:if test="${list.bookmarkCnt eq 1 }">
												<img data-postid="${list.postId }" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addedB.png">
											</c:if>
											<c:if test="${list.bookmarkCnt eq 0 }">
												<img data-postid="${list.postId }" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addB.png">
											</c:if>
										</span>
										<span>
											<c:if test="${list.likeCnt eq 1 }">
												 <img data-postid="${list.postId }" class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addedL.png">
											</c:if>
											<c:if test="${list.likeCnt eq 0 }">													
												 <img data-postid="${list.postId }" class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addL.png">
											</c:if>
										</span>
									</c:if>
								</c:if>
								<!-- 
								<img class="svgIcon-use" id="bookmarkBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addB.png">					
								<img class="svgIcon-use" id="likeBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addL.png">					
								 -->
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="list">
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>

<script>
	$('input:radio[id=inlineRadio1]').change(function() {
		searchKey();
	});
	
	$('input:radio[id=inlineRadio2]').change(function() {
		searchHash();
	});
	
	function searchKey() {
		  var keyword = $("#foodSearchKeyword").val();
		  var option = $("[name=searchoption]").val();
		  
		  $.ajax({
		    url: "<%=request.getContextPath() %>/board/findfoodajax",
		    type: "GET",
		    data: {
		    	keyword: keyword,
		    	option: option
		    	},
		    dataType: "json",
		    success: function(data) {
		    	if(data.length < 1) {
		    		alert("검색결과가 없습니다.");
		    	} else if(data.length > 0) {
		    		
		    	} else {
		    		alert("알 수 없는 오류가 발생되었습니다.");
		    	}
		    	
		    	display(data);
		    }
		  });
		}
	
	function searchHash() {
		  var keyword = $("#foodSearchKeyword").val();
		  var option = $("[name=searchoption]").val();
		  
		  $.ajax({
		    url: "<%=request.getContextPath() %>/board/findhashajax",
		    type: "GET",
		    data: {
		    	keyword: keyword,
		    	option: option
		    	},
		    dataType: "json",
		    success: function(data) {
		    	if(data.length < 1) {
		    		alert("검색결과가 없습니다.");
		    	} else if(data.length > 0) {
		    		
		    	} else {
		    		alert("알 수 없는 오류가 발생되었습니다.");
		    	}
		    	
		    	display(data);
		    }
		  });
		}
	
	
	function display(data) {
		console.log(data);
		var htmlval = "";
		var a;
		console.log(a);
		console.log(typeof a);
		var loggedIn = ${loggedIn};
		var userName = "${uName}";
		
		for(i=0;i<data.length;i++) {
			var searchResult = data[i];
			htmlval += '<div class="col-md-3 mt-3">';
			htmlval += '<div class="card">';
			htmlval += '<a href="<%=request.getContextPath() %>/board/list/' + searchResult.postId + '">';
			htmlval += '이미지 삽입 예정.';
			htmlval += '</a>';
			htmlval += '<div class="card-block">';
			htmlval += '<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/' + searchResult.postId + '">' + searchResult.foodName + '</a></h2>';
			htmlval += '<h4 class="card-text"> ' + searchResult.content + '</h4>';
			htmlval += '<div class="wrapfooter">';
			htmlval += '<span class="meta-footer-thumb">';
			htmlval += '프로필이미지';
			htmlval += '<a href="<%=request.getContextPath() %>/member/info/' + searchResult.userId + '">';
			htmlval += '<img class="author-thumb" alt="" src="' + searchResult.profileUrl + '">';
			htmlval += '</a>';
			htmlval += '</span>';
			htmlval += '<span class="author-meta">';
			htmlval += '<span class="post-name">' + searchResult.nickname + '</span>';
			htmlval += '<span class="post-date">' + searchResult.createDate + '</span><span class="post-read"></span>';
			htmlval += '</span>';
			htmlval += '<span class="post-read-more">';
			if(loggedIn) {
				if(userName != searchResult.userId) {
					htmlval += '<span>';
					if(searchResult.bookmarkCnt == 1) {
						htmlval += '<img data-postid="' + searchResult.postId + '" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addedB.png">';
					}
					if(searchResult.bookmarkCnt == 0) {
						htmlval += '<img data-postid="' + searchResult.postId + '" class="bookmarkBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addB.png">';
					}
					htmlval += '</span>';
					htmlval += '<span>';
					if(data.likeCnt == 1) {
						htmlval += '<img data-postid="' + searchResult.postId + '" class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addedL.png">';
					}
					if(data.likeCnt == 0) {
						htmlval += '<img data-postid="' + searchResult.postId + '" class="likeBtn" style="cursor: pointer;" alt="" width="25px" src="<%=request.getContextPath()%>/resources/icons/addL.png">';
					}
					htmlval += '</span>';
				}
				
			}
			htmlval += '<!-- ';
			htmlval += '<img class="svgIcon-use" id="bookmarkBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addB.png">';
			htmlval += '<img class="svgIcon-use" id="likeBtn" style="cursor: pointer;" alt="" width="25" height="25" src="<%=request.getContextPath()%>/resources/icons/addL.png">';
			htmlval += '-->';
			htmlval += '</span>';
			htmlval += '</div>';
			htmlval += '</div>';
			htmlval += '</div>';
			htmlval += '</div>';
		}
		console.log(htmlval);
		$("#postList").html(htmlval);
	}
</script>
</body>
</html>