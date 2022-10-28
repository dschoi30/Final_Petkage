<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!-- css 스타일 -->
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_orderList.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	<section class="mp-pur">
      <div class="container">
      <p class="mypagept" style="width: 1110px; height: 50px; font-size: 32px; font-weight: 700; font-family: 'GmarketSansMedium'; line-height: 100%; text-align: center; color: #803D3D;">주문내역조회</p>
           
      <table class="table">
        <thead>
          <tr>
            <th scope="col" class="align-middle">주문번호</th>
            <th scope="col" class="align-middle">주문일자</th>
            <th scope="col" class="align-middle"></th>
            <th scope="col" class="align-middle">상품정보</th>
            <th scope="col" class="align-middle">수량</th>
            <th scope="col" class="align-middle">상품구매금액</th>
            <th scope="col" class="align-middle">배송비</th>
          </tr>
        </thead>
        <c:forEach var="payment" items="${ payment }">
        <tbody>
          <tr>
            <td class="align-middle">${ payment.payNo }</td>
            <td class="align-middle">${ payment.payCreatedAt }</td>
            <td class="align-middle">
			      <img class="img" src="${path}/resources/upload/market/${ payment.renamedFileName }" width="70" height="70">			      
		      </td>
		      <td class="align-middle">${ payment.proName }</td>
            <td class="align-middle">${ payment.proCount }</td>
            <td class="align-middle"><fmt:formatNumber value="${ payment.proSPrice }" pattern="#,###"/>원</td>
            <td class="align-middle"><fmt:formatNumber value="${ payment.proDelFee }" pattern="#,###"/>원</td>
          </tr>
        </tbody>
        </c:forEach>
      </table>
      <br><br>
      <div class="wgc7l_2">
      <div id="pageBar">
                    <button onclick="location.href='${ path }/mypage/myPage_orderList?page=${ pageInfo.prevPage }'">&lsaquo;</button>
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                        <c:if test="${ status.current == pageInfo.currentPage }">
                            <button disabled class="checked">${ status.current }</button>
                        </c:if>
                        <c:if test="${ status.current != pageInfo.currentPage }">
                            <button onclick="location.href='${ path }/mypage/myPage_orderList?page=${ status.current }'">${ status.current }</button>
                        </c:if>
                    </c:forEach>

                    <button onclick="location.href='${ path }/mypage/myPage_orderList?page=${ pageInfo.nextPage }'">&rsaquo;</button>
                </div>
      </div>
      </div>
    </section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>