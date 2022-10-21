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
                    <table class="table" id="tb1">

                   <tbody>
                       <tr>
                            <th scope="row">사진</th>
                            <td>2000-01-01</td>
                            <td>씨그램 레몬</td>
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
                            <td>씨그램 레몬</td>
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
                            <td>씨그램 레몬</td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-outline-secondary">수정</button>
                                    <button type="button" class="btn btn-outline-secondary">삭제</button>
                                </div>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="where">
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
            </div>
            </div>
            </div>
        </div>
    </div>
        
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