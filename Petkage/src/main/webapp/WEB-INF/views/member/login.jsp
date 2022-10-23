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

<%-- 구글 API --%>
<meta name ="google-signin-client_id" content ="559389777930-91p4mafho57paqbtc0uni4ueu8t1098n.apps.googleusercontent.com">

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
	                <input type="password" class="form-control" placeholder="비밀번호를 입력해 주세요" id="userPwd" name="userPwd" autoComplete="off">
	              </div>
	              
	              <div class="d-flex mb-5 align-items-center">
	                <!-- 아이디 저장 -->
	                <label class="control control--checkbox mb-0"><span class="caption">Remember ID</span>
	                  <input type="checkbox" id="saveId" name="saveId" ${ empty cookie.saveId ? "" : "checked" } >
	                  
	                  <div class="control__indicator"></div>
	                </label>
	
	                <span class="ml-auto">
	                  <a href="#" class="forgot-pass" id="btnFindId" onclick="location.href='${ path }/member/findMyIdPage'">Forgot ID</a>
	                  <span class="forgot-pass"> / </span>
	                  <a href="#" class="forgot-pass" id="btnFindPwd" onclick="location.href='${ path }/member/findMyPwdPage'">Forgot Password</a>
	                </span> 
	              </div>
	
	              <div id="btnLoginBox">
	                <input type="submit" value="로그인" class="btn btn-block" id="btnLoin" disabled="">
	
	                <button type="button" class="btn btn-block" id="kakaoLogin" onclick="location.href='javascript:loginWithKakao()'">
	                	카카오톡으로 로그인
	                </button>
	
	                <button type="button" class="btn btn-block" id="naver_id_login" onclick="location.href='${url}'">
	                	네이버로 로그인
	                </button>
	
					<button type="button" class="btn btn-block" id="googleLogin" onclick="loginWithGoogle()">
	                	구글로 로그인
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

	<%-- 카카오 회원가입 --%>
	<form name="kakaoForm" id="kakaoEnrollForm" method="POST" action="${path}/member/setKakaoInfo">
		<input type="hidden" name="kakao_kakaoId" id="kakao_kakaoId" />
		<input type="hidden" name="kakao_email" id="kakao_email" />
		<input type="hidden" name="kakao_name" id="kakao_name" />
		<input type="hidden" name="enroll_Type" id="enroll_Type" value="KAKAO" />
	</form>
	<%-- 카카오 로그인 --%>
	<form name="kakaoForm" id="kakaoLoginForm" method="POST" action="${path}/member/login_kakao">
		<input type="hidden" name="kakaoId" id="kakaoId" />
		<input type="hidden" name="kakaoEmail" id="kakaoEmail" />
		<input type="hidden" name="kakaoName" id="kakaoName" />
		<input type="hidden" name="enroll_Type" id="enrollType" value="KAKAO" />
	</form>



	</section>
	
	<script src="${ path }/js/member/jquery-3.6.0.js"></script>
	<script src="${ path }/js/member/popper.min.js"></script>
	<%-- <script src="${ path }/js/member/bootstrap.min.js"></script>
	<script src="${ path }/js/member/main.js"></script> --%>
	<script src="${ path }/js/member/login.js"></script>

<%-- 카카오 JavaScript 키 - 5b193b0622a9f557a7fdcc91e98cd2d0 --%>

<%-- 카카오 API --%>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	window.Kakao.init('5b193b0622a9f557a7fdcc91e98cd2d0'); // 카카오에서 발급받은 JavaScript 키 (초기화 함수 호출)
	console.log(Kakao.isInitialized()); // sdk 초기화여부판단 

	//카카오로그인
	function loginWithKakao() {
		Kakao.Auth.login({
			success: function (res) {
			Kakao.API.request({
				url: '/v2/user/me',
				data: {
					property_keys: ['id', 'properties.nickname', 'kakao_account.email'],
				},
				success: function (res) {
					kakaoLoginPro(res)
					console.log(res);

					var token = Kakao.Auth.getAccessToken();
					Kakao.Auth.setAccessToken(token);			// 토큰 설정
					console.log("token: " + token);
				},
				
				fail: function (error) {
					// 카카오 로그인 실패 시 alert 창
					alert('로그인에 실패하였습니다.');
				},
			})
			},
			fail: function (error) {
				location.href="${ path }/member/loginPage";
			},
		})
	} // loginWithKakao

	function kakaoLoginPro(res){
		var kakao_kakaoId = res.id; // 카카오 email
		var kakao_email = res.kakao_account.email; // 카카오 닉네임(이름)
		var kakao_name = res.properties.nickname; 
	
		$.ajax({
				type : 'POST',
				url : '${path}/member/kakaoLoginPro',
				data : {
					kakao_kakaoId,
					kakao_email,
					kakao_name
					},
				dataType : 'text',
				success : function(result){
					console.log("result : " + result)
					console.log("kakaoId : " + kakao_kakaoId)

					if(result == "Kakao_Login"){
						$('#kakaoId').val(kakao_kakaoId);
						$('#kakaoLoginForm').submit();

						alert("[Petkage] 카카오톡으로 로그인을 시작합니다.");
					} else if(result == "Kakao_Enroll"){
						console.log("success : " + result)
						console.log(kakao_kakaoId)

						$('#kakao_kakaoId').val(kakao_kakaoId);
						$('#kakao_email').val(kakao_email);
						$('#kakao_name').val(kakao_name);
						$('#kakaoEnrollForm').submit();

						alert("[Petkage] 카카오톡으로 가입을 시작합니다.");
					} else {
						alert("로그인에 실패했습니다");
					}
				}, // success
				error: function(xhr, status, error){
					alert("로그인에 실패했습니다." + error);
				}
			}) // ajax
	}; // kakaoLoginPro
</script>
<%-- 구글 API --%>
<%-- <script src="https://apis.google.com/js/platform.js" async defer></script> --%>
<script src="https://accounts.google.com/gsi/client" async defer></script>


<script>
function loginWithGoogle(response) {
    // console.log("Encoded JWT ID token: " + response.credential);
	var googleToken = response.credential;
	console.log(googleToken);

	$.ajax({
		type : 'POST',
		url : '${path}/member/googleToken',
		data : {
			googleToken
			},
		dataType : 'text',
		success : function(result){
			console.log(result);
		}
	})

	    var base64Url = googleToken.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
	console.log(jsonPayload);
    // return JSON.parse(jsonPayload);
}

window.onload = function () {
	google.accounts.id.initialize({
	client_id: "559389777930-91p4mafho57paqbtc0uni4ueu8t1098n.apps.googleusercontent.com",
	callback: loginWithGoogle
	});
	google.accounts.id.renderButton(
	document.getElementById("googleLogin"),
	{ theme: "none"}  // customization attributes
	);
}



// </script>  

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>