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
<title>MyPage</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!-- css 스타일 -->
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_heart.css?ver=1">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
</head>
<body>

<section class="heart_15">
	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
      <p class="mypagept" style="width: 1110px; height: 50px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">찜 목록</p>
		<div class="wg6_bottom" style="float: left;">
            <div class="wg6b_ca">

				<c:forEach var="heart" items="${ heart }">
                <c:set var="rename_wherego" value="${ cafeselect.renameImg }" />
                <div class="wgc6_card">
	                    <div class="card_img">
	                        <img src="${ path }/resources/images/wherego/${heart.renameImg}">
	                    </div>
	                    <div class="card_text">
	                        <div class="ct_1">${heart.spotName}</div>
	                        <div class="ct_2">4.8점</div>
	                        <div class="ct_3">
	                            <p>수리남 / 도보 148일 18시간</p>
	                            <p>${heart.spotSize}</p>
	                        </div>
	                    </div>
                </div>
       			 </c:forEach>
        		</div>
            
            <div class="wgc7l_2">
                <div id="pageBar">
                    <button onclick="location.href='${ path }/mypage/myPage_heart?page=${ pageInfo.prevPage }'">&lsaquo;</button>
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                        <c:if test="${ status.current == pageInfo.currentPage }">
                            <button disabled class="checked">${ status.current }</button>
                        </c:if>
                        <c:if test="${ status.current != pageInfo.currentPage }">
                            <button onclick="location.href='${ path }/mypage/myPage_heart?page=${ status.current }'">${ status.current }</button>
                        </c:if>
                    </c:forEach>

                    <button onclick="location.href='${ path }/mypage/myPage_heart?page=${ pageInfo.nextPage }'">&rsaquo;</button>
                </div>
            </div>
		</div>
	</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>