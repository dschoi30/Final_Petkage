<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">    

    <!-- Product CSS-->
    <link rel="stylesheet" href="${ path }/resources/css/market/product.css">

    <!-- Common CSS -->
    <link rel="stylesheet" href="/EUM/CSS/common/header.css"></link>
    <link rel="stylesheet" href="/EUM/CSS/common/footer.css"></link>

    <!-- jQuery js -->  
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>   
	
	<style type="text/css">
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	</style>
	
    <title>Header</title>
</head>
<body>
    <section class="hd">
        <div class="header_container">
            <header class="d-flex flex-wrap mb-4">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                    <img src="/EUM/resources/images/Petkage_Logo2.png" alt="" class="headerLogo">
                </a>
                <ul class="nav nav-pills">
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">어디가지</a></li>
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">커뮤니티</a></li>
                    <li class="nav-item header_item"><a href="/CHOI/HTML/product_list.html" class="nav-link header_link">마켓</a></li>
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">OTHERS</a></li>
                    <input type="button" class="headerBtn" id="loginBtn" value="로그인">
                    <a href="/" class="d-flex align-items-center headercart">
                        <img src="/EUM/resources/images/Cart.png" alt="" class="cart">
                    </a>
                </ul>
            </header>
        </div>
    </section>
    <div id="wrap-all-prod">
        <div class="row">
            <div class="contents" style="margin-bottom: 50px;">
                <br><br>
                <div class="row justify-content-center"><h2>주문 완료</h2></div>
                <br>
                <div class="col">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="contents">
                <div class="pay-fin-msg">
                    <strong>주문이 완료</strong>되었습니다. 감사합니다!<br>
                </div>
                <div>
   	                결제일시:    ${info.approved_at}<br>
					주문번호:    ${info.partner_order_id}<br>
					상품명:      ${info.item_name}<br>
					상품수량:    ${info.quantity}<br>
					결제금액:    ${info.amount.total}<br>
					결제방법:    ${info.payment_method_type}<br>
				</div>
            </div>
            <div class="align-btn-prod-pay-fin">
                <button class="pay-fin-btn">주문 상세보기</button>
                <button class="pay-fin-btn" onclick="location.href='${ path }/market/product-list'">쇼핑 계속하기</button>
            </div>
        </div>
    </div>
    <section class="ft">
        <!-- <div id='wrapper'>
            <div>
                CONTENT 
            </div>
        </div> -->

        <div class="footer_container">
            <footer class="footer_section1">
                <!-- <div class="footer"> -->
                    <p class="footerName">Petkage</p>

                    <ul class="nav footer_nav">
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">이용약관</a></li>
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">개인정보 취급방침</a></li>
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">공지사항</a></li>
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">FAQ</a></li>
                    </ul>

                    <div class="footer_contents">
                        <p class="footer_content">회사명 : (주)펫키지 대표 : 문인수 / 전화 : 070-1234-5678 / 주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩</p>
                        <p class="footer_content">사업자 등록번호 안내 : 123-45-6789 / 통신판매업 신고 2022-서울강남-03472 <a href="">[사업자정보 확인]</a>  </p>
                        <p class="footer_content">&copy;펫키지. All Rights Reserved</p>
                    </div>

                    <div class="footer_icons">
                        <a href="/" class="">
                            <img src="/EUM/resources/images/Instagram.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="/EUM/resources/images/Facebook.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="/EUM/resources/images/youtube.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="/EUM/resources/images/kakaotalk.png" alt="" class="footericon">
                        </a>
                    </div>

                    <img src="/EUM/resources/images/Pet2.png" alt="" class="footerLogo">
                <!-- </div> -->
            </footer>
        </div>
    </section>

    <script src="${path}/resources/js/market/product.js"></script>
    


</body>
</html>