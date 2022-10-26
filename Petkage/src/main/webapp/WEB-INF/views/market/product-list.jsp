<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div id="wrap-all-prod">
	<div class="row">
    	<div class="contents">
        	<br><br>
        	<form action="${ path }/market/product-list" method="GET">
            <div class="row justify-content-center">
            	<div class="wrap-category">
                	<div class="category-info-top"><a href="${ path }/market/product-list"><h3>마켓</h3></a></div>
                    <div class="wrap-search-bar">
                    	<input type="text" name="searchValue" id="searchInput" class="form-control" size="60">
                    	<span class="input-group-btn">
                        	<button>
                            	<img src="${ path }/resources/images/market/search.png" width="23" height="23" alt="search">
                            </button>
                        </span>
                    </div>
                </div>
			</div>
            </form>
            <c:if test="${ empty product.proCategory1 }">
            <c:if test="${ (loginMember.memberRole == 'ROLE_SELLER') || (loginMember.memberRole == 'ROLE_ADMIN')}">
	        	<button class="btn add-pro-btn" onclick="location.href='${ path }/market/product-write'">상품 등록</button>
	        </c:if>
            <form action="${ path }/market/product-list" method="GET">
            <div class="row justify-content-center">
            <!-- 
                <input type="button" name="proCategory1" id="dogOn" class="categoryBtn clicked" value="dog">
            	<input type="button" name="proCategory1" id="catOn" class="categoryBtn" value="cat">
            -->
            	<button name="proCategory1" id="dogOn" class="categoryBtn" value="dog">강아지</button>
                <button name="proCategory1" id="catOn" class="categoryBtn" value="cat">고양이</button>
            </div>
            </form>

            <div class="row justify-content-center">
            	<div class="col-xs-1">
                	<ul class="wrap-subcategory">
                    	<li class="subcategory">
                        	<button class="btn-subcategory" name="proCategory2" value="best" onclick="location.href='${ path }/market/product-list?proCategory2=best'">
                            	<span class="span-subcategory-img">
                                	<img src="${ path }/resources/images/market/category/best-icon.png" width="60" height="60" alt="">
                                </span><br>
                                <span class="span-subcategory">베스트</span>
                            </button>
                        </li>
                        <li class="subcategory">
                            <button class="btn-subcategory" name="proCategory2" value="food" onclick="location.href='${ path }/market/product-list?proCategory2=food'">
                            	<span class="span-subcategory-img">
                                	<img src="${ path }/resources/images/market/category/dog-icon1.png" width="60" height="60" alt="">
                                </span><br>
                                <span class="span-subcategory">사료/간식</span>
                            </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="health" onclick="location.href='${ path }/market/product-list?proCategory2=health'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon3.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">건강관리</span>
                              </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="poo" onclick="location.href='${ path }/market/product-list?proCategory2=poo'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon4.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">배변용품</span>
                              </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="living" onclick="location.href='${ path }/market/product-list?proCategory2=living'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon5.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">리빙용품</span>
                              </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="beauty" onclick="location.href='${ path }/market/product-list?proCategory2=beauty'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon7.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">미용/목욕</span>
                              </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="outdoor" onclick="location.href='${ path }/market/product-list?proCategory2=outdoor'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon8.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">야외용품</span>
                              </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="toy" onclick="location.href='${ path }/market/product-list?proCategory2=toy'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon9.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">장난감</span>
                              </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="fashion" onclick="location.href='${ path }/market/product-list?proCategory2=fashion'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon10.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">패션용품</span>
                              </button>
                        </li>
                        <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="etc" onclick="location.href='${ path }/market/product-list?proCategory2=etc'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon11.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">기타</span>
                              </button>
                        </li>
                    </ul>
                </div>
			</div>
			<hr>
