<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatroom list</title>
<%@ include file="/WEB-INF/views/css_import.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/detail.css" rel="stylesheet">
<style>
td, th{
	text-align: center;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<table class="table table-hover" align="center">
    <thead style="background-color: #FFD7D1; color: #FA7F7F;">
        <tr>
            <th>방번호</th>
            <th>채팅방 제목</th>
            <th>개설자</th>
            <th>참여자수</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${empty chatRoomList}">
                <tr>
                    <td colspan="4" align="center">존재하는 채팅방이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="chatRoom" items="${chatRoomList }">
                	<c:set var="num" value="${num+1}"/>
                    <tr>
                        <td>${num}</td>
                        <td>
                            ${chatRoom.title }                            
                        </td>
                        <td>
                            ${chatRoom.userId }
                        </td>
                        <td>
                            ${chatRoom.cnt }
                        </td>
                        <td>
                        <c:if test="${!empty loginUser }">
                            	<c:choose>
                            		<c:when test="${loginUser eq 'everysrecipe0'}">
		                                <button class="btn btn-outline-primary" 
		                                onclick="location.href='<%=request.getContextPath() %>/chat/room/${chatRoom.key}?id=${chatRoom.userId }'">
		                                	입장
		                                </button>
                                	</c:when>
                                	<c:when test="${loginUser eq chatRoom.userId}">
		                                <button class="btn btn-outline-primary" 		       
		                                onclick="location.href='<%=request.getContextPath() %>/chat/room/${chatRoom.key}?id=${chatRoom.userId }'">
		                                	입장
		                                </button> 
                                	</c:when>
                                	<c:otherwise>
                                		<button class="btn btn-outline-primary" onclick="alert('관리자 또는 개설자만 입장 가능합니다.')">
                                			입장
                                		</button>
                                	</c:otherwise>
                                </c:choose>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
<div style="margin-left: 3%;">
 	 <h5 style="display: inline-block; font-weight: bold;">${loginUser }</h5><div style="display: inline-block;">&nbsp;님 안녕하세요.</div>
</div>

<!-- 로그인이 되어있는 경우 -->
<c:if test="${!empty loginUser }">
    <div class="btn-area" style="float: right; margin-right: 8%;">
        <button data-toggle="modal" data-target="#chatModal" class="btn btn-primary">
            채팅방 생성
        </button>
    </div>
</c:if>
<div>
<br><br>
</div>

<div class="modal fade" id="chatModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">채팅방 생성</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="<%=request.getContextPath() %>/chat/openChatRoom" method="post">
                <div class="modal-body">
                    <label for="title" class="mr-sm-2">제목</label>
                    <input type="text" class="form-controll mb-2 mr-sm-2" placeholder="채팅방 제목" id="title" name="title">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">만들기</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>