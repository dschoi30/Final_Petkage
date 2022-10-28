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
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_main.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	<section class="mpmain">
      <div class="container">
      
    <p class="mypagept" style="width: 1110px; height: 50px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">Petkage를 이용해 주셔서 감사합니다.</p>
    <p class="mypagept2" style="width: 1110px; height: 109px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">${ loginMember.userName }님의 현재 포인트는 <fmt:formatNumber value="${ loginMember.point }" pattern="#,###"/>원입니다.</p>
    <hr> 
    <br>
    <br>           
    </section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>