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
    <link rel="stylesheet" href="${ path }/resources/css/market/modal.css">
    
    <!-- slideShow  -->
    <link rel="stylesheet" href="${ path }/resources/css/market/slideShow.css">

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
				    <!-- Full-width images with number text -->
				    <div class="slides">
				      <div class="numbertext">1 / 6</div>
				        <img src="${path}/resources/upload/market/${ product.renamedFileName }" style="width:480px; height: 480px;">
				    </div>
<!-- 				  
				    <div class="slides">
				      <div class="numbertext">2 / 6</div>
				        <img src="${path}/resources/images/market/dogfood2.jpg" style="width:480px; height: 480px;">
				    </div>
				  
				    <div class="slides">
				      <div class="numbertext">3 / 6</div>
				        <img src="${path}/resources/images/market/dogfood3.jpg" style="width:480px; height: 480px;">
				    </div>
				  
				    <div class="slides">
				      <div class="numbertext">4 / 6</div>
				        <img src="${path}/resources/images/market/dogfood4.jpg" style="width:480px; height: 480px;">
				    </div>
				  
				    <div class="slides">
				      <div class="numbertext">5 / 6</div>
				        <img src="${path}/resources/images/market/dogfood5.jpg" style="width:480px; height: 480px;">
				    </div>
				  
				    <div class="slides">
				      <div class="numbertext">6 / 6</div>
				        <img src="${path}/resources/images/market/dogfood6.jpg" style="width:480px; height: 480px;">
				    </div>
-->				  
				    <!-- Next and previous buttons -->
<!-- 				    <div style="position: relative;">
					    <a class="slide-prev" onclick="plusCarouselSlides(-1)">&#10094;</a>
					    <a class="slide-next" onclick="plusCarouselSlides(1)">&#10095;</a>
				  	</div> -->
				    <!-- Thumbnail images -->
<!--				    <div class="row-slide">
				      <div class="column">
				        <img class="thumbnail cursor" src="${path}/resources/upload/market/${ product.renamedFileName }" style="width:80px;" onclick="currentSlide(1)">
				      </div>
				      <div class="column">
				        <img class="thumbnail cursor" src="${path}/resources/images/market/dogfood2.jpg" style="width:80px" onclick="currentSlide(2)">
				      </div>
				      <div class="column">
				        <img class="thumbnail cursor" src="${path}/resources/images/market/dogfood3.jpg" style="width:80px" onclick="currentSlide(3)">
				      </div>
				      <div class="column">
				        <img class="thumbnail cursor" src="${path}/resources/images/market/dogfood4.jpg" style="width:80px" onclick="currentSlide(4)">
				      </div>
				      <div class="column">
				        <img class="thumbnail cursor" src="${path}/resources/images/market/dogfood5.jpg" style="width:80px" onclick="currentSlide(5)">
				      </div>
				      <div class="column">
				        <img class="thumbnail cursor" src="${path}/resources/images/market/dogfood6.jpg" style="width:80px" onclick="currentSlide(6)">
				      </div>
				    </div> -->
