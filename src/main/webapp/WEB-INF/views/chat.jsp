<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
	<input type="text" id="message" />
	<input type="button" id="send" value="메시지 전송"/>
	<p>
	<textarea id="messageArea" rows="10" cols="35" style="text-align: left;"></textarea>

</body>
<script type="text/javascript">
	$("#send").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let socket = new SockJS("http://localhost:8090/everyrecipe/chat/"); //SockJS 객체 생성
	socket.onmessage = recieveMsg // onmessage = 메시지 수신 이벤트
	socket.onclose = Disconnection // onclose = 웹소켓의 연결이 끊어지면 발생
	
	// 메시지 전송
	function sendMessage() {
		socket.send($("#message").val());
	}
	// 받은 메시지 출력
	function recieveMsg(recieve) {
		var data = recieve.data;
		$("#messageArea").append(data + "&#10;"); // &#10; = textarea 개행 
	}
	// 서버와 연결이 끊어짐
	function Disconnection(discon) {
		$("#messageArea").append("서버와의 연결이 끊어졌습니다.");
	}
</script>
</html>