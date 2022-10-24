<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>

    <!-- Bootstrap CSS -->   
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

    <!-- modal-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">

    <title>Document</title>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body ondragstart="return false" onselectstart="return false">
    <div id="wrap-all-prod">
        <div class="row">
            <div class="contents" style="margin-bottom: 50px;">
                <br><br>
                <div class="row justify-content-center"><h2>상품 상세</h2></div>
                <br>
                <div id="prodImageItems">
                    <div id="carouselIndicators" class="carousel slide" data-touch="false" data-interval="false">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselIndicators" data-slide-to="3"></li>
                            <li data-target="#carouselIndicators" data-slide-to="4"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-images">
                                <div class="carousel-item active">
                                <img src="${path}/resources/upload/market/${ product.renamedFileName }" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                <img src="${path}/resources/images/market/dogfood2.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                <img src="${path}/resources/images/market/dogfood3.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                <img src="${path}/resources/images/market/dogfood4.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                <img src="${path}/resources/images/market/dogfood5.jpg" class="d-block w-100" alt="...">
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-target="#carouselIndicators" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-target="#carouselIndicators" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                        </button>
                    </div>
                    <div class="prod-images-bar">
                        <ul class="prod-images">
                            <li>
                                <a href="#" class="_1F-riHNwNb" role="button" aria-selected="false">
                                    <img src="${path}/resources/upload/market/${ product.renamedFileName }" width="80" height="80" alt="대표이미지">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="_1F-riHNwNb" role="button" aria-selected="false">
                                    <img src="${path}/resources/images/market/dogfood2.jpg" width="80" height="80" alt="추가이미지0">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="_1F-riHNwNb" role="button" aria-selected="false">
                                    <img src="${path}/resources/images/market/dogfood3.jpg" width="80" height="80" alt="추가이미지1">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="_1F-riHNwNb" role="button" aria-selected="false">
                                    <img src="${path}/resources/images/market/dogfood4.jpg" width="80" height="80" alt="추가이미지2">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="_1F-riHNwNb" role="button" aria-selected="false">
                                    <img src="${path}/resources/images/market/dogfood5.jpg" width="80" height="80" alt="추가이미지3">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="prodSummary">
                    <div class="prod-brand">${ product.proBrand }
                    </div>
                    <div class="prod-title">
                        <h3>${ product.proName }</h3>
                    </div>
                    <div class="wrap-rating">
                        <span class="rating" >
                            <c:forEach var="i" begin="1" end="${ product.proRating }">
                            	<img src="${ path }/resources/images/market/star_filled.png" width="20" height="20" alt="star" style="transform: translateY(-2px);">                                      
                            </c:forEach>											
							<c:forEach var="j" begin="1" end="${ 5 - product.proRating + 0.9}">	
                               	<img src="${ path }/resources/images/market/star_unfilled.png" width="20" height="20" alt="star" style="transform: translateY(-2px);">                                      
							</c:forEach>
                        </span>
                        <span class="review-count">${ product.proRevCount }개 상품평</span>
                        <span class="badge badge-secondary badge-new">New</span>
                    </div>
                    <div class="prod-original-price">
                         -<fmt:formatNumber type="number" value="${ 100 - (product.proSPrice / product.proOPrice * 100) }" pattern="0"/>% 
                         <del><fmt:formatNumber value="${ product.proOPrice }" pattern="#,###원"/></del> (정상가)
                    </div>
                    <div class="prod-sale-price">
                        <span class="sale-price"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###원"/></span>
                        <span class="sale-price-info">(할인가)</span>
                    </div>
                    <div class="reward-point">
                        <span><fmt:formatNumber value="${ product.proSPrice * 0.05 }" pattern="#,###원"/></span> 적립 (5% 적립)
                    </div>
                    <div class="delivery-etd">
                        지금 주문 시 내일 발송됩니다.
                        <c:if test="${ product.proLTime.equals('1') }">
                        내일
                        </c:if>
                    </div>
                    <br>
                    <div>
                    </div>
                    <div class="prod-total-price">
                       <span class="col mt-2 p-0">
                        	<button class="minus-btn" style="border: none; background-color: #f1f3f5; width: 28px;">-</button>
								<input type="text" class="qty-input" style="text-align:center;" size="3" value="1"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        	<button class="plus-btn" style="border: none; background-color: #f1f3f5; width: 28px;">+</button>
                       	</span>
                        <span class="total-price-info">총 상품 금액</span>
                        <div class="total-price" id="totalPrice"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/></div>
						<span class="total-price" style="margin: 0;">원</span>
                    </div>
                    <br>
                    <div class="prod-summary-footer">
                        <button class="btn btn-light" id="btnAddCart" style="width: 235px;">장바구니</button>
                        <button class="btn btn-light" id="btnBuy" style="width: 235px;">바로 구매</button>
						<c:if test="${ (loginMember.no == product.proSelNo) || (loginMember.memberRole == 'ROLE_ADMIN')}">
	                        <br><br>
	                        <button class="btn btn-light" style="width: 235px;"
	                            	onclick="location.href='${ path }/market/product-update?proNo=${ product.proNo }'">상품 수정</button>
	                        <button class="btn btn-light" id="btnDelProd" style="width: 235px;">상품 삭제</button>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="contents">
                <div id="topFix">
                    <ul class="tap-contents" >
                        <li><a href="#prodContent">상품상세</a></li>
                        <li><a href="#prodReview">상품평</a></li>
                        <li><a href="#prodQna">상품문의</a></li>
                        <li><a href="#prodDelivery">배송/반품/교환 안내</a></li>
                    </ul>
                </div>
                <div id="belowFix">
                    <div class="row justify-content-center">
                        <p id="prodContent"></p>
                        <br><br>
                        <div>${ product.proContent }</div>
                    </div>
                    <ul class="prod-review-wrap">
                        <p id="prodReview"></p>
                        <br><br>
                        <div>
							<br>
                            <h4><strong>상품평</strong></h4>
                            <p><small>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
                                배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 1:1 문의에 남겨주세요.
                            </small></p>
                            <hr>
                            <div class="review">
                            	<c:if test="${ empty list }">
                            		이 상품의 리뷰가 아직 존재하지 않습니다.
                            	</c:if>
                            	<c:if test="${ not empty list }">
                            		<c:forEach var="review" items="${ list }">
		                                <span>
		                                	<c:set var="name" value="${review.memname}"/>
											<c:set var="totalLength" value="${fn:length(name) }"/>
											<c:set var="first" value="${fn:substring(name, 0, 1) }"/>
											<c:set var="last" value="${fn:substring(name, 2, totalLength) }"/>
		                                	<c:out value="${first} * ${last}"/>
		                                </span>
		                                <div>
		                                    <span class="rating">
			                                    <c:forEach var="i" begin="1" end="${ review.revscore }">
			                                    	<img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
			                                    </c:forEach>											
												<c:forEach var="j" begin="1" end="${ 5 - review.revscore }">	
				                                	<img src="${ path }/resources/images/market/star_unfilled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
												</c:forEach>
											</span>
		                                    <span><fmt:formatDate value="${ review.revdate }" pattern="yyyy.MM.dd"/></span>
		                                </div>                                
		                                <div>${ review.revcoment }
		                                </div>
		                                <img class="img" src="${path}/resources/uploadFiles/${ review.revrenameimg }" width="80" height="80">
		                                <img class="img" src="${path}/resources/uploadFiles/nobox.png" width="80" height="80">
		                                <img class="img" src="${path}/resources/uploadFiles/nobox.png" width="80" height="80">
		                                <div class="modal">
		                                    <span class="close">&times;</span>
		                                    <img class="modal_content" src="${path}/resources/uploadFiles/${ review.revrenameimg }">
		                                </div>
		                                <div class="modal">
		                                    <span class="close">&times;</span>
		                                    <img class="modal_content" src="${path}/resources/uploadFiles/nobox.png">
		                                </div>
		                                <div class="modal">
		                                    <span class="close">&times;</span>
		                                    <img class="modal_content" src="${path}/resources/uploadFiles/nobox.png">
		                                </div><hr>
	                                </c:forEach>
								</c:if>
							</div>
                            <br><br>
                            <div class="col">
				                 <ul class="pagination justify-content-center">
					                 <li class="page-item"><a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }&page=1">&lt;&lt;</a></li>
					                 <li class="page-item"><a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }&page=${ pageInfo.prevPage }&prono=${ review.prono }">&lt;</a></li>
									 <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									 	<c:if test="${ status.current == pageInfo.currentPage }">
					                    	<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
										</c:if>
										<c:if test="${ status.current != pageInfo.currentPage }">
					                    	<li class="page-item"><a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }&page=${ status.current }&prono=${ review.prono }">${ status.current }</a></li>
										</c:if>
									 </c:forEach>
					                 <li class="page-item"><a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }&page=${ pageInfo.nextPage }&prono=${ review.prono }">&gt;</a></li>
					                 <li class="page-item"><a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }&page=${ pageInfo.maxPage }&prono=${ review.prono }">&gt;&gt;</a></li>
				                 </ul>
                            </div>
                        </div>
                    </ul>
                    <ul class="prod-qna-wrap">
                        <p id="prodQna"></p>
                        <br><br>
                        <br>
                        <h4><strong>상품 문의</strong></h4>
                        <br>
                        <table class="table" style="margin: 0;">
                            <thead>
                                <tr>
                                    <th class="py-0.5" style="width: 10%; text-align: center;">답변상태</th>
                                    <th class="py-0.5" style="width: 60%; text-align: center;">제목</th>
                                    <th class="py-0.5" style="width: 15%; text-align: center;">작성자</th>
                                    <th class="py-0.5" style="width: 15%; text-align: center;">작성일</th>
                                </tr>
                            </thead>
                        </table>
                        <div class="accordion" id="accordionExample">
                            <div class="" id="headingOne" style="padding: 0;">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="padding: 0; border: 0; text-decoration:none">
                                <table class="table" style="margin: 0; border: 0; padding: 0;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 10%; text-align: center;">답변완료</td>
                                            <td class="width: 60%; qna-content">매번구매구매하구있어요~하루에200그램먹이면될까요?웰시코기인데요20키로나가요</td>
                                            <td style="width: 15%; text-align: center;">ds06**</td>
                                            <td style="width: 15%; text-align: center;">2022-09-18</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody>
                                    <tr>
                                        <td style="width: 10%; text-align: center;"></td>
                                        <td class="width: 60%; qna-content">┖<span class="badge badge-secondary badge-new" style="transform: translateY(-2px);">답변</span>&nbsp; 좋아요 좋아</td>
                                        <td style="width: 15%; text-align: center;">판매자</td>
                                        <td style="width: 15%; text-align: center;">2022-09-18</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <div class="accordion" id="accordionExample">
                            <div class="" id="headingTwo" style="padding: 0;">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" style="padding: 0; border: 0; text-decoration:none">
                                <table class="table" style="margin: 0; border: 0; padding: 0;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 10%; text-align: center;">답변완료</td>
                                            <td class="width: 60%; qna-content">매번구매구매하구있어요~하루에200그램먹이면될까요?웰시코기인데요20키로나가요</td>
                                            <td style="width: 15%; text-align: center;">ds06**</td>
                                            <td style="width: 15%; text-align: center;">2022-09-18</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody>
                                    <tr>
                                        <td style="width: 10%; text-align: center;"></td>
                                        <td class="width: 60%; qna-content">┖<span class="badge badge-secondary badge-new" style="transform: translateY(-2px);">답변</span>&nbsp; 좋아요 좋아</td>
                                        <td style="width: 15%; text-align: center;">판매자</td>
                                        <td style="width: 15%; text-align: center;">2022-09-18</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <div class="accordion" id="accordionExample">
                            <div class="" id="headingThree" style="padding: 0;">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree" style="padding: 0; border: 0; text-decoration:none">
                                <table class="table" style="margin: 0; border: 0; padding: 0;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 10%; text-align: center;">답변완료</td>
                                            <td class="width: 60%; qna-content">매번구매구매하구있어요~하루에200그램먹이면될까요?웰시코기인데요20키로나가요</td>
                                            <td style="width: 15%; text-align: center;">ds06**</td>
                                            <td style="width: 15%; text-align: center;">2022-09-18</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody>
                                    <tr>
                                        <td style="width: 10%; text-align: center;"></td>
                                        <td class="width: 60%; qna-content">┖<span class="badge badge-secondary badge-new" style="transform: translateY(-2px);">답변</span>&nbsp; 좋아요 좋아</td>
                                        <td style="width: 15%; text-align: center;">판매자</td>
                                        <td style="width: 15%; text-align: center;">2022-09-18</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <div class="accordion" id="accordionExample">
                            <div class="" id="headingFour" style="padding: 0;">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour" style="padding: 0; border: 0; text-decoration:none">
                                <table class="table" style="margin: 0; border: 0; padding: 0;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 10%; text-align: center;">답변완료</td>
                                            <td class="width: 60%; qna-content">매번구매구매하구있어요~하루에200그램먹이면될까요?웰시코기인데요20키로나가요</td>
                                            <td style="width: 15%; text-align: center;">ds06**</td>
                                            <td style="width: 15%; text-align: center;">2022-09-18</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody>
                                    <tr>
                                        <td style="width: 10%; text-align: center;"></td>
                                        <td class="width: 60%; qna-content">┖<span class="badge badge-secondary badge-new" style="transform: translateY(-2px);">답변</span>&nbsp; 좋아요 좋아</td>
                                        <td style="width: 15%; text-align: center;">판매자</td>
                                        <td style="width: 15%; text-align: center;">2022-09-18</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <div class="accordion" id="accordionExample">
                            <div class="" id="headingFive" style="padding: 0;">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive" style="padding: 0; border: 0; text-decoration:none">
                                <table class="table" style="margin: 0; border: 0; padding: 0;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 10%; text-align: center;">답변완료</td>
                                            <td class="width: 60%; qna-content">매번구매구매하구있어요~하루에200그램먹이면될까요?웰시코기인데요20키로나가요</td>
                                            <td style="width: 15%; text-align: center;">ds06**</td>
                                            <td style="width: 15%; text-align: center;">2022-09-18</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody>
                                    <tr>
                                        <td style="width: 10%; text-align: center;"></td>
                                        <td class="width: 60%; qna-content">┖<span class="badge badge-secondary badge-new" style="transform: translateY(-2px);">답변</span>&nbsp; 좋아요 좋아</td>
                                        <td style="width: 15%; text-align: center;">판매자</td>
                                        <td style="width: 15%; text-align: center;">2022-09-18</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <br><br>
                        <div class="col">
                            <ul class="pagination justify-content-center">
                                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                            </ul>
                        </div>
                    </ul>
                    <ul class="prod-delivery-wrap">
                        <p id="prodDelivery"></p>
                        <br><br>
                        <div>
                            <br>
                            <h4><strong>상품 배송/교환/반품 안내</strong></h4>
                            <div class="mt-5">
                                <table class="table">
                                        <tr>
                                            <td class="py-0.5">배송정보</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="py-0.5">교환/반품 비용</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="py-0.5">교환/반품 신청 기준일</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="py-0.5">교환/반품 제한 사항</td>
                                            <td></td>
                                        </tr>
                                    </tbody>                        
                                </table>
                                <br>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<!--                         
	<form action="${ path }/market/cart/add" method="POST" class="add-cart-form">
		<input type="hidden" name="proNo" class="update_proNo">
		<input type="hidden" name="proCount" class="update_proCount">
		<input type="hidden" name="no" value="${loginMember.no}">
	</form>	
 -->	
	<form action="${ path }/market/order/${ loginMember.no }" method="GET" class="order-form">
		<input type="hidden" name="orders[0].proNo" value="${ product.proNo }">
		<input type="hidden" name="orders[0].proCount" value="">
	</form>

    <script src="${path}/resources/js/market/product.js"></script>

    <script>
	$(document).ready(() => {
	    $("#btnDelProd").on("click", () => {
	        if(confirm("정말로 게시글을 삭제하시겠습니까?")) {
	            location.replace("${ path }/market/product-delete?proNo=${ product.proNo }");
	        };
	    });

    	// 주문 수량 선택
    	var quantity = $(".qty-input").val();
    	$(".plus-btn").on("click", () => {
    		$(".qty-input").val(++quantity);
    		$("#totalPrice").text((${ product.proSPrice } * quantity).toLocaleString());
    	});
    	$(".minus-btn").on("click", () => {
    		if(quantity > 1){
    			$(".qty-input").val(--quantity);
        		$("#totalPrice").text((${ product.proSPrice } * quantity).toLocaleString());
    		}
    	});

    	// 서버로 전송할 데이터
    	const form = {
    		no: '${ loginMember.no }',
     		proNo: '${ product.proNo }',
     		proCount: ''
   		}
    	
    	// 장바구니 추가 버튼
   		$("#btnAddCart").on("click", function(e) {
			form.proCount = $(".qty-input").val();
   			$.ajax({
   				url: '${path}/market/cart/add',
   				type: 'POST',
   				data: form,	
   				success: function(result) {
   					cartAlert(result);
   					console.log(result);
   				},
   				error: function(error) {
   					console.log(error);
   				},
   				complete: function() {
   					console.log("complete");
   				}
   			})
   		});
    	
   		function cartAlert(result){
   			if(result == '0'){
   				alert("장바구니 추가에 실패했습니다.");
   			} else if(result == '1'){
   				alert("상품이 장바구니에 추가되었습니다.");
   			} else if(result == '2'){
   				alert("상품이 이미 장바구니에 있습니다.");
   			} else if(result == '5'){
   				alert("로그인이 필요합니다.");	
   			}
   		}
   		
   		// 바로 구매 버튼
   		$("#btnBuy").on("click", function() {
   			let proCount = $(".qty-input").val();
   			$(".order-form").find("input[name='orders[0].proCount']").val(proCount);
   			$(".order-form").submit();
   		})
	});
	
    // 상품 상세 페이지 상단바

    var topBar = $("#topFix").offset();
    $(window).scroll(function(){
        var docScrollY = $(document).scrollTop()
        var barThis = $("#topFix")
        var fixNext = $("#belowFix")
        if( docScrollY > topBar.top ) {
            barThis.addClass("top_bar_fix");
            fixNext.addClass("pd_top_80");
        }else{
            barThis.removeClass("top_bar_fix");
            fixNext.removeClass("pd_top_80");
        }
    });
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />