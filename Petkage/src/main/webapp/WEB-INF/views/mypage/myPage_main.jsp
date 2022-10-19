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
    <p class="mypagept2" style="width: 1110px; height: 109px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">${ loginMember.userName }님의 현재 포인트는 1000p입니다.</p>
    <hr> 
    <br>
    <p class="mypagept2" style="width: 1110px; height: 109px; font-size: 24px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">나의 주문 처리 현황</p>
    <br>
    
    
      <div class="px-5">
        <div class="v26_84">
          <div class="v9_30"></div>
          <div class="v9_67">
            <span class="v9_65">입금전</span>
            <span class="v9_66">0</span>
          </div>
          <div class="v9_68">
            <span class="v9_69">배송 준비중</span>
            <span class="v9_70">0</span>
          </div>
          <div class="v9_74">
            <span class="v9_75">배송중</span>
            <span class="v9_76">0</span>
          </div>
          <div class="v9_77">
            <span class="v9_78">배송 완료</span>
            <span class="v9_79">0</span>
          </div>
          <div class="v9_80">
            <span class="v9_81">취소</span>
            <span class="v9_82">0</span>
          </div>
          <div class="v9_83">
        <span class="v9_84">교환</span>
        <span class="v9_85">0</span>
      </div>
      <div class="v9_88">
        <span class="v9_89">반품</span>
        <span class="v9_90">0</span>
      </div>      
    </div>            
    </section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>