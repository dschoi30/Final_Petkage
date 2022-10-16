<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
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
                        <th><input type="checkbox" class="check-all-pro" checked="checked"></th>
                        <th colspan="4">상품정보</th>
                        <th>상품금액</th>
                        <th>배송비</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="cart" items="${ list }">

	                	<tr>
	                        <td rowspan="2" class="cart-list" style="width: 3%">
	                        	<input type="hidden" class="cart-subtotal-price" value="${ cart.proSPrice * cart.proCount }"> 
			                	<input type="hidden" class="cart-pro-count" value="${ cart.proCount }"> 
			                	<input type="hidden" class="cart-del-fee" value="${ cart.proDelFee }"> 
			                	<input type="hidden" class="cart-total-price" value="${ cart.proSPrice * cart.proCount + cart.proDelFee }"> 
	                        	<input type="checkbox" class="check-pro" checked="checked">
	                        </td>
	                        <td rowspan="2" style="width: 10%"><img class="img" src="${path}/resources/upload/market/${ cart.renamedFileName }" width="80" height="80"></td>
	                        <td colspan="3" style="width: 60%"><a href="${ path }/market/product-view?proNo=${ cart.proNo }">${ cart.proName }</a></td>
	                        <td rowspan="2" style="width: 14%; text-align: center;"><br><strong><fmt:formatNumber value="${ cart.proSPrice }" pattern="#,###"/>원</strong><br><s><fmt:formatNumber value="${ cart.proOPrice }" pattern="#,###"/>원</s></td>
	                        <td rowspan="2" style="width: 13%; text-align: center;"><br><fmt:formatNumber value="${ cart.proDelFee }" pattern="#,###"/>원</td>
	                    </tr>
	                    <tr>
	                        <td><c:if test="${ cart.proLTime } == '1'"><span>내일</span> </c:if>내일 배송 출발 예정</td>
	                        <td><fmt:formatNumber value="${ cart.proSPrice }" pattern="#,###"/>원</td>
	                        <td>
		                        <span class="col mt-2 p-0">
		                        	<button class="plus-btn" style="border: none; background-color: #f1f3f5; width: 28px;">+</button>
										<input type="text" class="qty-input" style="text-align:center;" size="3" value="${ cart.proCount }">
		                        	<button class="minus-btn" style="border: none; background-color: #f1f3f5; width: 28px;">-</button>
		                        	<a class="btn btn-light change-qty-btn" data-cartNo="${ cart.cartNo }">변경</a>
		                        	<a class="btn btn-light del-qty-btn" data-cartNo="${ cart.cartNo }">삭제</a>
		                       	</span>
	                       	</td>
	                    </tr>

                </c:forEach>
                </tbody>
            </table>
            &nbsp;&nbsp;<input type="checkbox" checked="checked">&nbsp;&nbsp;전체선택 ( 1 / <span class="totalKindCount"></span> )&nbsp;&nbsp;<button class="cart-del-btn">전체삭제</button>
        </div>
        <div class="contents">
            <div class="cart-total-price">
                총 선택상품금액 <span class="cart-price" id="totalSalePrice"></span>원 + 총 배송비 <span class="cart-price" id="totalDelPrice"></span>원 = 총 주문금액 <span class="cart-price" id="totalPrice" style="color: red;"></span>원
            </div>
        </div>
        <div class="contents">
            <button class="cart-pay-btn" onclick="location.href='${ path }/market/order?proNo=${ cart.proNo }'">총 <span class="totalKindCount"></span>건 주문하기</button>
        </div>
    </div>
</div>

<!-- 수량 조정 form -->
<form action="${ path }/market/cart/update" method="POST" class="qty-update-form">
	<input type="hidden" name="cartNo" class="update-cartNo">
	<input type="hidden" name="proCount" class="update-proCount">
	<input type="hidden" name="no" value="${loginMember.no}">
</form>	

<!-- 선택 상품 삭제 form -->
<form action="${ path }/market/cart/delete" method="POST" class="qty-del-form">
	<input type="hidden" name="cartNo" class="del-cartNo">
	<input type="hidden" name="no" value="${ loginMember.no }">
</form>


<script src="${path}/resources/js/market/product.js"></script>

<script>
	$(document).ready(() => {
	   	// 주문 수량 선택
	   	$(".plus-btn").on("click", () => {
		   	var quantity = $(this).parent("span").find("input").val();
		   	console.log(quantity);
	   		$(this).parent("span").find("input").val(++quantity);
	   	});
	   	$(".minus-btn").on("click", () => {
		   	var quantity = $(this).parent("span").find("input").val();
		   	console.log(quantity);
		   	if(quantity > 1){
		   		$(this).parent("span").find("input").val(--quantity);
	   		}
	   	});
	   	
	   	// 선택 상품 수량 변경
	   	$(".change-qty-btn").on("click", () => {
	   		console.log($(this).data("cartno"));
	   		let cartNo = $(this).data("cartno");
	   		let proCount = $(this).parent("span").find("input").val();
	   		$(".update-cartNo").val(cartNo);
	   		$(".update-proCount").val(proCount);
	   		$(".qty-update-form").submit();
	   	});
	   	
	   	// 선택 상품 삭제
	   	$(".del-qty-btn").on("click", () => {
	   		const cartNo = $(this).data("cartno");
	   		$(".del-cartNo").val(cartNo);
	   		$(".qty-del-form").submit();
	   	})
	});
</script>

<script>
	$(document).ready(() => {
		
		// 상품 종합 정보
		setTotalInfo();
		
		// 체크박스 개별 선택에 따라 상태 변경
		$(".check-pro").on("change", function() {
			setTotalInfo($(".cart-list"));
		});
		
		// 체크박스 전체 선택
		$(".check-all-pro").on("click", function() {
			if(".check-all-pro").prop("checked") {
				$(".check-pro").attr("checked", true);
			} else {
				$(".check-pro").attr("checked", false);				
			}
			
			setTotalInfo($(".cart-list"));
		})
		
		function setTotalInfo() {
			
	    	var cartSalePrice = 0;
	    	var cartProCount = 0;
	    	var cartKindCount = 0;
	    	var cartDelFee = 0;
	    	var cartTotalPrice = 0;
	    	
	    	$(".cart-list").each(function(index, element) {
	    		cartSalePrice += parseInt($(element).find(".cart-subtotal-price").val());
	    		cartProCount += parseInt($(element).find(".cart-pro-count").val());
				cartKindCount += 1;
	    		cartDelFee += parseInt($(element).find(".cart-del-fee").val());
	    		cartTotalPrice += parseInt($(element).find(".cart-total-price").val());
	    	});
			// 총 선택상품금액
	    	$("#totalSalePrice").text(cartSalePrice.toLocaleString());
			// 총 상품종류
	    	$(".totalKindCount").text(cartKindCount);
			// 총 배송비
	    	$("#totalDelPrice").text(cartDelFee.toLocaleString());
			// 총 주문금액
	    	$("#totalPrice").text(cartTotalPrice.toLocaleString());	
    		
		}
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />