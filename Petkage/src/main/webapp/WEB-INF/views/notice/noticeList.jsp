<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>notice</title>
    <link rel="stylesheet" href="${ path }/resources/css/notice/notice.css">
    <link rel="stylesheet" href="${ path }/resources/css/notice/fontello-embedded.css">
    <link rel="stylesheet" href="${ path }/resources/css/common/header.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    
</head>
<body>
	
	<section class="hd">
        <div class="header_container">
            <header class="d-flex flex-wrap mb-4">
                <a href="${ path }" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                    <img src="${ path }/resources/images/Petkage_Logo3.png" alt="" class="headerLogo">
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">어디가지</a></li>
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">마켓</a></li>
                    <li class="nav-item header_item"><a href="${ path }/tools/toolsMain" class="nav-link header_link">펫키지 툴즈</a></li>
                    <c:if test="${ empty loginMember }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/enroll'" value="회원가입">
	                    <input type="submit" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/login';" value="로그인">
					</c:if>
					
					<c:if test="${ (not empty loginMember) && loginMember.memberRole == 'ROLE_USER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/myPage'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.replace('${ path }/member/logout')" value="로그아웃">
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_SELLER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/myPage'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.replace('${ path }/member/logout')" value="로그아웃">
	                    <a href="${ path }/market/product-write">상품 등록</a><br><br>
						<a href="${ path }/market/product-list">상품 목록</a>
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/admin'" value="관리자페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.replace('${ path }/member/logout')" value="로그아웃">
        			</c:if>
        			
                    <a href="${ path }/market" class="d-flex align-items-center headercart">
                        <img src="${ path }/resources/images/Cart.png" alt="" class="cart">
                    </a>
                </ul>
            </header>
        </div>
     </section>
	
	<br><br>
    <section class="nt">
        <div class="container py-5">
        	<div class="nt_header">
                <span style="margin-right: 200px;">
                    <img src="${ path }/resources//images/notice/image 69.png" alt="">
                </span>         
                <span>
                    <span class="nt_color">Pet</span>kage  공지사항
                </span>
                <span style="margin-left: 150px;">
                	<c:if test="${ empty loginMember || loginMember.memberRole != 'ROLE_ADMIN' }">
                		<span class="btn opacity-0" style="cursor: default; width: 120px;"></span>
                	</c:if>
                	<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
                    	<button onclick="location.href='${ path }/notice/noticeWrite" class="b-btn">글쓰기</button>
                    </c:if>
                </span>
            </div>
            <div class="nt_inner">
                <img src="${ path }/resources//images/notice/Rectangle 2051.png" id="nt_pic">
                <div class="nt_text">
                    <span style="color: white">전체</span>
                    <span class="nt_color">10</span>
                </div>
            </div>

            <table class="table" style="margin: 0;">
                <thead>
                <tr>
                    <th style="width: 40px; text-align: center;">NO</th>
                    <th style="width: 550px; text-align: center;">제목</th>
                    <th style="width: 120px; text-align: center;">작성일</th>
                    <th style="width: 60px; text-align: center;">보기</th>
                </tr>
                </thead>
            </table>
			
			<c:if test="${ empty list }">
			<div style="text-align: center; font-size: 1.5em;">
				<br><br>
				조회된 공지사항이 없습니다.			
			</div>
			</c:if>
			
			<c:if test="${ not empty list }">
				<c:forEach var="notice" items="${ list }">
				
                <div id="accordion" class="accordion">
                	<div class="card-header collapsed" data-toggle="collapse" href="#collapse${ notice.no }">
                    <div>
                        <span class="nt_no">${ notice.no }</span>
                        <span class="nt_title">${ notice.title }</span>
	                    <c:if test="${ empty loginMember || loginMember.memberRole != 'ROLE_ADMIN' }">
	                    	<span class="btn opacity-0" style="cursor: pointer; width: 105px;"></span>
	                    </c:if>
                        <c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
	                        <span class="nt_ud">수정</span>
	                        <span class="nt_ud">삭제</span>
	                    </c:if>
                        <span class="nt_date">${ notice.createDate }</span>
                        <span id="down" style="display: inline-block; width: 55px; text-align: right;"><i class="icon-angle-down down"></i></span>
                    </div>
                </div>
                <div style="background-color: #ffeddb;">
                    <div id="collapse${ notice.no }" class="card-body collapse" data-parent="#accordion" >
                        <p class="nt_content">
                        	${ notice.content }
                        </p>
                    </div>
                </div>
                </div>
                
                </c:forEach>
        	</c:if>

		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/notice/noticeList?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/notice/noticeList?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<button disabled>${ status.current }</button>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<button onclick="location.href='${ path }/notice/noticeList?page=${ status.current }'">${ status.current }</button>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/notice/noticeList?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/notice/noticeList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
		
	</div>

    </section>
    
    <br>
    
    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
</body>
<<jsp:include page="/WEB-INF/views/common/footer.jsp" />