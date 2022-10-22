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
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	
	<section class="wg_15">
		<div class="wg6_bottom">
            <div class="wg6b_ca">
            	<!-- 
                <c:forEach var="wherego" items="${wherego}">
                <c:set var="rename" value="${ wherego.rimg }" />
                -->
                <div class="wgc6_card">
	                <a href="${ path }/cafedetail">
	                    <div class="card_img">
	                        <img src="${ path }/resources/images/wherego/${wherego.img}">
	                    </div>
	                    <div class="card_text">
	                        <div class="ct_1">${wherego.spotName}</div>
	                        <div class="ct_2">4.8점</div>
	                        <div class="ct_3">
	                            <p>수리남 / 도보 148일 18시간</p>
	                            <p>${wherego.spotSize}</p>
	                        </div>
	                    </div>
	                </a>
                </div>
                <!--  
            </c:forEach>
            -->  
            </div>
            
            <div class="wgc7l_2">
                <div id="pageBar">
                    <button onclick="location.href='${ path }/review_list?page=${ pageInfo.prevPage }'">&lsaquo;</button>
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                        <c:if test="${ status.current == pageInfo.currentPage }">
                            <button disabled class="checked">${ status.current }</button>
                        </c:if>
                        <c:if test="${ status.current != pageInfo.currentPage }">
                            <button onclick="location.href='${ path }/review_list?page=${ status.current }'">${ status.current }</button>
                        </c:if>
                    </c:forEach>

                    <button onclick="location.href='${ path }/review_list?page=${ pageInfo.nextPage }'">&rsaquo;</button>
                </div>
                <div class="top_link">
                    <a href="#wg_top">▲ TOP</a>
                </div>
            </div>
        </div>
	</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>