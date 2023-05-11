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
<style type="text/css">
.row.post-top-meta {
  display: flex;
  justify-content: center;
}

.col {
	display: flex;
  	justify-content: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="listrecent">
	<form>
		<div class="row post-top-meta">
			<div class="col">
				<input type="text" name="keyword" id="foodSearchKeyword" style="height: 60px; width: 60%" value="${keyword }">
			</div>
		</div>
	</form>
		<div class="row post-top-meta">
			<div class="col">
				<div class="btn-group" role="group" aria-label="Basic example">
				  <button type="button" class="btn btn-secondary" onclick="clickSearchKey()">음식이름 검색</button>
				  <button type="button" class="btn btn-secondary" onclick="searchHash()">해시태그 검색</button>
				  <div class="btn-group" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				      	이용자 검색
				    </button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				      <a class="dropdown-item" onclick="searchUserId()">아이디로 검색</a>
				      <a class="dropdown-item" onclick="searchUserNickname()">닉네임으로 검색</a>
				    </div>
				  </div>
				</div>
				<!-- 
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="searchoption" id="inlineRadio1" value="foodName" checked="checked">
				  <label class="form-check-label" for="inlineRadio1">음식 이름</label>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="searchoption" id="inlineRadio2" value="hashTag">
				  <label class="form-check-label" for="inlineRadio2">해시태그</label>
				</div>
				 -->
			</div>
		</div>
		<fieldset id="recommendList" style="text-align: center;">
			<legend>추천 검색어</legend>
			<c:forEach items="${recommendKey }" var="key" varStatus="rkStatus">
				<button type="button" data-keyword="${key.keword }" class="btn_redirectSearch" style="border-style: dotted; border-radius: 10px; border-width: 3px; background: none;">${key.keword }</button>
			</c:forEach>
		</fieldset>
	<div class="listrecent container">
	<div id="postList" class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach items="${postList }" var="list" varStatus="stqatus">
			<div class="col-md-4 mt-3">
				<div class="card">
					<img alt="" src="${list.mainImage }" width="100%" style="max-height: 300px">
					<div class="card-block">
						<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/${list.postId}">${list.foodName }</a></h2>
						<h4 class="card-text">${list.content }</h4>
						<div class="wrapfooter">
							<span class="meta-footer-thumb">
								<a href="<%=request.getContextPath() %>/member/info/${list.userId }">
									<img class="author-thumb" alt="" src="${list.profileUrl }">
								</a>
							</span>
							<span class="author-meta  mt-2">
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
</div>

<div class="list">
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
<%@ include file="/WEB-INF/views/js_import.jsp" %>

<script>
	function clickSearchKey() {
		var keyword = $("#foodSearchKeyword").val();
		$.ajax({
			url:'${pageContext.request.contextPath}/keyword/isvisiblekeyword',
			type:"GET",
			data:{
				keyword: keyword
			},
			success: function(data) {
				if(data == 1) { //차단된 여부 확인
					searchKey();
				} else if(data == 0) { //차단되었거나 검색어가 없음.
					searchResultKeywordData(keyword)
				}
			}
		});
	}
	
	function searchResultKeywordData(keyword) {
		$.ajax({
			url: '${pageContext.request.contextPath}/keyword/isavailedkeyword',
			type: "GET",
			data:{
				keyword: keyword
			},
			success: function(data) {
				if(data == 1) { // 차단되어 검색어가 검색이 안되었던 상황
					alert('관리자에 의해 차단되어진 검색어 이거나, 검색이 불간능한 검색어 입니다.다른 키워드로 검색 바랍니다.');
				} else { //검색어가 아예 없음
					searchKey();
				}
			}
		});
	}
	
	function searchKey() {
		  var keyword = $("#foodSearchKeyword").val();
		  
		  $.ajax({
		    url: "<%=request.getContextPath() %>/board/findfoodajax",
		    type: "GET",
		    data: {
		    	keyword: keyword
		    	},
		    dataType: "json",
		    success: function(data) {
		    	if(data.length < 1) {
		    		alert("검색결과가 없습니다.");
		    	} else if(data.length > 0) {
		    	} else {
		    		alert("알 수 없는 오류가 발생되었습니다.");
		    	}
		    	
		    	displayList(data);
		    }
		  });
		}
	
	function searchHash() {
		  var keyword = $("#foodSearchKeyword").val();
		  
		  $.ajax({
		    url: "<%=request.getContextPath() %>/board/findhashajax",
		    type: "GET",
		    data: {
		    	keyword: keyword
		    	},
		    dataType: "json",
		    success: function(data) {
		    	if(data.length < 1) {
		    		alert("검색결과가 없습니다.");
		    	} else if(data.length > 0) {
		    		
		    	} else {
		    		alert("알 수 없는 오류가 발생되었습니다.");
		    	}
		    	
		    	displayList(data);
		    }
		  });
		}
	
	function searchUserId() {
		var keyword = $("#foodSearchKeyword").val();
		$.ajax({
			url: "<%=request.getContextPath() %>/board/findUserIdAjax",
			type: "GET",
			data: {
				keyword: keyword
			},
			dataType: "json",
			success: function(data) {
				if(data.length < 1) {
		    		alert("검색결과가 없습니다.");
		    	} else if(data.length > 0) {
		    		
		    	} else {
		    		alert("알 수 없는 오류가 발생되었습니다.");
		    	}
				displaydata(data);
			}
			
		});
	}
	
	function searchUserNickname() {
		var keyword = $("#foodSearchKeyword").val();
		$.ajax({
			url: "<%=request.getContextPath() %>/board/findUserNicknameAjax",
			type: "GET",
			data: {
				keyword: keyword
			},
			dataType: "json",
			success: function(data) {
				if(data.length < 1) {
		    		alert("검색결과가 없습니다.");
		    	} else if(data.length > 0) {
		    		
		    	} else {
		    		alert("알 수 없는 오류가 발생되었습니다.");
		    	}
				displaydata(data);
			}
			
		});
	}
	
	function refreshRecommendKey() {
		$.ajax({
			url: "<%=request.getContextPath() %>/keyword/refreshRecommend",
			type: "GET",
			dataType: "json",
			success: function(data) {
				refreshRecommendData(data);
			}
		})
	}
		
	function searchInsertDB(keyword) {
		$.ajax({
			url:"<%=request.getContextPath() %>/keyword/insertdata",
			type: "GET",
			data:{keyword: keyword},
			success: function(result) {
				if(result == 1) {
					console.log('데이타 삽입 성공');
				} else {
					console.log('데이타 삽입중 문제 발생');
				}
			}
		});
	}
	
	function displayList(data) {
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
			htmlval += '<img alt="" src="' + searchResult.mainImage +'" width="100%" style="max-height: 300px">';
			htmlval += '<div class="card-block">';
			htmlval += '<h2 class="card-title"><a href="<%=request.getContextPath() %>/board/list/' + searchResult.postId + '">' + searchResult.foodName + '</a></h2>';
			htmlval += '<h4 class="card-text"> ' + searchResult.content + '</h4>';
			htmlval += '<div class="wrapfooter">';
			htmlval += '<span class="meta-footer-thumb">';
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
		refreshRecommendKey();
	}
	
	function displaydata(data) {
		console.log(data);
		var htmlval = "";
		var loggedIn = ${loggedIn};
		var userName = "${uName}";
		
		for(i=0;i<data.length;i++) {
			var userdata = data[i];
			var userId = userdata.userId.substring(0,4) + '****';;
			htmlval += '<div class="col-md-3 mt-3">';
			htmlval += '<div class="card">';
			htmlval += '<div class="card-block">';
			htmlval += '<span class="meta-footer-thumb">';
			htmlval += userdata.nickName+'('+ userId +')';
			htmlval += '<a href="<%=request.getContextPath() %>/member/info/' + userdata.userId + '">';
			htmlval += '<img class="author-thumb" alt="" src="' + userdata.profileUrl + '">';
			htmlval += '</a>';
			htmlval += '</span>';
			htmlval += '<span class="author-meta">';
			htmlval += '</span>';
			htmlval += '</div>';
			htmlval += '</div>';
			htmlval += '</div>';
		}
		console.log(htmlval);
		$("#postList").html(htmlval);
	}
	
	function refreshRecommendData(data) {
		console.log(data);
		var htmlval = '<legend>추천 검색어</legend>';
		for(i=0;i<data.length;i++) {
			keydata = data[i];
			htmlval += '<button type="button" data-keyword="' + keydata.keword + '" class="btn_redirectSearch" style="border-style: dotted; border-radius: 10px; border-width: 3px; background: none;">' + keydata.keword + '</button>';
		}
		$("#recommendList").html(htmlval);
		redirect();
	}
	
	$(".btn_redirectSearch").click(function() {
		var keyword = $(this).data('keyword');
		
		location.href="<%=request.getContextPath() %>/board/search?keyword="+keyword;
	});
	
	function redirect() {
		$(".btn_redirectSearch").click(function() {
			var keyword = $(this).data('keyword');
			
			location.href="<%=request.getContextPath() %>/board/search?keyword="+keyword;
		});
	}

</script>
</body>
</html>