<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jquery js-->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<!-- Socket js -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
</head>
<body>
	<div class="container">
		<div class="col-6">
			<label><b>채팅방</b></label>
		</div>
		<div>
			<div id="msgArea" class="col">
			
			</div>
			<div class="col-6">
			<div class="input-group mb-3">
				<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
				</div>
			</div>
			</div>
		</div>
		<div class="col-6">
		</div>
	</div>
	
	
	
	<script type="text/javascript">

	var sock = new SockJS('http://localhost:8083/petkage/chatting/');
	sock.onmessage = onMessage;
	sock.onopen = onOpen;
	sock.onclose = onClose;
	
	// 전송 버튼 누르는 이벤트
	$("#button-send").on("click", function(e) {
		console.log("send message");
		sendMessage();
		$('#msg').val('')
	});
	
	function sendMessage() {
		sock.send($("#msg").val());
	}
	
	// 채팅창에 들어왔을 때
	function onOpen(evt) {
		
		var user = '${ loginMember.userName }';
		var str = user + "님이 입장하셨습니다.";
		
		$("#msgArea").append(str);
	}
	
	// 서버에서 메시지를 받았을 때
	function onMessage(msg) {
		
		var data = msg.data;
		var sessionId = null; // 데이터를 보낸 사람
		var message = null;
		
		var arr = data.split(":");
		
		for(var i=0; i<arr.length; i++){
			console.log('arr[' + i + ']: ' + arr[i]);
		}
		
		var currentUser_session = '${ loginMember.userName }'; // 현재 세션에 로그인 한 사람
		console.log("currentUser_session : " + currentUser_session);
		
		sessionId = arr[0];
		message = arr[1];
		
	    // 로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
		if(sessionId == currentUser_session){
			
			var str = "<div class='col-6'>";
			str += "<div class='alert alert-secondary'>";
			str += "<b>" + sessionId + " : " + message + "</b>";
			str += "</div></div>";
			
			$("#msgArea").append(str);
		}
		else{
			
			var str = "<div class='col-6'>";
			str += "<div class='alert alert-warning'>";
			str += "<b>" + sessionId + " : " + message + "</b>";
			str += "</div></div>";
			
			$("#msgArea").append(str);
		}
		
	}
	
	// 채팅창에서 나갔을 때
	function onClose(evt) {
		
		var user = '${ loginMember.userName }';
		var str = user + " 님이 퇴장하셨습니다.";
		
		$("#msgArea").append(str);
	}
	
	
	
	</script>

</body>
</html>