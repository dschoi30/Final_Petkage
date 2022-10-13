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
<title>Petkage</title>
	<!-- Header CSS -->
    <link rel="stylesheet" href="${ path }/resources/css/common/header.css">

	<!-- Main css-->
	<link rel="stylesheet" href="${ path }/resources/css/common/main.css">

	<!-- Footer css -->
    <link rel="stylesheet" href="${ path }/resources/css/common/footer.css">

	<!-- Bootstrap css-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<!-- Fullpage css -->
	<link rel="stylesheet" href="${ path }/resources/css/common/jquery.fullPage.css">

	<!-- Swiper css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">

	<!-- jQuery UI css -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- Font -->
	<style>

		/* 폰트 자체 아래에 여백이 있음 */
		@font-face {
			font-family: "GmarketSansMedium";
			src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
				format("woff");
			font-weight: normal;
			font-style: normal;
		}

		* {
			font-family: "GmarketSansMedium";
		}

		header {
			position:fixed;
			left: 0;
			right: 0;
			top: 0;
			z-index: 100;
		}

		.best_product:nth-child(1) {
			background-color: dodgerblue;
			background-image: url("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/fd26e87c-5667-4cf9-9be9-e58887610efe/debwn8y-2983dd90-137f-4401-bde6-bad8b01a3b62.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2ZkMjZlODdjLTU2NjctNGNmOS05YmU5LWU1ODg4NzYxMGVmZVwvZGVid244eS0yOTgzZGQ5MC0xMzdmLTQ0MDEtYmRlNi1iYWQ4YjAxYTNiNjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6_KZnTjuBOypvaaJ-g2h0SkJfLy9NYxUnnzxJGqWQxA");
		}

		.best_product:nth-child(2) {
			background-color: red;
			background-image: url("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ea37168f-58bf-43ec-b98d-f15c62f681dd/deeo189-b22c4b6a-98dc-4b00-9d1d-abdd1c1cbe18.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2VhMzcxNjhmLTU4YmYtNDNlYy1iOThkLWYxNWM2MmY2ODFkZFwvZGVlbzE4OS1iMjJjNGI2YS05OGRjLTRiMDAtOWQxZC1hYmRkMWMxY2JlMTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.iuMiGBbrrjkoSuGldENnb59OIlgv479aka0KHseZrlw");
		}
		.best_product:nth-child(3) {
			background-color: purple;
			background-image: url("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ea37168f-58bf-43ec-b98d-f15c62f681dd/deeo182-1eddcacc-48ce-46f4-97e4-5a3887af11d1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2VhMzcxNjhmLTU4YmYtNDNlYy1iOThkLWYxNWM2MmY2ODFkZFwvZGVlbzE4Mi0xZWRkY2FjYy00OGNlLTQ2ZjQtOTdlNC01YTM4ODdhZjExZDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.up2-M-e6MoppOZE7S9n9KnEqyyBrjNMw60tk8Fc0xMk");
		}
		.best_product:nth-child(4) {
			background-color: darkorange;
			background-image: url("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/fd26e87c-5667-4cf9-9be9-e58887610efe/debwnip-9f4e2268-87bb-4b2c-81a2-ec18769a9f9c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2ZkMjZlODdjLTU2NjctNGNmOS05YmU5LWU1ODg4NzYxMGVmZVwvZGVid25pcC05ZjRlMjI2OC04N2JiLTRiMmMtODFhMi1lYzE4NzY5YTlmOWMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Svm3i2b8zy-DCKOjfJfxXvX88eBLo4d4xB8MNlh7lXM");
		}
		.best_product:nth-child(5) {
			background-color: yellow;
			background-image: url("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/fd26e87c-5667-4cf9-9be9-e58887610efe/debwnip-9f4e2268-87bb-4b2c-81a2-ec18769a9f9c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2ZkMjZlODdjLTU2NjctNGNmOS05YmU5LWU1ODg4NzYxMGVmZVwvZGVid25pcC05ZjRlMjI2OC04N2JiLTRiMmMtODFhMi1lYzE4NzY5YTlmOWMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Svm3i2b8zy-DCKOjfJfxXvX88eBLo4d4xB8MNlh7lXM");
		}

		.best_product:nth-child(1):after {
			content: "챔피온 티셔츠";
		}

		.best_product:nth-child(2):after {
			content: "메종 선글라스";
		}

		.best_product:nth-child(3):after {
			content: "샤넬 똥봉투";
		}

		.best_product:nth-child(4):after {
			content: "시디즈 캣타워";
		}
	</style>
	
