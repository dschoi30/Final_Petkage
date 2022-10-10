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
            <div class="contents" style="margin-bottom: 0;">
                <br><br>
                <div class="row justify-content-center"><h2>주문/결제</h2></div>
            </div>
        </div>
        <div class="row">
            <div class="contents">
                <div class="pay-delivery-info">
                    <h4>배송지 정보</h4><br>
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="width: 12%">이름</td>
                                <td>최동식</td>
                            </tr>
                            <tr>
                                <td>배송 주소</td>
                                <td>
                                    <input type="text" id="sample6_postcode" placeholder="우편번호">
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                    &nbsp; <input type="checkbox" checked> 기본배송지 설정 &nbsp;<br>
                                    <input type="text" id="sample6_address" placeholder="주소" size="50" value="서울 강남구 테헤란로14길 6"><br>
                                    <input type="text" id="sample6_detailAddress" placeholder="상세주소" size="50" value="KH정보교육원 2층">
                                </td>
                            <tr>
                                <td>연락처</td>
                                <td>010-1234-5678</td>
                            </tr>
                            <tr>
                                <td>배송 요청사항</td>
                                <td>직접 받고 부재 시 문 앞</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="pay-prod-info">
                    <br><h4>주문 정보</h4><br>
                    <table class="table">
                        <thead>
                            <tr>
                                <th colspan="4">상품정보</th>
                                <th>상품금액</th>
                                <th>배송비</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="2" style="width: 10%"><img class="img" src="/CHOI/IMG/dogfood.jpg" width="80" height="80"></td>
                                <td colspan="3" style="width: 60%">[탐사] 탐사 6free 강아지 사료 연어 레시피, 3kg</td>
                                <td rowspan="2" style="width: 14%; text-align: center;"><br><strong>14,490원</strong><br><s>18,000원</s></td>
                                <td rowspan="2" style="width: 13%; text-align: center;"><br>3,000원</td>
                            </tr>
                            <tr>
                                <td>내일 9/24 배송 출발 예정</td>
                                <td>14,490원</td>
                                <td>1개</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="pay-method-info">
                    <br><h4>결제 정보</h4><br>
                    <form method="post" action="${ path }/market/product-payment">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="width: 12%">총 상품금액</td>
                                <td>14,490원</td>
                            </tr>
                            <tr>
                                <td>포인트 사용</td>
                                <td><span class="discount-point"><input type="text" placeholder="0" size="10" dir="rtl">&nbsp; 원</span> &nbsp; <input type="checkbox"> 전액 사용 ( 보유 포인트 : 1,000원 )&nbsp;</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>3,000원</td>
                            </tr>
                            <tr>
                                <td>총 결제금액</td>
                                <td>17,490원</td>
                            </tr>
                            <tr>
                                <td>결제 방법</td>
                                <td>
<!--                                     <label><input type="radio" name="kakaopay" id="check_module">카카오페이</label>&nbsp; -->
		    						<button id="kakaopay">카카오페이</button>
                                    <label><input type="radio" name="account">계좌이체</label>&nbsp;
                                    <label><input type="radio" name="card">신용/체크카드</label>&nbsp;
                                    <label><input type="radio" name="corp-card">법인카드</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
            <div class="contents">
                <button class="cart-pay-btn" onclick="location.href='${ path }/market/product-payment-fin'">결제하기</button>
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
    
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <script>
	$("#kakaopay").click(function () {
		var IMP = window.IMP;
		// '' 안에 띄어쓰기 없이 가맹점 식별코드 삽입
		IMP.init('imp71578272');
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid의 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '주문명 : 아메리카노',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸 수도 있습니다.
			amount: 2000,
			// amount: ${bid.b_bid},
			buyer_name: '이름',
			// 구매자 이름, 구매자 정보도 model 값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 링크를 참고해주세요.
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야 한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>
</body>
</html>