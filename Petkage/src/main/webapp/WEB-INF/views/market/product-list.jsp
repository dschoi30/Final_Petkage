<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">    

    <!-- Product CSS-->
    <link rel="stylesheet" href="${ path }/resources/css/market/product.css">

    <!-- Common CSS -->
    <link rel="stylesheet" href="/EUM/CSS/common/header.css"></link>
    <link rel="stylesheet" href="/EUM/CSS/common/footer.css"></link>

    <!-- jQuery js -->  
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>   
	
	<style type="text/css">
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	</style>
	
    <title>Header</title>
</head>
<body>
    <section class="hd">
        <div class="header_container">
            <header class="d-flex flex-wrap mb-4">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                    <img src="/EUM/resources/images/Petkage_Logo2.png" alt="" class="headerLogo">
                </a>
                <ul class="nav nav-pills">
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">어디가지</a></li>
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">커뮤니티</a></li>
                    <li class="nav-item header_item"><a href="/CHOI/HTML/product_list.html" class="nav-link header_link">마켓</a></li>
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">OTHERS</a></li>
                    <input type="button" class="headerBtn" id="loginBtn" value="로그인">
                    <a href="/" class="d-flex align-items-center headercart">
                        <img src="/EUM/resources/images/Cart.png" alt="" class="cart">
                    </a>
                </ul>
            </header>
        </div>
    </section>
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
	                                <button id="searchBtn">
	                                    <img src="${ path }/resources/images/market/search.png" width="23" height="23" alt="search">
	                                </button>
	                            </span>
	                        </div>
	                    </div>
	                </div>
                </form>   
                 <form action="${ path }/market/product-list" method="GET">
	                <div class="row justify-content-center">
	                <!-- 
	                    <input type="button" name="proCategory1" id="dogOn" class="categoryBtn clicked" value="dog">
	                    <input type="button" name="proCategory1" id="catOn" class="categoryBtn" value="cat">
	                -->
	                    <button name="proCategory1" id="dogOn" class="categoryBtn default" value="dog">강아지</button>
	                    <button name="proCategory1" id="catOn" class="categoryBtn" value="cat">고양이</button>
	                </div>
	                </form>
	                <c:if test="${ empty product.proCategory1 }">
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
	                <div class="row filter-list">
	                    <a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
	                    <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
	                    <a href="javascript:pricelistdesc();">높은가격</a>
	                </div>
<!--	            </form> -->
	                <div class="row">
		                <c:if test="${ empty list }">
		                	조회된 게시글이 없습니다.
		                </c:if>
		                <c:if test="${ not empty list }">
	                    	<div class="row row-cols-2 row-cols-md-4">
		                    	<c:forEach var="product" items="${ list }">
			                        <div class="col col-mb-4">
			                            <a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }" style="border: 0; height: 420px;">
			                            <div class="card h-100" style="border: 0;">
		                                    <img src="${ path }/resources/upload/market/${ product.renamedFileName }" class="card-img-top" alt="...">
		                                    <div class="card-body">
		                                        <p class="card-text">${ product.proName }</p>
		                                        <div style="margin-bottom: 5px;">
		                                            <span style="color: #ed0000; font-size: 18px; font-weight: bold;"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/></span><span>원</span><br>
		                                        </div>
		                                        <p style="color: green; margin: 2px; font-size: 15px;">지금 주문 시 10/6(목) 발송</p>
		                                        <div style="margin-bottom: 5px;">
			                                        <span class="rating">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                        </span>(후기 : 99건)
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
	                <div class="row filter-list">
	                    <a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
	                    <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
	                    <a href="javascript:pricelistdesc();">높은가격</a>
	                </div>
<!--	            </form> -->
	                <div class="row">
		                <c:if test="${ empty list }">
		                	조회된 게시글이 없습니다.
		                </c:if>
		                <c:if test="${ not empty list }">
	                    	<div class="row row-cols-2 row-cols-md-4">
		                    	<c:forEach var="product" items="${ list }">
			                        <div class="col col-mb-4">
			                            <a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }" style="border: 0; height: 420px;">
			                            <div class="card h-100" style="border: 0;">
		                                    <img src="${ path }/resources/upload/market/${ product.renamedFileName }" class="card-img-top" alt="...">
		                                    <div class="card-body">
		                                        <p class="card-text">${ product.proName }</p>
		                                        <div style="margin-bottom: 5px;">
		                                            <span style="color: #ed0000; font-size: 18px; font-weight: bold;"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/></span><span>원</span><br>
		                                        </div>
		                                        <p style="color: green; margin: 2px; font-size: 15px;">지금 주문 시 10/6(목) 발송</p>
		                                        <div style="margin-bottom: 5px;">
			                                        <span class="rating">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                        </span>(후기 : 99건)
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
		                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=1&searchValue=${ product.searchValue }&proCategory1=dog&proCategory2=${ product.proCategory2 }">&lt;&lt;</a></li>
		                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.prevPage }&searchValue=${ product.searchValue }&proCategory1=dog&proCategory2=${ product.proCategory2 }">&lt;</a></li>
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:if test="${ status.current == pageInfo.currentPage }">
				                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
								</c:if>
								<c:if test="${ status.current != pageInfo.currentPage }">
				                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ status.current }&searchValue=${ product.searchValue }&proCategory1=dog&proCategory2=${ product.proCategory2 }">${ status.current }</a></li>
								</c:if>
							</c:forEach>
	                        <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.nextPage }&searchValue=${ product.searchValue }&proCategory1=dog&proCategory2=${ product.proCategory2 }">&gt;</a></li>
	                    	<li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.maxPage }&searchValue=${ product.searchValue }&proCategory1=dog&proCategory2=${ product.proCategory2 }">&gt;&gt;</a></li>
	                    </ul>
	                </div>
	            </c:if>
	            	                <c:if test="${ product.proCategory1 == 'cat' }">
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
	                <div class="row filter-list">
	                    <a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
	                    <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
	                    <a href="javascript:pricelistdesc();">높은가격</a>
	                </div>
