<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" href="fonts/icomoon/style.css"> -->

<!-- <link rel="stylesheet" href="../CSS/owl.carousel.min.css"> -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${ path }/css/member/bootstrap.min.css">

<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
  integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
  crossorigin="anonymous"
/>

<!-- Style -->
<link rel="stylesheet" href="${ path }/css/member/login.css"> 
</head>
<body>
	<section class="login">
	  <div class="d-lg-flex half">
	    <div class="bg order-1 order-md-2" style="background-image: url('${ path }/images/member/login_main.png'); overflow: hidden;"></div>
	    <div class="contents order-2 order-md-1">
	      <div class="container">
	        <div class="row align-items-center justify-content-center">
	          <div class="col-md-7">
	            <h3>Login to <strong><span style="color: #753422;">Pet</span>kage</strong></h3>
	            <p class="mb-4">당신의 Petkage를 입력해주세요.</p>
	            
	            <form action="${ path }/member/login" method="post">
	              <div class="form-group first">
	                <label for="userId">아이디</label>
	                <input type="text" class="form-control" placeholder="아이디를 입력해 주세요" id="userId" name="userId" >
	                <!-- value="${ empty cookie.saveId ? '' : cookie.saveId.value }" -->
	              </div>
	              <div class="form-group last mb-3">
	                <label for="userPwd">비밀번호</label>
	                <input type="password" class="form-control" placeholder="비밀번호를 입력해 주세요" id="userPwd" name="userPwd">
	              </div>
	              
	              <div class="d-flex mb-5 align-items-center">
	                <!-- 아이디 저장 -->
	                <label class="control control--checkbox mb-0"><span class="caption">Remember ID</span>
	                  <input type="checkbox" id="saveId" name="saveId" ${ empty cookie.saveId ? "" : "checked" } >
	                  
	                  <div class="control__indicator"></div>
	                </label>
	
	                <span class="ml-auto">
	                  <a href="#" class="forgot-pass" id="btnFindId" onclick="location.href='${ path }/member/findMyId'">Forgot ID</a>
	                  <span class="forgot-pass"> / </span>
	                  <a href="./findMyPwd.html" class="forgot-pass" id="btnFindPwd" onclick="location.href='${ path }/member/findMyPwd'">Forgot Password</a>
	                </span> 
	              </div>
	
	              <div id="btnLoginBox">
	                <input type="submit" value="로그인" class="btn btn-block" id="btnLoin" disabled="">
	
	                <button type="button" class="btn btn-block" id="kakaoLogin" onclick="loginWithKakao()">
	                  카카오톡으로 로그인
	                </button>
	
	                <button type="button" class="btn btn-block" id="naverLogin">
	                  네이버로 로그인
	                </button>
	
	                <span class="JoinMsg">
	                  아직 <strong><span style="color: #753422;">Pet</span>kage</strong>의 회원이 아니신가요?<br>
	                  회원가입을 하시면 다양한 혜택이 준비되어 있습니다.
	                </span>
	                <button type="button" class="btn btn-block" id="btnJoinMember" onclick="location.href='${ path }/member/enroll'" >
	                  회원가입
	                </button>
	              </div>
	            </form>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	
	<script src="${ path }/js/member/jquery-3.6.0.js"></script>
	<script src="${ path }/js/member/popper.min.js"></script>
	<script src="${ path }/js/member/ootstrap.min.js"></script>
	<script src="${ path }/js/member/main.js"></script>
	<script src="${ path }/js/member/login.js"></script>

	<!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			Kakao.init('script앱키 입력');
			Kakao.isInitialized();
		});

		function loginWithKakao() {
			Kakao.Auth.authorize({ 
			redirectUri: 'http://localhost:8083/kakao_callback' 
			}); // 등록한 리다이렉트uri 입력
		}
	</script>
	
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>