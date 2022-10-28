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
	</style>
	
	<!-- 파비콘 -->
	<link rel="apple-touch-icon" sizes="120x120" href="${ path }/resources/images/common/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${ path }/resources/images/common/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${ path }/resources/images/common/favicon-16x16.png">
	<link rel="manifest" href="${ path }/resources/images/common/site.webmanifest">
	<link rel="mask-icon" href="${ path }/resources/images/common/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
	
</head>
<body ondragstart="return false" onselectstart="return false">
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
                    <li class="nav-item header_item"><a href="${ path }/wherego/main" class="nav-link header_link">어디가지</a></li>
                    <li class="nav-item header_item"><a href="${ path }/market/product-list" class="nav-link header_link">마켓</a></li>
                    <li class="nav-item header_item"><a href="${ path }/tools/toolsMain" class="nav-link header_link">펫키지 툴즈</a></li>
                    <c:if test="${ empty loginMember }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/enroll'" value="회원가입">
	                    <input type="submit" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/loginPage'" value="로그인">
					</c:if>
					
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_USER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/mypage/myPage_main'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/logout'" value="로그아웃">
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_SELLER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/mypage/sellerPage_list'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/logout'" value="로그아웃">
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/admin/memList'" value="관리자페이지" >
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
				<c:forEach var="wherego" items="${ wherego }">
					<div class="swiper-slide">
						<c:set var="rename_wherego" value="${ wherego.renameImg }" />
						<c:if test="${ wherego.spotCategory == '숙소' }"> 
							<a href="${ path }/wherego/wherego_lodging_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '카페' }"> 
							<a href="${ path }/wherego/wherego_cafe_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '맛집' }"> 
							<a href="${ path }/wherego/wherego_food_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '미용' }"> 
							<a href="${ path }/wherego/wherego_hair_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '여행지' }"> 
							<a href="${ path }/wherego/wherego_cafe_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '동물병원' }"> 
							<a href="${ path }/wherego/wherego_hospital_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '유치원' }"> 
							<a href="${ path }/wherego/wherego_preschool_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '셀프목욕' }"> 
							<a href="${ path }/wherego/wherego_bath_detail?no=${ wherego.spotNo }">
						</c:if>	
						<c:if test="${ wherego.spotCategory == '펫시터' }"> 
							<a href="${ path }/wherego/wherego_petsitter_detail?no=${ wherego.spotNo }">
						</c:if>	
						<div class="slide_images">
							<img class="slide_image" src="${ path }/resources/upload/wherego/${ fn:substring(rename_wherego,0,21) }" alt=""/>
						</div>
						<div class="slide_texts">
							<a class="slide_text"><h2>${ wherego.spotName }</h2></a>
							<a class="slide_text"><h3>${ wherego.introduce }</h3></a>
						</div>
						</a>
					</div>
				</c:forEach>
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
				<c:forEach var="product" items="${ product }">
				<c:set var="rename_product" value="${ product.renamedFileName }" />   
				<a href="${ path }/market/product-view?proNo=${ product.proNo }">
				<div class="best_product" 
				style='background-image: url("${ path }/resources/upload/market/${ fn:substring(rename_product,0,22) }");' proName= "${ product.proName }">
				</div>
				</a>
				</c:forEach>
				<div class="best_product highlight" style="display: none;">
				</div> 
			</div>
		</section>
		
		<section class="section sec4"> <!-- 일정 캘린더 -->
			<c:forEach var="calendar" items="${ calendar }">
				<div class="cal_content" id="cal_no" value="${ calendar.calNo }" style="display:none"></div>
				<div class="cal_content" id="cal_title" value="${ calendar.calTitle }" style="display:none"></div>
				<div class="cal_content" id="cal_content" value="${ calendar.calContent }" style="display:none"></div>
				<div class="cal_content" id="cal_date" value="${ calendar.calDate }" style="display:none"></div>
            </c:forEach>
				<div class="calendar">
					<div class="my-calendar clearfix">
						<div class="clicked-date">
							<div class="cal-day"></div>
							<div class="cal-date"></div>
							<div class="cal-div"></div>
						</div>
						<div class="calendar-box">
						<div class="ctr-box clearfix">
							<button type="button" title="prev" class="btn-cal prev">
							</button>
							<span class="cal-year"></span>
							<span class="cal-month"></span>
							<button type="button" title="next" class="btn-cal next">
							</button>
						</div>
						<table class="cal-table">
							<thead>
							<tr>
								<th><span style="color:#ff4556;">일</span></th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th><span style="color:#4d4df9;">토</span></th>
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
	
	<!-- Socket js -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
	<script type="text/javascript">
	
	// 풀페이지 
	$(function(){
		$('#fullpage').fullpage({
			//options here
			autoScrolling:true,
			scrollHorizontally: false,
		
		navigation: true,
		navigationPosition:'right',
		sectionsColor : ['#fff','#FFEDDB', '#fff', '#E3B7A0'],
		afterLoad: function(anchorLink, index){
			console.log("지금 섹션은" + index);
		}
		});

		$('.headerLogo').on("click", function() {
			$.fn.fullpage.moveTo(1);
		});
	});

	// 카드 넘기기
	t = 53;
	p = 0;
	pm = $('.cards_inner__card').length;

	$('.cards_inner__card').mousedown(function(){
		var ct = $(this).css('transform');
		var cts = ct.split(',')
		ctse = (cts[cts.length - 2] + 'px')
	})

	function on(){
		$('.cards_inner__card').draggable({
			start: function( event, ui ) {
			startPosition = ui.position.left;
			},
			drag:function(e, ui){
			if(ui.position.left > startPosition){
				ui.position.left = startPosition;
			}
			if(ui.position.left < -250){
				ui.position.left = -250;
			}
			x = ui.position.left;
			$(this).css('transform',' rotate(' + x/36 + 'deg)')
			},
			revert:function(valid) {
			if(x > 60 || x < - 60) {
				el = $(this)
				setTimeout(function(){
				el_class = el.attr('class').split(' ');
				el_class_end = el_class[1]
				el.addClass('invalid')
				if(p < 3){
					$('.points').find('.active').removeClass('active').next().addClass('active') 
					p++
				} else {
					$('.points').find('.active').removeClass('active')
					$('.points').find('.first').addClass('active') 
					p=0
				}
				},10)
				setTimeout(function(){
				$('.cards_inner__card').each(function(){
					$(this).addClass('animate');
					var ct = $(this).css('transform');
					var cts = ct.split(',')
					ctse = (parseInt(cts[cts.length - 2]) + 60 + 'px')
					$(this).css('transform','translateZ(' + ctse + ')');
				});
				$('.cards_inner .wrap').prepend('<div class="cards_inner__card ' + el_class_end + ' card_in"><div class="logo"></div></div>')
				el.remove();
				$('.cards_inner__card').removeClass('animate');
				on();
				},160);
				setTimeout(function(){
				$('.card_in').removeClass('card_in')
				},500);
			} else {
				$(this).css('transform','rotate(0deg)')
				return !valid;
			}
			},
			axis:'x',
			containment:'.cards_inner'
		});

		$('.cards_inner__card:nth-of-type(1)').draggable( 'disable' )
		$('.cards_inner__card:nth-of-type(2)').draggable( 'disable' )
		$('.cards_inner__card:nth-of-type(3)').draggable( 'disable' )
		$('.cards_inner__card:nth-of-type(4)').draggable( 'enable' )
	}

	on();

	var swiper = new Swiper(".mySwiper", {
		effect: "cards",
		grabCursor: true,
		direction: "vertical",
		autoplay: true,
		loop: true,
	});

	var divs = document.querySelectorAll(".best_product");
	divs.forEach(function (elm) {
		elm.addEventListener("mouseenter", function () {
			var panel = document.querySelector(".highlight");
			panel.classList.toggle("highlight");
			elm.classList.toggle("highlight");
		});
	});
	
	window.addEventListener("keyup", function (e) {
		var panel = document.querySelector(".turnon_highlight");
		if (
			(e.keyCode == 37 || e.keyCode == 38) &&
			panel != document.querySelectorAll(".best_product")[0]
		) {
			panel.previousElementSibling.classList.toggle("highlight");
			panel.classList.toggle("highlight");
		}
		if (
			(e.keyCode == 39 || e.keyCode == 40) &&
			panel != document.querySelectorAll(".best_product")[3]
		) {
			panel.nextElementSibling.classList.toggle("highlight");
			panel.classList.toggle("highlight");
		}
	});

	
	window.focus();

	// 하얀 달력
	const init = {
		monList: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayList: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		today: new Date(),
		monForChange: new Date().getMonth(),
		activeDate: new Date(),
		getFirstDay: (yy, mm) => new Date(yy, mm, 1),
		getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
		nextMonth: function () {
			let d = new Date();
			d.setDate(1);
			d.setMonth(++this.monForChange);
			this.activeDate = d;
			return d;
		},
		prevMonth: function () {
			let d = new Date();
			d.setDate(1);
			d.setMonth(--this.monForChange);
			this.activeDate = d;
			return d;
		},
		addZero: (num) => (num < 10) ? '0' + num : num,
		activeDTag: null,
		getIndex: function (node) {
			let index = 0;
			while (node = node.previousElementSibling) {
			index++;
			}
			return index;
		}
	};

	const $calBody = document.querySelector('.cal-body');
	const $btnNext = document.querySelector('.btn-cal.next');
	const $btnPrev = document.querySelector('.btn-cal.prev');

	/**
	 * @param {number} date
	 * @param {number} dayIn
	*/
	function loadDate (date, dayIn) {
		document.querySelector('.cal-date').textContent = date;
		document.querySelector('.cal-day').textContent = init.dayList[dayIn];
	}

	/**
	 * @param {date} fullDate
	 */
	function loadYYMM (fullDate) {
		let yy = fullDate.getFullYear();
		let mm = fullDate.getMonth();
		let firstDay = init.getFirstDay(yy, mm);
		let lastDay = init.getLastDay(yy, mm);
	    let markToday;  // for marking today date
		
		if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
			markToday = init.today.getDate();
		}

		document.querySelector('.cal-month').textContent = init.monList[mm];
		document.querySelector('.cal-year').textContent = yy + "년";

		let trtd = '';
		let startCount;
		let countDay = 0;
		for (let i = 0; i < 6; i++) {
			trtd += '<tr>';
			for (let j = 0; j < 7; j++) {
			if (i === 0 && !startCount && j === firstDay.getDay()) {
				startCount = 1;
			}
			if (!startCount) {
				trtd += '<td>'
			} else {
				let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
				trtd += '<td class="day' ;
				trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
				trtd += 'id="day'+ (countDay+1) +'" '
				trtd += 'data-date="${countDay + 1}" data-fdate="${fullDate}">';
			}
			trtd += (startCount) ? ++countDay : '';
			if (countDay === lastDay.getDate()) { 
				startCount = 0; 
			}
			trtd += '</td>';
			}
			trtd += '</tr>';
		}
		$calBody.innerHTML = trtd;
	}

	/**
	 * @param {string} val
	 */
	function createNewList (val) {
		let id = new Date().getTime() + '';
		let yy = init.activeDate.getFullYear();
		let mm = init.activeDate.getMonth() + 1;
		let dd = init.activeDate.getDate();
		const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

		let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

		let eventData = {};
		eventData['date'] = date;
		eventData['memo'] = val;
		eventData['complete'] = false;
		eventData['id'] = id;
		init.event.push(eventData);
		$todoList.appendChild(createLi(id, val, date));
	}

	loadYYMM(init.today);
	loadDate(init.today.getDate(), init.today.getDay());

	$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
	$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

	$calBody.addEventListener('click', (e) => {
		if (e.target.classList.contains('day')) {
			if (init.activeDTag) {
			init.activeDTag.classList.remove('day-active');
			}
			let day = Number(e.target.textContent);
			console.log("클릭 : " + day);
			loadDate(day, e.target.cellIndex);
			e.target.classList.add('day-active');
			init.activeDTag = e.target;
			init.activeDate.setDate(day);
			reloadTodo();
		}
	});

	// 캘린더 날짜에 맞춰서 축제 표시


		let yy = init.activeDate.getFullYear();
		let mm = init.activeDate.getMonth() + 1;
		let dd = init.activeDate.getDate();

		let date = yy + '/' + init.addZero(mm) + '/' + init.addZero(dd);
		
		var festivaldate = {
			date
		}
		console.log(festivaldate);
	
		$.ajax({
			type: "POST",
			url: "${ path }/festivalDay",
			dataType : "json",
			contentType : "application/json",
			data: JSON.stringify(festivaldate),
			success: (data) => {
				console.log(JSON.stringify(data));
				var festival = data;
				
				for (variable in festival) {
					console.log("데이터 키: " + variable + ", 데이터 값: " + JSON.stringify(festival[variable]));
					var festivalArr = festival[variable];
					
					for(const index in festivalArr) {
						console.log(JSON.stringify(festivalArr[index]));
						
						var festivalList = festivalArr[index]; 
						for(List in festivalList)  {  
							console.log("리스트 키 : " + List + ", 리스트 값: " + JSON.stringify(festivalList[List]));
							
							if(List === "calDate") {
								console.log(List);
								console.log(JSON.stringify(festivalList[List]));

								var festivalday  = festivalList[List].replace(/\"/g,"").substr(-2);
								var textDay = document.querySelector('#day' + festivalday);	
									console.log("텍스트 날짜 : " + textDay);
									console.log("축제 날짜 : "+ festivalday);

								if (textDay.textContent === festivalday) {

									textDay.classList.add('day-festival');
									console.log("리스트 : " + festivalList["calTitle"]);

									var html = "<div class='cal-content' id='festival"+ festivalday +"'>"
										html += festivalList['calDate'].substr(5,5) 
										html += " : "
										html += festivalList['calTitle']
										html += "</div>"

									$(".cal-div").prepend(html);
									// $(".cal-content").hide;
									// $("#festival"+ festivalday).show;

									// var text = document.querySelector('.cal-content');	
									// var text = document.querySelector('.festival' + festivalday);	
									// var text = document.getElementById('#festival');

									// var text = document.getElementById('#festival'+festivalday);
									// document.querySelector(".cal-content").append(festivalList["calTitle"]);
									// text.innerHTML = festivalList["calTitle"];

								}
							}
						}
					}	
				}
			},
			error: (error) => {
				console.log(error);
			}
		});


	
	</script>     
</body>
</html>