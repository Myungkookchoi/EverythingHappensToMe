<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
	<div class="wordContainer">
		<h3 id="pastText"></h3>
		<div style="width: 500px; height: 150px;">
			<h1 id="mainText">바나나</h1>
		</div>
	</div>

	<div class="playerList"></div>

	<div class="chatting"
		style="overflow: auto; width: 500px; height: 150px;"></div>
	<div class="playerChat">
		${id} : <input type="text" id="message"/> <input type="submit"
			id="sendBtn" value="전송" />
	</div>

</body>
<script type="text/javascript">

	var input = document.getElementById("message");

	input.addEventListener("keyup", function(event) {
		if (event.keyCode === 13) {
			if ($("#message").val() == '') {
				$('#message').val('');
			} else {
				sendMessage();
			}
		}
	});

	$("#sendBtn").click(function() {
		//빈 채팅이 오면 안 보냄
		if ($("#message").val() == '') {
			$('#message').val('');
		} else {
			sendMessage();
		}
	});

	let sock = new SockJS("http://localhost:8088/mk/echo/");
	sock.onmessage = onMessage;
	sock.onopen = onOpen;
	sock.onclose = onClose;

	// 채팅방에 들어왔들 때
	function onOpen(evt) {
		var str = [ "${id}" + "님이 입장하셨습니다." ];
		sock.send(str);
	}
	// 메시지 전송
	function sendMessage() {
		var msg = [ $("#message").val(), "${id}" ];
		sock.send(msg);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var msgList = msg.data;
		msgList = msgList.split(",");
		if (msgList[1] == undefined) {
			$(".chatting").append(msgList[0] + "<br>");
		} else {
			$(".chatting").append(msgList[1] + " : " + msgList[0] + "<br>");

			var lastText = $("#mainText").text()[$("#mainText").text().length - 1];
			var inputFirstText = msgList[0][0];

			if (lastText == inputFirstText) {
				$("#mainText").text(msgList[0]);
				$('#message').val('');
			} else {
			}
			$('#message').val('');
		}
		$(".chatting").scrollTop($(".chatting")[0].scrollHeight);
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	}
</script>
</html>