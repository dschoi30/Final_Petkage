<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

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
                            <td style="width: 13%">이름</td>
                            <td>${ loginMember.userName }</td>
                        </tr>
                        <tr>
                            <td>배송 주소</td>
                            <td>
                                <input type="text" id="sample6_postcode" placeholder="우편번호" value="${ loginMember.zonecode }">
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                &nbsp; <input type="checkbox" checked> 기본배송지 설정 &nbsp;<br>
                                <input type="text" id="sample6_address" placeholder="주소" size="50" value="${ loginMember.userAddress }"><br>
                                 <input type="text" id="sample6_detailAddress" placeholder="상세주소" size="50" value="${ loginMember.addressSub }">
                            </td>
                        <tr>
                            <td>연락처</td>
                            <td>${ loginMember.userPhone }</td>
                        </tr>
                        <tr>
                            <td>배송 요청사항</td>
                            <td><input type="text" id="delibery-comment" size="50"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="pay-prod-info">
                <br><h4>주문 정보</h4><br>
                <table class="table">
                    <thead>
                        <tr>
                            <th colspan="5">상품정보</th>
                            <th>상품금액</th>
                            <th>배송비</th>
                        </tr>
                    </thead>
                    <tbody>
		                <c:forEach var="order" items="${ orderList }">
		                	<tr>
		                        <td rowspan="2" class="cart-list" style="width: 0%">
		                        	<input type="hidden" class="cart-subtotal-price" value="${ order.proSPrice * order.proCount }"> 
				                	<input type="hidden" class="cart-pro-count" value="${ order.proCount }"> 
				                	<input type="hidden" class="cart-del-fee" value="${ order.proDelFee }"> 
				                	<input type="hidden" class="cart-total-price" value="${ order.proSPrice * order.proCount + order.proDelFee }">
				                	<input type="hidden" class="cart-pro-no" value="${ order.proNo }">
		                        </td>
		                        <td rowspan="2" style="width: 10%"><a href="${ path }/market/product-view?proNo=${ order.proNo }"><img class="img" src="${path}/resources/upload/market/${ order.renamedFileName }" width="80" height="80"></a></td>
		                        <td colspan="3" style="width: 56%"><a href="${ path }/market/product-view?proNo=${ order.proNo }">${ order.proName }</a></td>
		                        <td rowspan="2" style="width: 16%; text-align: center;"><br><strong><fmt:formatNumber value="${ order.proSPrice * order.proCount }" pattern="#,###"/>원</strong></td> 
		                        <td rowspan="2" style="width: 18%; text-align: center;"><br><fmt:formatNumber value="${ order.proDelFee }" pattern="#,###"/>원</td>
		                    </tr>
		                    <tr>
		                        <td>내일 배송 출발 예정</td>
		                        <td><fmt:formatNumber value="${ order.proSPrice }" pattern="#,###"/>원</td>
		                        <td>${ order.proCount }개</td> 
		                    </tr>
		                </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pay-method-info">
                <br><h4>결제 정보</h4><br>
                <form method="post" action="${ path }/market/order">
                <table class="table">
                    <tbody>
                        <tr>
                            <td style="width: 13%">총 상품금액</td>
                            <td>14,490원</td>
                        </tr>
                        <tr>
                            <td>포인트 사용</td>
                            <td><span class="discount-point"><input type="text" class="using-point" placeholder="0" size="6" dir="rtl" onkeyup="inputNumberFormat(this);"/>&nbsp; 원</span> &nbsp; 
                            	<input type="checkbox" class="use-all-point" id="usingPoint" data-point="${ loginMember.point }"> 전액 사용 ( 보유 포인트 : <fmt:formatNumber value="${ loginMember.point }" pattern="#,###"/>원 )&nbsp;</td>
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
  						<button style="border: 0; margin-right: 10px;">
							<img src="${ path }/resources/images/market/pay_on_kakao.png" style="width: 80px; height: 30px;" alt="">
						</button>
  						<button id="card" value="card" style="border: 0;">
							<img src="${ path }/resources/images/market/pay_on_card.png" style="width: 80px; height: 30px;" alt="">
						</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
        <div class="contents">
            <button class="cart-pay-btn" id="kakaopay" value="kakaopay">결제하기</button>
        </div>
    </div>
</div>

<form action="${ path }/market/order-finished" method="POST" class="order-finished-form">
	<input type="hidden" name="point" class="using-point">
</form>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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

	$(".use-all-point").on("change", function() {
		if($(".use-all-point").prop("checked")) {
			const maxPoint = $(this).data("point");
			$(".using-point").val(maxPoint);			
		} else {
			$(".using-point").val(0);
		}
	});
	
	// 숫자 외 문자값 입력 방지, 천 단위 구분
	 function inputNumberFormat(obj) {
	     obj.value = comma(uncomma(obj.value));
	 }
	 
	 function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }

	 function uncomma(str) {
	     str = String(str);
	     return str.replace(/[^\d]+/g, '');
	 }

	 // 0 이상 최대 포인트 이하
	 $(".using-point").on("propertychange change keyup paste input", function() {
		 const maxPoint = parseInt('${ loginMember.point }');
		 console.log(maxPoint);
		 let inputValue = parseInt($(this).val());
		 console.log(inputValue);
		 if(inputValue < 0) {
			 $(this).val(0);
		 } else if(inputValue > maxPoint) {
			 $(this).val(maxPoint);
		 }
	 });
</script>
