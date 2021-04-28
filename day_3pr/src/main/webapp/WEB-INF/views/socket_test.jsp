<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script>
$(document).ready(function(){
	
	let sock = new SockJS("http://localhost:9090/com/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send($("#name").text()+":"+$("#message").val());
	}
	if("<%=session.getAttribute("name") %>" == "없음" || "<%=session.getAttribute("name") %>" == "null")
		$("#message").attr("readonly",true);
	else
		$("#message").attr("readonly",false);
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data+"\n");
		$("#messageArea").scrollTop($("#messageArea").prop('scrollHeight') );
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	}
	
	$("#message").keydown(function() {
		if (window.event.keyCode == 13) {
			if($("#message").val()=='')return;
			sendMessage();
			$('#message').val('');
	  	 }
	});
});

</script>
</head>
<body>
	<div>
		<textarea  id="messageArea" readonly="readonly" rows="10" cols="111"></textarea>
		<input id ="message" readonly="readonly" type="text" size=122 height=10 id="message"/>
		<!-- <input type="button" id="sendBtn" value="submit"/> -->
	</div>
</body>
</html>