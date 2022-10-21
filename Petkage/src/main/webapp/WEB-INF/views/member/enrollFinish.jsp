<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
	<!-- Style -->
	<link rel="stylesheet" href="${ path }/css/member/enroll.css"> 

</head>
<body>
    <section class="join">
    <c:if test="${ !empty enrollMemName }">
      <div class="container">
        <div class="py-5 text-center">
          <h1 style="font-weight: 700;">Welcome to <strong><span style="color: #753422;">Pet</span>kage</strong></h1>
        </div>
        <div style="text-align: center;">
          <p class="complete" style="font-weight: bold;">회원가입이 <strong>완료</strong> 되었습니다.</p>
          <p><span  style="color: #753422; font-weight: bold; font-size:50px">${ enrollMemName }</span>님의 회원가입을 축하합니다. <br>
          지금부터 당신의 
          <span style="color: #753422; font-weight: bold;">
            Pet</span><span style="color: black; font-weight: bold;">kage</span>를 준비하세요 !</p>
        </div>
        <div class="btnBox" style="margin-top: 15px; margin-bottom:15em;">
            <button type="button" id="btnHome" class="btn_login_home" onclick="location.href='${ path }'">홈으로</button>
            <button type="button" id="btnNext" class="btn_login" onclick="location.href='${ path }/member/loginPage'">로그인</button>    
        </div>
       </div>     
      </c:if>
    </section>

    <style>
      canvas {
        z-index:10;
        pointer-events: none;
        position: fixed;top: 0;
        transform: scale(1.1);}
    </style>
    
    <div class="buttonContainer" style="display: none;">
      <button class="canvasBtn" id="stopButton" >Stop Confetti</button>
      <button class="canvasBtn" id="startButton">Drop Confetti</button>	
    </div>

    <canvas id="canvas"></canvas> 


<style>
	canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
</style>

<div class="buttonContainer" style="display: none;">
	<button class="canvasBtn" id="stopButton">Stop Confetti</button>
	<button class="canvasBtn" id="startButton">Drop Confetti</button>	
</div>

<canvas id="canvas"></canvas>


  <!-- 폭죽 --> 
  <script src="${ path }/js/member/jquery-3.6.0.js"></script>
  <script src="${ path }/js/member/confetti_v2.js"></script>
  <script>
  $(document).ready(function(){  
    $("#startButton").trigger("click");
      setTimeout(function(){
        $("#stopButton").trigger("click");
      }, 60000);   
  })
  </script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>