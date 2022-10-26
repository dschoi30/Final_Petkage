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
            <div class="row justify-content-center"><h2>주문 완료</h2></div>
            <br>
            <div class="col">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="contents">
                <div class="pay-fin-msg" style="height: 100px;">
                    <strong>주문이 완료</strong>되었습니다. 감사합니다!<br>
                </div>
                <div style="height: 160px; background-color: rgb(250, 250, 250);">
                    <div style="height:20px;"></div>
                    <table style="font-size: 20px; margin: auto;">
                        <tr>
                            <td style="width: 20%;">상품명: </td>
                            <td style="text-align: right">${ info.item_name }</td>
                        </tr>
                        <tr>
                            <td>상품수량: </td>
                            <td>${ info.quantity }개</td>
                        </tr>
                        <tr>
                            <td>결제금액: </td>
                            <td><fmt:formatNumber value="${ info.amount.total }" pattern="#,###"/>원</td>	
                        </tr>
                        <tr>
                            <td>적립금: </td>
                            <td>+<fmt:formatNumber value="${ info.amount.total * 0.05 }" pattern="#,###"/>원</td>
                        </tr>
                    </table>
                </div>
        </div>
        <div class="align-btn-prod-pay-fin">
            <button class="pay-fin-btn">주문 상세보기</button>
            <button class="pay-fin-btn" onclick="location.href='${ path }/market/product-list'">쇼핑 계속하기</button>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="${path}/resources/js/market/product.js"></script>