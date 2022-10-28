<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wherego_main</title>
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_review_board.css?ver=6">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>

<body>

    <section class="wg_2">
        <div class="wg_top" id="wg_top">
            <div class="wg_title">
                <p>리뷰 게시판</p>
            </div>
            <div class="ht_search2">
                <form class="ht_12" action="review_search">
                    <div class="ht_22">
                        <input type="text" name="review_search">
                        <button type="submit">
                            <img src="${ path }/resources/images/wherego/검색.png" alt="search">
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="wgc_7">
            <div class="wgc7_rbar">
                <div class="wgc7r_img">
                    <img src="${ path }/resources/images/wherego/리뷰.png">
                </div>
                <div class="wgc7r_text">
                    <div class="wgc7rt_1">
                        <p>리뷰는 다른 집사들에게 도움이 돼요!</p>
                    </div>
                </div>
                <div class="wgc7r_btn">
                    <button id="insBtn"><p>리뷰작성</p></button>
                </div>
            </div>
        </div>

        <div class="wg_cate">
            <div class="wgc_1">
                <div class="wgc_box">
	                <a href="${ path }/review/review_list">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/숙소.png" alt="숙소">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>숙소</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/review/review_cafe">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/카페.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>카페</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/review/review_food">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/식당.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>맛집</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
                	<a href="${ path }/review/review_hair">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/미용.png" alt="">
	                    </div>
	                    <div class="wgcb_text" style="border-right: none;">
	                        <p>미용</p>
	                    </div>
                    </a>
                </div>
            </div>

            <div class="wgc_2">
				<div class="wgc_box">
	                <a href="${ path }/review/review_trip">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/여행지.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>여행지</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/review/review_hospital">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/병원.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>동물병원</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/review/review_preschool">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/유치원.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>유치원</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/review/review_bath">
	                    <div class="wgcb_img" style="border-right: none;">
	                        <img src="${ path }/resources/images/wherego/목욕.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>셀프목욕</p>
	                    </div>
	                </a>
                </div>
            </div>
        </div>

        <div class="wgc_7">
            <div class="wgc7_list">
             	<c:forEach var="review" items="${review}">
             	<c:set var="rename" value="${ review.revrenameimg }" />
	                <div class="wgc7l_1">
	                    <div class="wgc7l_1_1">
	                        <div class="wgc7l_name">
	                            <p>${review.revtitle} </p>
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
                <div class="wgc7l_2">
                    <div id="pageBar">
                        <button onclick="location.href='${ path }/review/review_list?page=${ pageInfo.prevPage }'">&lsaquo;</button>
                      	<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
							<c:if test="${ status.current == pageInfo.currentPage }">
								<button disabled class="checked">${ status.current }</button>
							</c:if>
							<c:if test="${ status.current != pageInfo.currentPage }">
								<button onclick="location.href='${ path }/review/review_list?page=${ status.current }'">${ status.current }</button>
							</c:if>
						</c:forEach>

                        <button onclick="location.href='${ path }/review/review_list?page=${ pageInfo.nextPage }'">&rsaquo;</button>
                    </div>
                    <div class="top_link">
                        <a href="#wg_top">▲ TOP</a>
                    </div>
                </div>
            </div>
        </div>    

    </section>
    <script type="text/javascript">

	 $(document).ready(() => {
		 $("#insBtn").on("click", () => {
			 if(${empty loginMember}) {
				 alert("로그인이 필요합니다 :)");
				 location.href="${path}/member/loginPage"
			 } else {
				 location.href="${path}/review/review_write"
			 }
		 });
	 });
    	
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>