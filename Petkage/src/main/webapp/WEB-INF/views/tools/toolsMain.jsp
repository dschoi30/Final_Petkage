<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/toolsMain.css">
<body>
    <!-- Tools main 시작 -->
    <section class="ts">

        <!-- 툴즈 메인 상단 -->
        <div class="tools_top">
            <div class="tools_top_box">
                <h1 class="tools_title">
                    <span>펫키지 </span>툴즈
                </h1>
                <p>우리 아이를 위한 계산기, 가이드라인 모음</p>
            </div>
        </div>
        
        <p class="tools_top_line"></p>

        <!-- 툴즈 메뉴 -->
        <div class="tools_menu">
            <div class="tools_menu_box">
                <!-- 나이 -->
                <div class="tools_btn tools_age">
                    <h2 class="tools_name">
                        <span>나이</span>
                        <br>
                        계산기
                    </h2>
                    <a href="${ path }/tools/ageCalculator">
                        <button class="tools_go_age">></button>
                    </a>
                </div>

                <!-- 비만도 -->
                <div class="tools_btn tools_bmi">
                    <h2 class="tools_name">
                        <span>비만도</span>
                        <br>
                        계산기
                    </h2>
                    <a href="${ path }/tools/bmiCalculator">
                        <button class="tools_go_bmi">></button>
                    </a>
                </div>

                <!-- 권장 칼로리 -->
                <div class="tools_btn tools_calorie">
                    <h2 class="tools_name">
                        <span>권장칼로리</span>
                        <br>
                        계산기
                    </h2>
                    <a href="${ path }/tools/calorieCalculator">
                        <button class="tools_go_calorie">></button>
                    </a>
                </div>

                <!-- 식품 사전 -->
                <div class="tools_btn tools_dic">
                    <h2 class="tools_name">
                        <span>반려동물식품</span>
                        <br>
                        사전
                    </h2>
                    <a href="${ path }/tools/foodDictionary">
                        <button class="tools_go_dic">></button>
                    </a>
                </div>

                <!-- 산책 추천 -->
                <div class="tools_btn tools_walk">
                    <h2 class="tools_name">
                        <span>산책코스</span>
                        <br>
                        추천
                    </h2>
                    <a href="${ path }/tools/walkOutRecommend">
                        <button class="tools_go_walk">></button>
                    </a>
                </div>
            </div>
        </div>
    </section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />