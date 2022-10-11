<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f06691b757909559524f2b0e7ed70e4"></script>
<body>
	<!-- WalkOut_recommend 시작 -->
	<section class="tc">
		<div class="tools_container">

			<!-- 계산기 전체 상단 -->
			<div class="cal_top pr">
				<div class="cal_top_box pr area">
					<div class="cal_Tbg">
						<h3 class="">Tools For MY<span> PET</span></h3>
						<p class="cal_top_h3_line_c"></p>
					</div>
				</div>
			</div>

			<!-- 계산기 메뉴 버튼 -->
			<div class="cal_menu pr">
				<div class="cal_menu_btn">
					<ul>
						<li class='inactive'>
							<a href="${ path }/tools/ageCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/age_off.png"
										alt="나이 계산기" /></span>
								<span class="cal_txt">나이 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/bmiCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/bmi_off.png"
										alt="비만도 계산기" /></span>
								<span class="cal_txt">비만도 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/calorieCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/cal_off.png"
										alt="권장 칼로리" /></span>
								<span class="cal_txt">권장 칼로리</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/foodDictionary">
								<span class="cal_icon"><img src="${ path }/resources/images/dic_off.png"
										alt="식품 사전" /></span>
								<span class="cal_txt">식품 사전</span>
							</a>
						</li>
						<li class='active'>
							<a href="${ path }/tools/walkOutRecommend">
								<span class="cal_icon"><img src="${ path }/resources/images/out_on.png"
										alt="산책코스" /></span>
								<span class="cal_txt">산책코스</span>
							</a>
						</li>
					</ul>
				</div>
			</div>

			<!-- 계산기 컨텐츠 -->
			<div class="cal_content pr">

				<!-- 계산기 정보 박스 -->
				<div class="cal_info_box" id="contents_tab_5">

					<!-- 계산기 정보 작성-->
					<div class="cal_write">
						<div class="content_write">
							<span class="content_write_input write_divline">
								<h5>날씨API</h5>
							</span>
							<span class="content_write_input write_divline">
								<div id="map" style="width:500px;height:400px;"></div>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- WalkOut_recommend 끝 -->
	
	<script src="${ path }/resources/js/calculator.js"></script>
	
	<script type="text/javascript">
	var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
	var options = { // 지도를 생성할 때 필요한 기본 옵션
	    center: new kakao.maps.LatLng(37.519580, 127.093538), // 지도의 중심좌표.
	    level: 3 // 지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
    
    var positions = [
        // 송파구
        {
            title: <div>'GS25한강잠실1호점'</div>, 
            latlng: new kakao.maps.LatLng(37.519580, 127.093538)
        },
        {
        	title: 
        }
   	 ]
	
 	// 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

    for (var i = 0; i < positions.length; i ++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35); 

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지 
        });
    }
	
 	
	
	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />