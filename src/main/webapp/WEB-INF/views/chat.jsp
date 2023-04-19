<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat page</title>
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
    <select id="targetUser">
    	<c:forEach var="id" items="${idlist }">
    		<option value="${id.userId }">${id.userId }</option>
    	</c:forEach>
    </select>
    <div class="chat">
            <textarea id="msgArea" readonly="readonly">
			</textarea>
    </div>
    <div class="input-div">
        <textarea placeholder="Press Enter for send message." id="chatMsg"></textarea>
    </div>
</div>

<script type="text/javascript">
var ws;
var userid = "${param.id}";

function connect(){
	ws = new WebSocket("ws://localhost:8090/everyrecipe/chat/websocket");
	
	ws.onopen = function(){
		register();
	};
	ws.onmessage = function(e){
		var data = e.data;
		addMsg(data);
	};
	ws.onclose = function(){
	};
}
	function addMsg(msg){
		var chat = $("#msgArea").val();
		chat = chat + "\n"+ "상대방 :" + msg;
		$('#msgArea').val(chat);
	};
	
	function register(){
		var msg = {
			type: "register",
			userid: "${param.id}"
		}
		ws.send(JSON.stringify(msg));
	};
	
	function sendMsg(){
		var msg = {
			type: "chat",
			target: $("#targetUser option:selected").val(),
			message: $("#chatMsg").val()
		}
		ws.send(JSON.stringify(msg));
	};
	
	// 앤터키 누르면 메세지 전송
	$(function(){
		connect();
		$(document).on('keydown', 'div.input-div textarea', function(e){
			if(e.keyCode == 13 && !e.shiftKey) {
	        e.preventDefault();
	        
	        if($("#targetUser option:selected").val() != ""){
				var chat = $("#msgArea").val();
				chat = chat + "\n" + userid +" :" + $("#chatMsg").val();
				
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
		
</script>
</body>
</html>