</head>
<body>
	<!-- Channel Plugin Scripts -->
	<script>
	  (function() {
	    var w = window;
	    if (w.ChannelIO) {
	      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	    }
	    var ch = function() {
	      ch.c(arguments);
	    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
	    w.ChannelIO = ch;
	    function l() {
	      if (w.ChannelIOInitialized) {
	        return;
	      }
	      w.ChannelIOInitialized = true;
	      var s = document.createElement('script');
	      s.type = 'text/javascript';
	      s.async = true;
	      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	      s.charset = 'UTF-8';
	      var x = document.getElementsByTagName('script')[0];
	      x.parentNode.insertBefore(s, x);
	    }
	    if (document.readyState === 'complete') {
	      l();
	    } else if (window.attachEvent) {
	      window.attachEvent('onload', l);
	    } else {
	      window.addEventListener('DOMContentLoaded', l, false);
	      window.addEventListener('load', l, false);
	    }
	  })();
	  ChannelIO('boot', {
	    "pluginKey": "dcd4334b-0c76-4864-81ba-8701c893a37e", //please fill with your plugin key
	    "memberId": "${ member.userId }", //fill with user id
	    "profile": {
	      "name": "${ member.userName }", //fill with user name
	      "mobileNumber": "${ member.userPhone }", //fill with user phone number
	      "CUSTOM_VALUE_1": "VALUE_1", //any other custom meta data
	      "CUSTOM_VALUE_2": "VALUE_2"
	    }
	  });
	</script>
	<!-- End Channel Plugin -->

	<section class="hd">
		<header class="d-flex flex-wrap mb-4">
                <a href="${ path }" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                    <img src="${ path }/resources/images/common/Petkage_Logo3.png" alt="" class="headerLogo">
                </a>

                 <ul class="nav nav-pills">
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">어디가지</a></li>
                    <li class="nav-item header_item"><a href="${ path }/market/product-list" class="nav-link header_link">마켓</a></li>
                    <li class="nav-item header_item"><a href="${ path }/tools/toolsMain" class="nav-link header_link">펫키지 툴즈</a></li>
                    <c:if test="${ empty loginMember }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/enroll'" value="회원가입">
	                    <input type="submit" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/loginPage'" value="로그인">
					</c:if>
					
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_USER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/myPage'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/logout'" value="로그아웃">
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_SELLER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/myPage'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/logout'" value="로그아웃">
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/admin'" value="관리자페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/logout'" value="로그아웃">
        			</c:if>
        			
                    <a href="${ path }/market/cart/${ loginMember.no }" class="d-flex align-items-center headercart">
                        <img src="${ path }/resources/images/common/Cart.png" alt="" class="cart">
                    </a>
                </ul>
            </header>
	</section>

	<main id="fullpage">
		<section class="section sec1"> <!-- 메인 화면 -->
			<div class="wrapper">
				<video autoplay playsinline muted loop preload poster="http://i.imgur.com/xHO6DbC.png">
				  <source src="${ path }/resources/videos/갱얼쥐.mp4" />
				</video>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 285 80" preserveAspectRatio="xMidYMid slice">
				  <defs>
					<mask id="mask" x="0" y="0" width="100%" height="100%" >
					  <rect x="0" y="0" width="100%" height="100%" />
					  <text x="78" y="50">petkage</text>
					</mask>
				  </defs>
				  <rect x="0" y="0" width="100%" height="100%" />
				</svg>
			  </div>
			  <div class="wrapper2">
				<video autoplay playsinline muted loop preload poster="http://i.imgur.com/xHO6DbC.png">
				  <source src="${ path }/resources/videos/고양희.mp4" />
				</video>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 285 80" preserveAspectRatio="xMidYMid slice">
				  <defs>
					<mask id="mask2" x="0" y="0" width="100%" height="100%" >
					  <rect x="0" y="0" width="100%" height="100%" />
					  <text x="95" y="50">for pets</text>
					</mask>
				  </defs>
				  <rect x="0" y="0" width="100%" height="100%" />
				</svg>
			  </div>
			  <div class="iconmouse">
				<span class="ball"></span>
			  </div>
			  
			  
  
		</section>
		<section class="section sec2"> <!-- 추천 어디가지 -->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/images/common/Rectangle.png" alt=""/>
						</div>
						<div class="slide_texts">
							<a href="javascript:void(0)" class="slide_text"><h2>플로리다 애견 동반 숙소</h2></a>
							<a href="javascript:void(0)" class="slide_text"><h3>1박 ~10,000원</h3></a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/images/common/Rectangle.png" alt=""/>
						</div>
						<div class="slide_texts">
							<a href="javascript:void(0)" class="slide_text"><h2>플로리다 애견 동반 숙소</h2></a>
							<a href="javascript:void(0)" class="slide_text"><h3>1박 ~20,000원</h3></a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/images/common/Rectangle.png" alt=""/>
						</div>
						<div class="slide_texts">
							<a href="javascript:void(0)" class="slide_text"><h2>플로리다 애견 동반 숙소</h2></a>
							<a href="javascript:void(0)" class="slide_text"><h3>1박 ~30,000원</h3></a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/images/common/Rectangle.png" alt=""/>
						</div>
						<div class="slide_texts">
							<a href="javascript:void(0)" class="slide_text"><h2>플로리다 애견 동반 숙소</h2></a>
							<a href="javascript:void(0)" class="slide_text"><h3>1박 ~40,000원</h3></a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/images/common/Rectangle.png" alt=""/>
						</div>
						<div class="slide_texts">
							<a href="javascript:void(0)" class="slide_text"><h2>플로리다 애견 동반 숙소</h2></a>
							<a href="javascript:void(0)" class="slide_text"><h3>1박 ~50,000원</h3></a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/images/common/Rectangle.png" alt=""/>
						</div>
						<div class="slide_texts">
							<a href="javascript:void(0)" class="slide_text"><h2>플로리다 애견 동반 숙소</h2></a>
							<a href="javascript:void(0)" class="slide_text"><h3>1박 ~60,000원</h3></a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/images/common/Rectangle.png" alt=""/>
						</div>
						<div class="slide_texts">
							<a href="javascript:void(0)" class="slide_text"><h2>플로리다 애견 동반 숙소</h2></a>
							<a href="javascript:void(0)" class="slide_text"><h3>1박 ~70,000원</h3></a>
						</div>
					</div>
				</div>
			</div>
			<div class="texts_right">
				<div class="texts_text">
					<h1>반려동물에게</h1> 
					<h1>행복한 하루를 선물!</h1>
					<h2>다양한 숙소들을 가격별로 비교해보세요!</h2>
				</div>
			</div>
		
		</section>
		<section class="section sec3"> <!-- 추천 상품 -->
			<div class="texts_left">
				<div class="texts_text">
					<h1>추천 상품</h1> 
				</div>
			</div>
			<div class="best_products">
				<div class="best_product"></div>
				<div class="best_product highlight"></div>
				<div class="best_product"></div>
				<div class="best_product"></div>
			</div>
		</section>
		<section class="section sec4"> <!-- 일정 캘린더 -->
				<div class="calendar">
					<div class="my-calendar clearfix">
						<div class="clicked-date">
						<div class="cal-day"></div>
						<div class="cal-date"></div>
						</div>
						<div class="calendar-box">
						<div class="ctr-box clearfix">
							<button type="button" title="prev" class="btn-cal prev">
							</button>
							<span class="cal-month"></span>
							<span class="cal-year"></span>
							<button type="button" title="next" class="btn-cal next">
							</button>
						</div>
						<table class="cal-table">
							<thead>
							<tr>
								<th>S</th>
								<th>M</th>
								<th>T</th>
								<th>W</th>
								<th>T</th>
								<th>F</th>
								<th>S</th>
							</tr>
							</thead>
							<tbody class="cal-body"></tbody>
						</table>
						</div>
					</div>
					<!-- // .my-calendar -->
				</div>
				<div class="texts_right">
					<div class="texts_text">
						<h1>전국 각지 반려동물을!</h1>
						<h2>위한 행사도 확인할 수 있어요.</h2>
					</div>
				</div>
		</section>

		<section class="ft section fp-auto-height"> <!-- 푸터 -->
			<div class="footer_container">
				<footer class="footer_section1">
					<div class="footer">
						<p class="footerName">Petkage</p>
	
						<ul class="nav footer_nav">
							<li class="nav-item footer_item"><a href="#" class="nav-link footer_link">이용약관</a></li>
							<li class="nav-item footer_item"><a href="#" class="nav-link footer_link">개인정보 취급방침</a></li>
							<li class="nav-item footer_item"><a href="${ path }/notice/noticeList" class="nav-link footer_link">공지사항</a></li>
							<li class="nav-item footer_item"><a href="#" class="nav-link footer_link">FAQ</a></li>
						</ul>
	
						<div class="footer_contents">
							<p class="footer_content">회사명 : (주)펫키지 대표 : 문인수 / 전화 : 070-1234-5678 / 주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩</p>
							<p class="footer_content">사업자 등록번호 안내 : 123-45-6789 / 통신판매업 신고 2022-서울강남-03472 <a href="">[사업자정보 확인]</a>  </p>
							<p class="footer_content">&copy;펫키지. All Rights Reserved</p>
						</div>
	
						<div class="footer_icons">
							<a href="/" class="">
                            	<img src="${ path }/resources/images/common/Instagram.png" alt="" class="footericon">
	                        </a>
	                        <a href="/" class="">
	                            <img src="${ path }/resources/images/common/Facebook.png" alt="" class="footericon">
	                        </a>
	                        <a href="/" class="">
	                            <img src="${ path }/resources/images/common/youtube.png" alt="" class="footericon">
	                        </a>
	                        <a href="/" class="">
	                            <img src="${ path }/resources/images/common/kakaotalk.png" alt="" class="footericon">
	                        </a>
						</div>
	
							
						<img src="${ path }/resources/images/common/Pet.png" alt="" class="footerLogo">
					</div>
				</footer>
			</div>
		</section>
	</main>
    
	<!-- jquery js-->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Fullpage js -->
	<script src="${ path }/resources/js/jquery.fullPage.js"></script>

	<!-- Main js -->
	<script src="${ path }/resources/js/main.js"></script> 
	
	<!-- Socket js -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
	<!-- 
	<script type="text/javascript">

	// 전송 버튼 누르는 이벤트
	$("#button-send").on("click", function(e) {
		sendMessage();
		$('#msg').val('')
	});
	
	var sock = new SockJS('http://localhost:8080/chatting');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage() {
		sock.send($("#msg").val());
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
		
		var cur_session = '${userid}'; // 현재 세션에 로그인 한 사람
		console.log("cur_session : " + cur_session);
		
		sessionId = arr[0];
		message = arr[1];
		
	    // 로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
		if(sessionId == cur_session){
			
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
	
	// 채팅창에 들어왔을 때
	function onOpen(evt) {
		
		var user = '${pr.username}';
		var str = user + "님이 입장하셨습니다.";
		
		$("#msgArea").append(str);
	}
	
	// 채팅창에서 나갔을 때
	function onClose(evt) {
		
		var user = '${pr.username}';
		var str = user + " 님이 퇴장하셨습니다.";
		
		$("#msgArea").append(str);
	}
	
	</script>
	
	-->
     
</body>
</html>