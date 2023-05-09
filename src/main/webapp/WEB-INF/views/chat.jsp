<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<style>
*{
	margin: 0;
	padding: 0;
} 

.chat_wrap .header{
	font-size: 14px;
	padding: 15px 0;
	background: #F18C7E;
	color: white;
	text-align: center;
} 
.chat_wrap .chat{
	height:450px;
} 
.chat_wrap .input-div{
	bottom: 0;
	width: 100%;
	background-color: #FFF;
	text-align: center;
	border-top: 1px solid #F18C7E;
	border-bottom:1px solid #F18C7E;
}
.chat_wrap .input-div > textarea{
	width: 100%;
	height: 80px;
	border: none;
	padding: 10px;
	outline: none;
} 
#msgArea{
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
	overflow-y: scroll;
	font-size: 18px;
	font-family: "Dotum";
	font-weight: bold;
	padding-left: 10px;
	outline: none;
} 
.format{
	display: none;
}
</style>
</head>
<body>

<div class="chat_wrap">
    <div class="header">
        CHAT
    </div>    
   <!--
   	상대방 직접 입력
   <input type="text" id="targetUser" placeholder="상대방 아이디">
    --> 
   	상대방 아이디:
   	<c:choose>
   		<c:when test="${loginUser ne 'everysrecipe0'}">
   			<select class="targetUser" disabled>
   				<option value="everysrecipe0" selected>everysrecipe0</option>
   			</select>
   		</c:when>
   		<c:otherwise>
   			<!-- 관리자가 사용자를 선택하는 경우
   			<select class="targetUser">
    			<c:forEach var="id" items="${idlist }">
    				<option value="${id.userId }">${id.userId }</option>
    			</c:forEach>
    		</select>
    		  -->
    		<!-- 방 개설자 고정 -->
			<select class="targetUser" disabled>
				<option value="${param.id }" selected>${param.id }</option>
			</select>    		  
    	</c:otherwise>   	
   	</c:choose>
    
    <div class="chat">
            <textarea id="msgArea" readonly="readonly">
            <c:forEach var="ctlist" items="${chatlist }">
${ctlist.userId }: ${ctlist.message }
            </c:forEach>
―――――――――――――여기까지 읽음――――――――――――――     
			</textarea>
    </div>
    <div class="input-div">
        <textarea placeholder="Press Enter for send message." id="chatMsg"></textarea>
    </div>    
</div>
<div class="row">
	<div class="col-md-6" style="display:inline-block;">
		<div style="margin: 15px 0 0 20px;">
    		<button class="btn-send btn text-white" style="background-color: #F18C7E;">전송</button>
    	</div>
	</div>
	<div class="col-md-6 delete-exit-div" style="display: flex; justify-content: flex-end;">
		<div class="delete-btn" style="display:inline-block; margin: 15px 15px 0 0;">
			<button class="btn btn-danger delete-room" id="deleteRoom"
			onclick="location.href='<%=request.getContextPath()%>/chat/delete?chatRoomNo=${chatRoomNo}'">
			방삭제
			</button>
		</div>
		<div class="exit-btn" style="display:inline-block; margin: 15px 15px 0 0;">
			<form action="<%=request.getContextPath()%>/chat/exit" method="get">
				<input type="hidden" name="userId" value="${loginUser }"/>
				<input type="hidden" name="key" value="${chatRoomNo }"/>
				<button type="submit" class="btn btn-danger exit-room">방 나가기</button>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
var ws;
var userid = "${loginUser }";
var targetid = $(".targetUser option:selected").val();

function connect(){
	ws = new WebSocket("ws://localhost:8090/everyrecipe/chat/websocket");
	
	ws.onopen = function(){
		register();
		$(".btn-send").hide();
	};
	ws.onmessage = function(e){
		var data = e.data;
		addMsg(data);
	};

	ws.onclose = function(){
		alert('상대방이 채팅을 종료한 상태입니다. 전송버튼을 통해 메세지를 보낼 수 있습니다.')
		$(".btn-send").show();
		$(".btn-send").on("click", sendBtn);
		function sendBtn(){
		 $.ajax({
			 type : 'GET',
	         url  : '${pageContext.request.contextPath}/chat/addmsg',
	         async : false,
	         data : {
	        	 key: "${chatRoomNo}",
	        	 message: $("#chatMsg").val(),
	        	 userid: "${loginUser }"
	        	 },
	         success : function(result){
	        	 var chat = $("#msgArea").val();
	        	 chat = chat + "\n" + userid +" :" + $("#chatMsg").val() + "\n";
	        	 $("#msgArea").val(chat);
	        	 $("#chatMsg").val("");
	        	 
	        	 var autoscroll = $("#msgArea").prop('scrollHeight');
				 $("#msgArea").scrollTop(autoscroll);
			 }
		 })
		}
	}	
};
	function addMsg(msg){
		var chat = $("#msgArea").val();
		chat = chat + "\n"+ targetid + " : " + msg + "\n";
		$('#msgArea').val(chat);
	};
	
	function register(){
		var msg = {
			type: "register",
			userid: "${loginUser }",
			key : "${chatRoomNo}"
		}
		ws.send(JSON.stringify(msg));
	};
	
	function sendMsg(){
		var msg = {
			type: "chat", 
			target: $(".targetUser option:selected").val(),
			userid: "${loginUser }",
			message: $("#chatMsg").val(),
			key : "${chatRoomNo}"
		}
		ws.send(JSON.stringify(msg));
		console.log(msg);
	};
	
	// 앤터키 누르면 메세지 전송
	$(function(){
		connect();
		$(document).on('keydown', function(e){
			if(e.keyCode == 13 && !e.shiftKey) {
	        e.preventDefault();
	        
	        if($(".targetUser option:selected").val() != ""){
				var chat = $("#msgArea").val();
				chat = chat + "\n" + userid +" :" + $("#chatMsg").val() + "\n" ;
				
				$("#msgArea").val(chat);
				sendMsg();
				$("#chatMsg").val("");		
				
				var autoscroll = $("#msgArea").prop('scrollHeight');
				$("#msgArea").scrollTop(autoscroll);
	        } else{
	        	alert("상대방 아이디를 선택하시오.");        	
	        }
		}
	})	
});	

//채팅 페이지 로딩시 스크롤바 가장 하단으로 자동 이동
$(window).ready(function(){
	  $('#msgArea').scrollTop($("#msgArea")[0].scrollHeight - $("#msgArea").height()); 
});
	


	
$(".exit-room").on("click", exitRoom);
function exitRoom(){
	alert('채팅을 종료합니다.');	
}

$(".delete-room").on("click", deleteRoom);
function deleteRoom(){
	alert('채팅방과 대화내역이 삭제됩니다.');	
}


</script>
</body>
</html>