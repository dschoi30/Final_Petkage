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
            <th scope="col">주문처리상태</th>
            <th scope="col">취소/교환/반품</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>2000-01-01</td>
            <td>탈취제</td>
            <td>3</td>
            <td>32000</td>
            <td>배송중</td>
            <td>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-outline-secondary">취소</button>
                <button type="button" class="btn btn-outline-secondary">교환</button>
                <button type="button" class="btn btn-outline-secondary">반품</button>
              </div>
            </td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>2000-01-01</td>
            <td>방석</td>
            <td>1</td>
            <td>35000</td>
            <td>배송왼료</td>
            <td>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-outline-secondary">취소</button>
                <button type="button" class="btn btn-outline-secondary">교환</button>
                <button type="button" class="btn btn-outline-secondary">반품</button>
              </div>
            </td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>2000-01-01</td>
            <td>귀세정제</td>
            <td>2</td>
            <td>20000</td>
            <td>배송중</td>
            <td>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-outline-secondary">취소</button>
                <button type="button" class="btn btn-outline-secondary">교환</button>
                <button type="button" class="btn btn-outline-secondary">반품</button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
      <br><br>
      <nav aria-label="Page navigation example">
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
      </nav>
    </section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>