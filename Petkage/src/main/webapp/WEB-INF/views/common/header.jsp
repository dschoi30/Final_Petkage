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
<title>Petkage</title>
	<!-- Header CSS -->
    <link rel="stylesheet" href="${ path }/resources/css/common/header.css" />
    	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <!-- Product CSS-->
    <link rel="stylesheet" href="${ path }/resources/css/market/product.css">
    
</head>
<body>
	<section class="hd">
        <div class="header_container">
            <header class="d-flex flex-wrap mb-4">
                <a href="${ path }" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                    <img src="${ path }/resources/images/common/Petkage_Logo3.png" alt="" class="headerLogo">
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item header_item"><a href="${ path }/main" class="nav-link header_link">어디가지</a></li>
                    <li class="nav-item header_item"><a href="${ path }/market/product-list" class="nav-link header_link">마켓</a></li>
                    <li class="nav-item header_item"><a href="${ path }/tools/toolsMain" class="nav-link header_link">펫키지 툴즈</a></li>
                    <c:if test="${ empty loginMember }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/enroll'" value="회원가입">
	                    <input type="submit" class="headerBtn" id="loginBtn" onclick="location.href='${ path }/member/loginPage';" value="로그인">
					</c:if>
					
					<c:if test="${ (not empty loginMember) && loginMember.memberRole == 'ROLE_USER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/myPage'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.replace('${ path }/member/logout')" value="로그아웃">
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_SELLER' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/member/myPage'" value="마이페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.replace('${ path }/member/logout')" value="로그아웃">
        			</c:if>
        			
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
	                    <input type="button" class="headerBtn" onclick="location.href='${ path }/admin'" value="관리자페이지" >
	                    <input type="button" class="headerBtn" id="loginBtn" onclick="location.replace('${ path }/member/logout')" value="로그아웃">
        			</c:if>
        			
                    <a href="${ path }/market/cart?no=${ loginMember.no }" class="d-flex align-items-center headercart">
                        <img src="${ path }/resources/images/common/Cart.png" alt="" class="cart">
                    </a>
                </ul>
            </header>
        </div>
     </section>
     
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>  
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>