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
      
      <p class="v91_238" style=" font-size: 16px; font-family: 'GmarketSansMedium';">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색 시 지난 주문내역을 조회하실 수 있습니다. </p>
      
      <table class="table">
        <thead>
          <tr>
            <th scope="col">주문번호</th>
            <th scope="col">주문일자</th>
            <th scope="col">상품정보</th>
            <th scope="col">수량</th>
            <th scope="col">상품구매금액</th>
            <th scope="col">배송비</th>
            <th scope="col">주문처리상태</th>
          </tr>
        </thead>
        <c:forEach var="payment" items="${ payment }">
        <tbody>
          <tr>
            <td>${ payment.payNo }</td>
            <td>${ payment.payCreatedAt }</td>
            <td class="w-25">
			      <img class="img" src="${path}/resources/upload/market/${ payment.renamedFileName }" width="70" height="70">
			      ${ payment.proName }
		      </td>
            <td>${ payment.proCount }</td>
            <td>${ payment.totalPriceAfterUsingPoint }</td>
            <td>${ payment.totalDelFee }</td>
            <td>${ payment.orderStatus }</td>
          </tr>
        </tbody>
        </c:forEach>
      </table>
      <br><br>
     <!--   <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav> -->
      <div id="pageBar">
			 <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <li class="page-item">
			<!-- 맨 처음으로 -->
			<a class="page-link" href='${ path }/mypage/myPage_orderList?page=1'">&lt;&lt;</a>
      		</li>
			<!-- 이전 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_orderList?page=${ pageInfo.prevPage }'>&lt; 
      		</a>
      		</li>
			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<li class="page-item active">
					<a href='${ status.current }'></a>
					</li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<li class="page-item"><a class="page-link" href='${ path }/mypage/myPage_orderList?page=${ status.current }'>${ status.current }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_orderList?page=${ pageInfo.nextPage }'>&gt;
      		</a>
      		</li>
			<!-- 맨 끝으로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_orderList?page=${ pageInfo.maxPage }'">&gt;&gt;</a>
			</li>
            </ul>
            </nav>
		</div>
      </div>
    </section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>