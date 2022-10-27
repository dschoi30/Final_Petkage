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
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_wroteReviews.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	<p class="mypagept" style="width: 1500px; height: 50px; font-size: 32px; font-weight: 700; font-family: 'GmarketSansMedium'; line-height: 100%; text-align: center; color: #803D3D;">작성한 리뷰</p>
    <section class="mp-wr">
        <div class="container">
           
           <div class="wgc_7">
            <div class="wgc7_list">
             	<c:forEach var="review" items="${review}">
             	<c:set var="rename" value="${ review.revrenameimg }" />
	                <div class="wgc7l_1">
	                    <div class="wgc7l_1_1">
	                        <div class="wgc7l_name">
	                            <p>${review.revtitle}</p>
	                            <div class="wgc7l_nickname">
	                                <p>${review.memname}</p>
	                            </div>
	                        </div>
	                        <div class="wgc7l_img">
	                            <img src="${ path }/resources/uploadFiles/${ fn:substring(rename,0,22) }" alt="">
	                        </div>
	                    </div>
	                    <div class="wgc7l_1_2">
	                        <div class="wgc7l_star">
	                            <c:choose>
	                            	<c:when test ="${review.revscore == 1}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 2}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 3}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 4}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 5}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
									</c:when>
	                            </c:choose>
	                        </div>
	                        <div class="wgc7l_review">
	                            <div class="wgc7l_revcoment">${review.revcoment}</div>
	                            <div class="wgc7l_write_time">
	                                <p><fmt:formatDate value="${review.revdate}" pattern="MM월 dd일"/></p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
                </c:forEach>
                </div>
                </div>
                

		<div class="wgc7l_2">
		      <div id="pageBar">
                    <button onclick="location.href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.prevPage }'">&lsaquo;</button>
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                        <c:if test="${ status.current == pageInfo.currentPage }">
                            <button disabled class="checked">${ status.current }</button>
                        </c:if>
                        <c:if test="${ status.current != pageInfo.currentPage }">
                            <button onclick="location.href='${ path }/mypage/myPage_wroteReviews?page=${ status.current }'">${ status.current }</button>
                        </c:if>
                    </c:forEach>

                    <button onclick="location.href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.nextPage }'">&rsaquo;</button>
                </div>
      </div>
      </div>
    </section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>