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
            <div class="row">
                <div class="col">
                <ul class="nav nav-tabs">            
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#product">상품</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#where">어디가지</a>
                </li>
                </ul>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="product">                    
                            <div class="wgc_7">
            <div class="wgc7_list">
             	<c:forEach var="payment" items="${payment}">
             	<c:set var="rename" value="${ payment.totalDelFee }" />
	                <div class="wgc7l_1">
	                    <div class="wgc7l_1_1">
	                        <div class="wgc7l_name">
	                            <p>${payment.totalPrice}</p>
	                            <div class="wgc7l_nickname">
	                                <p>${payment.payNo}</p>
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
                <div id="pageBar">
			 <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <li class="page-item">
			<!-- 맨 처음으로 -->
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=1'">&lt;&lt;</a>
      		</li>
			<!-- 이전 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.prevPage }'>&lt; 
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
					<li class="page-item"><a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ status.current }'>${ status.current }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.nextPage }'>&gt;
      		</a>
      		</li>
			<!-- 맨 끝으로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.maxPage }'">&gt;&gt;</a>
			</li>
            </ul>
            </nav>
		</div>
            </div>
           <!--   <div class="tab-pane fade" id="where">
                <table class="table" id="tb2">
                    <tbody>
                        <tr>
                            <th scope="row">사진</th>
                            <td>2000-01-01</td>
                            <td>여행지</td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-outline-secondary">수정</button>
                                    <button type="button" class="btn btn-outline-secondary">삭제</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">사진</th>
                            <td>2000-01-01</td>
                            <td>여행지</td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-outline-secondary">수정</button>
                                    <button type="button" class="btn btn-outline-secondary">삭제</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">사진</th>
                            <td>2000-01-01</td>
                            <td>여행지</td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-outline-secondary">수정</button>
                                    <button type="button" class="btn btn-outline-secondary">삭제</button>
                                </div>
                            </td>
                        </tr>                        
                    </tbody>
                </table>
            </div> -->



		<div class="tab-pane fade" id="where">
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
                <div id="pageBar">
			 <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <li class="page-item">
			<!-- 맨 처음으로 -->
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=1'">&lt;&lt;</a>
      		</li>
			<!-- 이전 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.prevPage }'>&lt; 
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
					<li class="page-item"><a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ status.current }'>${ status.current }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.nextPage }'>&gt;
      		</a>
      		</li>
			<!-- 맨 끝으로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.maxPage }'">&gt;&gt;</a>
			</li>
            </ul>
            </nav>
		</div>
                </div>
        <!--  <nav aria-label="Page navigation example">
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
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=1'">&lt;&lt;</a>
      		</li>
			<!-- 이전 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.prevPage }'>&lt; 
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
					<li class="page-item"><a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ status.current }'>${ status.current }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.nextPage }'>&gt;
      		</a>
      		</li>
			<!-- 맨 끝으로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/mypage/myPage_wroteReviews?page=${ pageInfo.maxPage }'">&gt;&gt;</a>
			</li>
            </ul>
            </nav>
		</div>
                </div>
    </div>
    </div>
        </div>
    </section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>