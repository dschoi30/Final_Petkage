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
	<!-- Footer CSS -->
    <link rel="stylesheet" href="${ path }/resources/css/common/footer.css" />
    
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<section class="ft">
        <div class="footer_container">
            <footer class="footer_section1">
                <div class="footer">
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
                            <img src="${ path }/resources/images/Instagram.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="${ path }/resources/images/Facebook.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="${ path }/resources/images/youtube.png" alt="" class="footericon">
                        </a>
                        <a href="/" class="">
                            <img src="${ path }/resources/images/kakaotalk.png" alt="" class="footericon">
                        </a>
                    </div>

                    <img src="${ path }/resources/images/Pet.png" alt="" class="footerLogo">
                </div>
            </footer>
        </div>
    </section>
</body>
</html>