<!-- 
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
 -->
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
                    </div>
                    <div class="qty" style="margin-top: 10px;">
                    	남은 수량 : <fmt:formatNumber value="${ product.proQty }" pattern="#,###개"/>
                    </div><br>
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
						<br><br>
                        <p id="prodContent"></p>
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
<!--		                                <div class="row-modal">
									        <div class="column">
									          <img src="${ path }/resources/uploadFiles/${ review.revrenameimg }" onclick="openModal();currentSlide(1)" class="hover-shadow">
									        </div>
									        <div class="column">
									          <img src="${ path }/resources/uploadFiles/review2.jpg" onclick="openModal();currentSlide(2)" class="hover-shadow">
									        </div>
									        <div class="column">
									          <img src="${ path }/resources/uploadFiles/review3.jpg" onclick="openModal();currentSlide(3)" class="hover-shadow">
									        </div>
									        <div class="column">
									          <img src="${ path }/resources/uploadFiles/nobox.png" onclick="openModal();currentSlide(4)" class="hover-shadow">
									        </div>
									        <div class="column">
									          <img src="${ path }/resources/uploadFiles/nobox.png" onclick="openModal();currentSlide(5)" class="hover-shadow">
									        </div>
									    </div>
									       The Modal/Lightbox 
									    <div id="myModal" class="modal">
									        <span class="close cursor" onclick="closeModal()">&times;</span>
									        <div class="modal-content" style="border: none;">
									      
									          <div class="mySlides">
									            <div class="numbertext">1 / 5</div>
									            <img src="${ path }/resources/uploadFiles/${ review.revrenameimg }" style="margin: auto; display: block;">
									          </div>
									      
									          <div class="mySlides">
									            <div class="numbertext">2 / 5</div>
									            <img src="${ path }/resources/uploadFiles/review2.jpg" style="margin: auto; display: block;">
									          </div>
									      
									          <div class="mySlides">
									            <div class="numbertext">3 / 5</div>
									            <img src="${ path }/resources/uploadFiles/review3.jpg" style="margin: auto; display: block;">
									          </div>
									      
									          <div class="mySlides">
									            <div class="numbertext">4 / 5</div>
									            <img src="${ path }/resources/uploadFiles/nobox.png" style="margin: auto; display: block;">
									          </div>
									      
									          <div class="mySlides">
									            <div class="numbertext">5 / 5</div>
									            <img src="${ path }/resources/uploadFiles/nobox.png" style="margin: auto; display: block;">
									          </div>-->
									      
									          <!-- Next/previous controls 
									          <a class="prev" onclick="plusSlides(-1)" style="color: white;">&#10094;</a>
									          <a class="next" onclick="plusSlides(1)" style="color: white;">&#10095;</a>

									        
									    </div><hr></div>--><hr>
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
                        <h4><strong>자주 하는 질문</strong></h3>
                        <p><small>고객님들께서 가장 자주 하시는 질문을 담았습니다.
                        </small></p>
                        <table class="table" style="margin: 0;">
                            <thead>
                                <tr>
                                    <th class="py-0.5" style="width: 15%; text-align: center;">질문 유형</th>
                                    <th class="py-0.5" style="width: 85%; text-align: center;">제목</th>
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
                                            <td style="width: 15%; text-align: center;">주문/결제</td>
                                            <td class="width: 85%; qna-content">구매 영수증은 어떻게 발급받나요?</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody style="background-color: rgb(245, 245, 245);">
                                    <tr>
                                        <td style="width: 15%; text-align: center;"></td>
                                        <td class="width: 85%; qna-content">┖<span class="badge badge-secondary badge-new" 
                                            style="transform: translateY(-2px);">답변</span>&nbsp; 간편결제 서비스를 이용하시는 경우, 해당 결제사를 통해서 영수증 발급이 가능합니다.</td>
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
                                            <td style="width: 15%; text-align: center;">주문/결제</td>
                                            <td class="width: 85%; qna-content">주문 내역 조회는 어디에서 하나요?</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody style="background-color: rgb(245, 245, 245);">
                                    <tr>
                                        <td style="width: 15%; text-align: center;"></td>
                                        <td class="width: 85%; qna-content">┖<span class="badge badge-secondary badge-new" 
                                            style="transform: translateY(-2px);">답변</span>&nbsp; 하기 경로를 통해 구매하신 주문 건의 이력을 확인하실 수 있습니다.<br><br>
                                            펫키지 홈 상단 [마이페이지] 클릭 > 주문 내역</td>
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
                                            <td style="width: 15%; text-align: center;">주문/결제</td>
                                            <td class="width: 85%; qna-content">주문이 안 됩니다</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody style="background-color: rgb(245, 245, 245);">
                                    <tr>
                                        <td style="width: 15%; text-align: center;"></td>
                                        <td class="width: 85%; qna-content">┖<span class="badge badge-secondary badge-new" 
                                            style="transform: translateY(-2px);">답변</span>&nbsp; 시스템 이상으로 주문이 불가능한 경우<br><br>
                                        모든 인터넷 창을 종료 > 펫키지 홈페이지 재접속 > 재로그인 진행<br><br>
                                        [참고]<br>
                                        공용 PC의 경우 높은 방화벽으로 설정되어 있어 결제가 어려울 수 있습니다.</td>
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
                                            <td style="width: 15%; text-align: center;">취소/교환/환불</td>
                                            <td class="width: 85%; qna-content">교환(반품)은 어떻게 진행되나요?</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody style="background-color: rgb(245, 245, 245);">
                                    <tr>
                                        <td style="width: 15%; text-align: center;"></td>
                                        <td class="width: 85%; qna-content">┖<span class="badge badge-secondary badge-new" 
                                            style="transform: translateY(-2px);">답변</span>&nbsp; 교환(반품) 진행 방법<br><br>
                                            받으신 상품을 교환(반품) 하실 경우, 교환 사유+문제가 발생한 부분을 확인할 수 있는 사진과 함께 고객센터로 문의 바랍니다.</td>
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
                                            <td style="width: 15%; text-align: center;">취소/교환/환불</td>
                                            <td class="width: 85%; qna-content">환불 안내는 받았는데, 아직 카드사에서는 취소가 안 되었어요</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </button>
                            </h2>
                            </div>
                            <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                            <table class="table" style="margin: 0; border: 0; padding: 0;">
                                <tbody style="background-color: rgb(245, 245, 245);">
                                    <tr>
                                        <td style="width: 15%; text-align: center;"></td>
                                        <td class="width: 85%; qna-content">┖<span class="badge badge-secondary badge-new" 
                                            style="transform: translateY(-2px);">답변</span>&nbsp; 카드 취소 시, 유의사항<br><br>
                                            최종 카드 환불의 경우 카드사 사정으로 인해 환불접수일로부터 영업일 기준 3~5일 가량 소요 될 수 있습니다.<br><br>
                                            [참고]<br>
                                            자세한 사항은 카드사에 문의 부탁드리며, 7일 이후에도 환불이 되지 않은 경우 고객센터로 문의 부탁드립니다.</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <br><br>
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
                                            <td class="py-0.5" style="width: 18%;">배송정보</td>
                                            <td>* 판매자가 지정한 택배사를 통하여 배송이 진행됩니다. 도서 산간 지역 등은 하루가 더 소요될 수 있습니다.</td>
                                        </tr>
                                        <tr>
                                            <td class="py-0.5">교환/반품 비용</td>
                                            <td>* 단순 변심에 의한 교환/반품 시 왕복 배송비를 고객님께서 부담하셔야 합니다.<br>
                                                * 교환/반품에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다.</td>
                                        </tr>
                                        <tr>
                                            <td class="py-0.5">교환/반품 신청 기준일</td>
                                            <td>* 단순변심에 의한 상품의 교환/반품은 제품 수령 후 30일 이내, 상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터
                                                30일 이내에 청약철회가 가능합니다.</td>
                                        </tr>
                                        <tr>
                                            <td class="py-0.5">교환/반품 제한 사항</td>
                                            <td>* 상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (내용 확인을 위한 포장 개봉의 경우는 예외)<br>
                                                * 고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br>
                                                * 세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</td>
                                        </tr>
                                    </tbody>                        
                                </table>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
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
/*    
	// 캐러셀 슬라이드
    
    let carouselSlideIndex = 1;
    showCarouselSlides(carouselSlideIndex);

    // Next/previous controls
    function plusCarouselSlides(n) {
      showCarouselSlides(carouselSlideIndex += n);
    }

    // Thumbnail image controls
    function currentSlide(n) {
      showCarouselSlides(carouselSlideIndex = n);
    }

    function showCarouselSlides(n) {
      let i;
      let slides = document.getElementsByClassName("slides");
      console.log(slides);
      let dots = document.getElementsByClassName("thumbnail");
      if (n > slides.length) {carouselSlideIndex = 1}
      if (n < 1) {carouselSlideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[carouselSlideIndex-1].style.display = "block";
      dots[carouselSlideIndex-1].className += " active";
    }
*/    
    // 모달 슬라이더
    
    function openModal() {
      document.getElementById("myModal").style.display = "inline-block";
    }
    
    function closeModal() {
      document.getElementById("myModal").style.display = "none";
    }
    
    var slideIndex = 1;
    showSlides(slideIndex);
    
    // Next/previous controls
    function plusSlides(n) {
      showSlides(slideIndex += n);
    }
    
    // Thumbnail image controls
    function currentSlide(n) {
      showSlides(slideIndex = n);
    }
    
    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      console.log(slides.length);
      var captionText = document.getElementById("caption");
      if (n > 5) {slideIndex = 1}
      if (n < 1) {slideIndex = 5}
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      slides[slideIndex-1].style.display = "block";
    }
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />