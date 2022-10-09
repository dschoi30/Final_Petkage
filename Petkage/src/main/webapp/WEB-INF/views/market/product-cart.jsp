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
                <div class="row justify-content-center"><h2>장바구니</h2></div>
            </div>
        </div>
        <div class="row">
            <div class="contents">
                <table class="table">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th colspan="4">상품정보</th>
                            <th>상품금액</th>
                            <th>배송비</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="2" style="width: 3%"><input type="checkbox"></td>
                            <td rowspan="2" style="width: 10%"><img class="img" src="${path}/resources/upload/market/${ product.renamedFileName }" width="80" height="80"></td>
                            <td colspan="3" style="width: 60%">${ product.proName }</td>
                            <td rowspan="2" style="width: 14%; text-align: center;"><br><strong><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/>원</strong><br><s><fmt:formatNumber value="${ product.proOPrice }" pattern="#,###"/>원</s></td>
                            <td rowspan="2" style="width: 13%; text-align: center;"><br><fmt:formatNumber value="${ product.proDelFee }" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                            <td>내일 9/24 배송 출발 예정</td>
                            <td><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/>원</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
                &nbsp;&nbsp;<input type="checkbox">&nbsp;&nbsp;전체선택 ( 1 / 1 )&nbsp;&nbsp;<button class="cart-del-btn">전체삭제</button>
            </div>
            <div class="contents">
                <div class="cart-total-price">
                    총 선택상품금액 <span class="cart-price"><fmt:formatNumber value="${ product.proSPrice * 1 }" pattern="#,###"/></span>원 + 총 배송비 <span class="cart-price"><fmt:formatNumber value="${ product.proDelFee }" pattern="#,###"/></span>원 = 총 주문금액 <span class="cart-price" style="color: red;"><fmt:formatNumber value="${ product.proSPrice * 1 + product.proDelFee }" pattern="#,###"/></span>원
                </div>
            </div>
            <div class="contents">
                    <button class="cart-pay-btn" onclick="location.href='${ path }/market/product-payment?proNo=${ product.proNo }'">총 1건 주문하기</button>
                </a>
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