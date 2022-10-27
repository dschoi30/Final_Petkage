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
<title>Insert title here</title>

	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <!-- css 스타일 -->
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_nav.css">
</head>
<body>
	<section class="mp-1">
        <div class="container">
        <p style="width: 1110px; height: 109px; font-size: 32px; font-weight: 700; font-family: 'GmarketSansMedium'; line-height: 100%; padding-top: 30px; text-align: center; color: rgba(227, 183, 160, 1);">My PetKage</p>
            <nav id="topMenu">
                <ul class="main-nav">
	                <li class="mypage"><a href="${ path }/mypage/myPage_orderList">주문 내역</a></li>
	                <li class="mypage"><a href="${ path }/mypage/myPage_calendar">캘린더</a></li>
	                <li class="mypage"><a href="${ path }/mypage/myPage_heart">찜 목록</a></li>
	                <li class="mypage"><a href="${ path }/mypage/myPage_wroteReviews">리뷰 조회</a></li>
	                <li class="mypage"><a href="${ path }/mypage/myPage_userModify">회원정보수정</a></li>
            	</ul>
        	</nav>
        </div>
    </section>
</body>
</html>