<!--            <div class="row filter-list">
            	<a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                <a href="javascript:pricelistdesc();">높은가격</a>
            </div>
	            </form> -->
            <div class="row">
	            <c:if test="${ empty list }">
	            	조회된 게시글이 없습니다.
	            </c:if>
	            <c:if test="${ not empty list }">
	            	<div class="row row-cols-2 row-cols-md-4">
	                  	<c:forEach var="product" items="${ list }">
	                    	<div class="col col-mb-4" style="padding: 0;">
	                        	<a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }" style="border: 0; height: 410px;">
	                           <div class="card h-100" style="border: 0;">
									<img src="${ path }/resources/upload/market/${ product.renamedFileName }" class="card-img-top" alt="...">
									<div class="card-body">
	                                	<p class="card-text">${ product.proName }</p>
	                                	<div style="margin-bottom: 5px;">
	                                    	<span style="color: #ed0000; font-size: 18px; font-weight: bold;"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/></span><span>원</span><br>
	                                    </div>
	                                    <p style="color: green; margin: 2px; font-size: 15px;">지금 주문 시 내일 발송</p>
	                                    <div style="margin-bottom: 5px;">
		                                    <span class="rating">
			                                    <c:forEach var="i" begin="1" end="${ product.proRating }">
			                                    	<img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
			                                    </c:forEach>											
												<c:forEach var="j" begin="1" end="${ 5 - product.proRating + 0.9}">	
				                                	<img src="${ path }/resources/images/market/star_unfilled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
												</c:forEach>
		                                    </span>(후기 : ${ product.proRevCount }건)
										</div>
	                                </div>
	                           </div>
	                            </a><hr>
	                        </div>
	                  	</c:forEach>
	            	</div>
	            </c:if>
             </div>
             <div>
                 <ul class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=1&searchValue=${ product.searchValue }">&lt;&lt;</a></li>
                  <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.prevPage }&searchValue=${ product.searchValue }">&lt;</a></li>
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ status.current }&searchValue=${ product.searchValue }">${ status.current }</a></li>
				</c:if>
			</c:forEach>
                     <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.nextPage }&searchValue=${ product.searchValue }">&gt;</a></li>
                 	<li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.maxPage }&searchValue=${ product.searchValue }">&gt;&gt;</a></li>
                 </ul>
             </div>
         </c:if>
             <c:if test="${ product.proCategory1 == 'dog' }">
	            <c:if test="${ (loginMember.memberRole == 'ROLE_SELLER') || (loginMember.memberRole == 'ROLE_ADMIN')}">
		        	<button class="btn add-pro-btn" onclick="location.href='${ path }/market/product-write'">상품 등록</button>
		        </c:if>
	            <form action="${ path }/market/product-list" method="GET">
	            <div class="row justify-content-center">
	            <!-- 
	                <input type="button" name="proCategory1" id="dogOn" class="categoryBtn clicked" value="dog">
	            	<input type="button" name="proCategory1" id="catOn" class="categoryBtn" value="cat">
	            -->
	            	<button name="proCategory1" id="dogOn" class="categoryBtn clicked" value="dog">강아지</button>
	                <button name="proCategory1" id="catOn" class="categoryBtn" value="cat">고양이</button>
	            </div>
	            </form>
             <div class="row justify-content-center">
                  <div class="col-xs-1">
                      <ul class="wrap-subcategory">
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="best">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/best-icon.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">베스트</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="food" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=food'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon1.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">사료/간식</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="health" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=health'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon3.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">건강관리</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="poo" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=poo'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon4.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">배변용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="living" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=living'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon5.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">리빙용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="beauty" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=beauty'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon7.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">미용/목욕</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="outdoor" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=outdoor'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon8.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">야외용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="toy" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=toy'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon9.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">장난감</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="fashion" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=fashion'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon10.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">패션용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="etc" onclick="location.href='${ path }/market/product-list?proCategory1=dog&proCategory2=etc'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon11.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">기타</span>
                              </button>
                          </li>
                      </ul>
                  </div>
              </div>
             <hr>
