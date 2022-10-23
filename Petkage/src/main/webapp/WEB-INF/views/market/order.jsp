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
                                <input type="text" class="zonecode" id="postcode" placeholder="우편번호" size="10" data-zonecode="${ loginMember.zonecode }" style="margin-bottom: 5px;" value="${ loginMember.zonecode }">
                                <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">&nbsp; 
                                <input type="checkbox" class="use-existing-address" checked="checked"> 기본배송지 설정 &nbsp;<br>
                                <input type="text" class="address" id="address" placeholder="주소" size="50" data-address="${ loginMember.userAddress }" style="margin-bottom: 5px;" value="${ loginMember.userAddress }"><br>
                                <input type="text" class="subaddress" id="detailAddress" placeholder="상세주소" size="50" data-subaddress="${ loginMember.addressSub }" value="${ loginMember.addressSub }">
								
                            </td>
                        <tr>
                            <td>연락처</td>
                            <td>${ loginMember.userPhone }</td>
                        </tr>
                        <tr>
                            <td>배송 요청사항</td>
                            <td><input type="text" class="order-comment" size="50"></td>
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
		                        <td rowspan="2" class="order-list" style="width: 0%">
		                        	<input type="hidden" class="order-subtotal-price" value="${ order.proSPrice * order.proCount }"> 
				                	<input type="hidden" class="order-pro-count" value="${ order.proCount }"> 
				                	<input type="hidden" class="order-del-fee" value="${ order.proDelFee }"> 
				                	<input type="hidden" class="order-total-price" value="${ order.proSPrice * order.proCount + order.proDelFee }">
				                	<input type="hidden" class="order-pro-no" value="${ order.proNo }">
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
                            <td><span class="set-total-price"></span>원</td>
                        </tr>
                        <tr>
                            <td>포인트 사용</td>
                            <td><span class="discount-point"><input type="text" class="using-point" size="6" dir="rtl" value="0"/>&nbsp; 원</span> &nbsp; 
<!--                             <td><span class="discount-point"><input type="text" class="using-point" placeholder="0" size="6" dir="rtl" onkeyup="inputNumberFormat(this);"/>&nbsp; 원</span> &nbsp;   -->
                            	<input type="checkbox" class="use-all-point" id="usingPoint" data-point="${ loginMember.point }" 
                            	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 전액 사용 ( 보유 포인트 : <fmt:formatNumber value="${ loginMember.point }" pattern="#,###"/>원 )&nbsp;
                            	</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td><span class="total-del-fee"></span>원</td>
                        </tr>
                        <tr>
                            <td>총 결제금액</td>
                            <td>
                            	<span class="total-price-after-using-point"></span>원
                            	<span style="padding-left: 86px;">결제 시 적립(5%) 포인트</span>
                            	<span class="total-saving-point" style="padding-left: 10px;"></span>원
                            </td>
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
            <button class="pay-btn" id="kakaopay" value="kakaopay">결제하기</button>
        </div>
    </div>
</div>

<form action="${ path }/market/order" method="POST" class="order-request-form">
	
	<input type="hidden" name="no" value=${ loginMember.no }>	
	<input type="hidden" name="zonecode">
	<input type="hidden" name="address">
	<input type="hidden" name="subaddress">
	<input type="hidden" name="totalDelFee">
	<input type="hidden" name="totalPrice">
	<input type="hidden" name="usingPoint">
	<input type="hidden" name="totalSavingPoint">
	<input type="hidden" name="totalPriceAfterUsingPoint">
	<input type="hidden" name="orderComment">
</form>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="${path}/resources/js/market/product.js"></script>

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

	$(document).ready(function() {
		
		setTotalInfo();
	});

	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("postcode").value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}

	$("#kakaopay").click(function () {
		var IMP = window.IMP;
		// '' 안에 띄어쓰기 없이 가맹점 식별코드 삽입
		IMP.init('imp71578272');
		IMP.request_pay({
			pg: 'kakao',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid의 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '탐사',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸 수도 있습니다.
			amount: 2000,
			// amount: ${bid.b_bid},
			buyer_name: '${ loginMember.userName }',
			// 구매자 이름, 구매자 정보도 model 값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 링크를 참고해주세요.
			buyer_postcode: '${ loginMember.zonecode }',
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

	$(".use-existing-address").on("change", function() {
		const zonecode = $(this).parent("td").find("input").data("zonecode");
		const address = $(this).parent("td").find("input").data("address");
		const subaddress = $(this).parent("td").find("input").data("subaddress");
		if($(".use-existing-address").prop("checked")) {
			$(".zonecode").val(zonecode);
			$(".address").val(address);
			$(".subaddress").val(subaddress);
		} else {
			$(".zondcode").val(0);
			$(".address").val();
			$(".subaddress").val();
		}
	});
	
	$(".use-all-point").on("change", function() {
		if($(".use-all-point").prop("checked")) {
			const maxPoint = $(this).data("point");
			$(".using-point").val(maxPoint);			
		} else {
			$(".using-point").val(0);
		}
	});
/*	
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
*/	
	// 0 이상 최대 포인트 이하
	$(".using-point").on("propertychange change keyup paste input", function() {
		const maxPoint = parseInt('${ loginMember.point }');
		console.log(maxPoint);
		let inputValue = parseInt($(this).val());
		$(this).val(inputValue);
		console.log(inputValue);
		if(inputValue < 0) {
			$(this).val(0);
		} else if(inputValue > maxPoint) {
			$(this).val(maxPoint);
		}
	});
		
	let totalPrice = 0;
	let totalDelFee = 0;
	let totalSavingPoint = 0;
	let usingPoint = 0;
	let totalPriceAfterUsingPoint = 0;
	
	function setTotalInfo() {
		
		$(".order-list").each(function(index, element) {
			totalPrice += parseInt($(element).find(".order-subtotal-price").val());
			totalDelFee += parseInt($(element).find(".order-del-fee").val());
		});
		
		totalSavingPoint = Math.ceil((totalPrice * 0.05) / 10) * 10;
		usingPoint = $(".using-point").val();
		totalPriceAfterUsingPoint = totalPrice + totalDelFee - usingPoint;
		
	 	$(".set-total-price").text(totalPrice.toLocaleString());
	 	$(".total-del-fee").text(totalDelFee.toLocaleString());
	 	$(".total-saving-point").text(totalSavingPoint.toLocaleString());
	 	$(".total-price-after-using-point").text(totalPriceAfterUsingPoint.toLocaleString());
	};

	$(".pay-btn").on("click", function() {
		$("input[name='zonecode']").val($(".zonecode").val());
		$("input[name='address']").val($(".address").val());
		$("input[name='subaddress']").val($(".subaddress").val());
		$("input[name='totalDelFee']").val(totalDelFee);
		$("input[name='totalPrice']").val(totalPrice);
		$("input[name='usingPoint']").val($(".using-point").val());
		$("input[name='totalSavingPoint']").val(totalSavingPoint);
		$("input[name='totalPriceAfterUsingPoint']").val(totalPriceAfterUsingPoint);
		$("input[name='orderComment']").val($(".order-comment").val());
		let orderForm = '';
		$(".order-list").each(function(index, element) {
			let proNo = $(element).find(".order-pro-no").val();
			let proCount = $(element).find(".order-pro-count").val();
			console.log(proNo);
			console.log(proCount);
			let proNoInput = "<input type='hidden' name='orders[" + index + "].proNo' value='" + proNo + "'>";
			orderForm += proNoInput;
			let proCountInput = "<input type='hidden' name='orders[" + index + "].proCount' value='" + proCount + "'>";
			orderForm += proCountInput;
		});
		$(".order-request-form").append(orderForm);
		
		$(".order-request-form").submit();
	});

</script>