<!--	            </form> -->
	                <div class="row">
		                <c:if test="${ empty list }">
		                	조회된 게시글이 없습니다.
		                </c:if>
		                <c:if test="${ not empty list }">
	                    	<div class="row row-cols-2 row-cols-md-4">
		                    	<c:forEach var="product" items="${ list }">
			                        <div class="col col-mb-4">
			                            <a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }" style="border: 0; height: 420px;">
			                            <div class="card h-100" style="border: 0;">
		                                    <img src="${ path }/resources/upload/market/${ product.renamedFileName }" class="card-img-top" alt="...">
		                                    <div class="card-body">
		                                        <p class="card-text">${ product.proName }</p>
		                                        <div style="margin-bottom: 5px;">
		                                            <span style="color: #ed0000; font-size: 18px; font-weight: bold;"><fmt:formatNumber value="${ product.proSPrice }" pattern="#,###"/></span><span>원</span><br>
		                                        </div>
		                                        <p style="color: green; margin: 2px; font-size: 15px;">지금 주문 시 10/6(목) 발송</p>
		                                        <div style="margin-bottom: 5px;">
			                                        <span class="rating">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                            <img src="${ path }/resources/images/market/star_filled.png" width="14" height="14" alt="star" style="transform: translateY(-2px);">
			                                        </span>(후기 : 99건)
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
		                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=1&searchValue=${ product.searchValue }&proCategory1=cat&proCategory2=${ product.proCategory2 }">&lt;&lt;</a></li>
		                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.prevPage }&searchValue=${ product.searchValue }&proCategory1=cat&proCategory2=${ product.proCategory2 }">&lt;</a></li>
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:if test="${ status.current == pageInfo.currentPage }">
				                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
								</c:if>
								<c:if test="${ status.current != pageInfo.currentPage }">
				                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ status.current }&searchValue=${ product.searchValue }&proCategory1=cat&proCategory2=${ product.proCategory2 }">${ status.current }</a></li>
								</c:if>
							</c:forEach>
	                        <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.nextPage }&searchValue=${ product.searchValue }&proCategory1=cat&proCategory2=${ product.proCategory2 }">&gt;</a></li>
	                    	<li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.maxPage }&searchValue=${ product.searchValue }&proCategory1=cat&proCategory2=${ product.proCategory2 }">&gt;&gt;</a></li>
	                    </ul>
	                </div>
	            </c:if>
            </div>
        </div>
    </div>
    <section class="ft">
        <!-- <div id='wrapper'>
            <div>
                CONTENT 
            </div>
        </div> -->

        <div class="footer_container">
            <footer class="footer_section1">
                <!-- <div class="footer"> -->
                    <p class="footerName">Petkage</p>

                    <ul class="nav footer_nav">
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">이용약관</a></li>
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">개인정보 취급방침</a></li>
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">공지사항</a></li>
                        <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">FAQ</a></li>
                    </ul>

                    <div class="footer_contents">
                        <p class="footer_content">회사명 : (주)펫키지 대표 : 문인수 / 전화 : 070-1234-5678 / 주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩</p>
                        <p class="footer_content">사업자 등록번호 안내 : 123-45-6789 / 통신판매업 신고 2022-서울강남-03472 <a href="">[사업자정보 확인]</a>  </p>
                        <p class="footer_content">&copy;펫키지. All Rights Reserved</p>
                    </div>

                    <div class="footer_icons">
                        <a href="/" class="">
                            <img src="/EUM/resources/images/Instagram.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="/EUM/resources/images/Facebook.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="/EUM/resources/images/youtube.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="/EUM/resources/images/kakaotalk.png" alt="" class="footericon">
                        </a>
                    </div>

                    <img src="/EUM/resources/images/Pet2.png" alt="" class="footerLogo">
                <!-- </div> -->
            </footer>
        </div>
    </section>

    <script src="${path}/resources/js/market/product.js"></script>
    


</body>
</html>