<!--             <div class="row filter-list">
                 <a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                 <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                 <a href="javascript:pricelistdesc();">높은가격</a>
             </div>
	            </form> -->
             <div class="row">
              <c:if test="${ empty list }">
              	조회된 게시글이 없습니다.
              </c:if>
              <c:if test="${ not empty list }">
                 	<div class="row row-cols-2 row-cols-md-4">
                  	<c:forEach var="product" items="${ list }">
                       <div class="col col-mb-4" style="padding: 0;">
                           <a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }" style="border: 0; height: 410px;">
                           <div class="card h-100" style="border: 0;">
								<img src="${ path }/resources/upload/market/${ product.renamedFileName }" class="card-img-top" alt="...">
								<div class="card-body">
                                	<p class="card-text">${ product.proName }</p>
                                	<div style="margin-bottom: 5px;">
                                    	<span style="color: #ed0000; font-size: 18px; font-weight: bold;"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/></span><span>원</span><br>
                                    </div>
                                    <p style="color: green; margin: 2px; font-size: 15px;">지금 주문 시 내일 발송</p>
                                    <div style="margin-bottom: 5px;">
	                                    <span class="rating">
		                                    <c:forEach var="i" begin="1" end="${ product.proRating }">
		                                    	<img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
		                                    </c:forEach>											
											<c:forEach var="j" begin="1" end="${ 5 - product.proRating + 0.9}">	
			                                	<img src="${ path }/resources/images/market/star_unfilled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
											</c:forEach>
	                                    </span>(후기 : ${ product.proRevCount }건)
									</div>
                                </div>
                           </div>
                           </a><hr>
                       </div>
                  	</c:forEach>
                		</div>
                	</c:if>
             </div>
             <div>
                 <ul class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=1&proCategory1=dog&proCategory2=${ product.proCategory2 }">&lt;&lt;</a></li>
                  <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.prevPage }&proCategory1=dog&proCategory2=${ product.proCategory2 }">&lt;</a></li>
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ status.current }&proCategory1=dog&proCategory2=${ product.proCategory2 }">${ status.current }</a></li>
				</c:if>
			</c:forEach>
                     <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.nextPage }&proCategory1=dog&proCategory2=${ product.proCategory2 }">&gt;</a></li>
                 	<li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.maxPage }&proCategory1=dog&proCategory2=${ product.proCategory2 }">&gt;&gt;</a></li>
                 </ul>
             </div>
         </c:if>
         <c:if test="${ product.proCategory1 == 'cat' }">
       	    <c:if test="${ (loginMember.memberRole == 'ROLE_SELLER') || (loginMember.memberRole == 'ROLE_ADMIN')}">
	        	<button class="btn add-pro-btn" onclick="location.href='${ path }/market/product-write'">상품 등록</button>
	        </c:if>
            <form action="${ path }/market/product-list" method="GET">
            <div class="row justify-content-center">
            <!-- 
                <input type="button" name="proCategory1" id="dogOn" class="categoryBtn clicked" value="dog">
            	<input type="button" name="proCategory1" id="catOn" class="categoryBtn" value="cat">
            -->
            	<button name="proCategory1" id="dogOn" class="categoryBtn" value="dog">강아지</button>
                <button name="proCategory1" id="catOn" class="categoryBtn clicked" value="cat">고양이</button>
            </div>
            </form>
             <div class="row justify-content-center">
                  <div class="col-xs-1">
                      <ul class="wrap-subcategory">
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="best" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=best'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/best-icon.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">베스트</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="food" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=food'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon1.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">사료/간식</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="health" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=health'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon3.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">건강관리</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="poo" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=poo'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon4.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">배변용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="living" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=living'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon5.png"" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">리빙용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="beauty" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=beauty'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon7.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">미용/목욕</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="outdoor" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=outdoor'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon8.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">야외용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="toy" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=toy'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon9.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">장난감</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="fashion" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=fashion'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon10.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">패션용품</span>
                              </button>
                          </li>
                          <li class="subcategory">
                              <button class="btn-subcategory" name="proCategory2" value="etc" onclick="location.href='${ path }/market/product-list?proCategory1=cat&proCategory2=etc'">
                                  <span class="span-subcategory-img">
                                      <img src="${ path }/resources/images/market/category/dog-icon11.png" width="60" height="60" alt="">
                                  </span><br>
                                  <span class="span-subcategory">기타</span>
                              </button>
                          </li>
                      </ul>
                  </div>
              </div>
             <hr>
<!--             <div class="row filter-list">
                 <a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                 <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                 <a href="javascript:pricelistdesc();">높은가격</a>
             </div>
	            </form> -->
             <div class="row">
              <c:if test="${ empty list }">
              	조회된 게시글이 없습니다.
              </c:if>
              <c:if test="${ not empty list }">
                 	<div class="row row-cols-2 row-cols-md-4">
                  	<c:forEach var="product" items="${ list }">
                       <div class="col col-mb-4" style="padding: 0;">
                           <a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }" style="border: 0; height: 410px;">
                           <div class="card h-100" style="border: 0;">
								<img src="${ path }/resources/upload/market/${ product.renamedFileName }" class="card-img-top" alt="...">
								<div class="card-body">
                                	<p class="card-text">${ product.proName }</p>
                                	<div style="margin-bottom: 5px;">
                                    	<span style="color: #ed0000; font-size: 18px; font-weight: bold;"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/></span><span>원</span><br>
                                    </div>
                                    <p style="color: green; margin: 2px; font-size: 15px;">지금 주문 시 내일 발송</p>
                                    <div style="margin-bottom: 5px;">
	                                    <span class="rating">
		                                    <c:forEach var="i" begin="1" end="${ product.proRating }">
		                                    	<img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
		                                    </c:forEach>											
											<c:forEach var="j" begin="1" end="${ 5 - product.proRating + 0.9}">	
			                                	<img src="${ path }/resources/images/market/star_unfilled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">                                      
											</c:forEach>
	                                    </span>(후기 : ${ product.proRevCount }건)
									</div>
                                </div>
                           </div>
                           </a><hr>
                       </div>
                  	</c:forEach>
                		</div>
                	</c:if>
             </div>
             <div>
                 <ul class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=1&proCategory1=cat&proCategory2=${ product.proCategory2 }">&lt;&lt;</a></li>
                  <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.prevPage }&proCategory1=cat&proCategory2=${ product.proCategory2 }">&lt;</a></li>
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ status.current }&proCategory1=cat&proCategory2=${ product.proCategory2 }">${ status.current }</a></li>
				</c:if>
			</c:forEach>
                     <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.nextPage }&proCategory1=cat&proCategory2=${ product.proCategory2 }">&gt;</a></li>
                 	<li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.maxPage }&searchValue=${ product.searchValue }&proCategory1=cat&proCategory2=${ product.proCategory2 }">&gt;&gt;</a></li>
                 </ul>
             </div>
         </c:if>
        </div>
    </div>
</div>

<script src="${path}/resources/js/market/product.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />