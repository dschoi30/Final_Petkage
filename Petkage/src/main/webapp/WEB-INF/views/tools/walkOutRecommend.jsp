<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f06691b757909559524f2b0e7ed70e4&libraries=services"></script>
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
								<span class="cal_icon"><img src="${ path }/resources/images/common/age_off.png"
										alt="나이 계산기" /></span>
								<span class="cal_txt">나이 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/bmiCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/bmi_off.png"
										alt="비만도 계산기" /></span>
								<span class="cal_txt">비만도 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/calorieCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/cal_off.png"
										alt="권장 칼로리" /></span>
								<span class="cal_txt">권장 칼로리</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/foodDictionary">
								<span class="cal_icon"><img src="${ path }/resources/images/common/dic_off.png"
										alt="식품 사전" /></span>
								<span class="cal_txt">식품 사전</span>
							</a>
						</li>
						<li class='active'>
							<a href="${ path }/tools/walkOutRecommend">
								<span class="cal_icon"><img src="${ path }/resources/images/common/out_on.png"
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
								<div class="weather_content">
									<div>지금 날씨는</div>
									<div id="weatherIcon"></div>
									<div>
										<div id="temp"></div><br>
										<div id="pty"></div>
									</div>
								</div>
							</span>
							<span class="content_write_input write_divline">
								<div class="map_content">
		                            <div id="map" style="width: 100%; height: 450px;"></div> <!-- 지도 -->
		                            <div class="hAddr">
		                                <span class="title">현재 위치 :</span>&nbsp;
		                                <span id="centerAddr"></span>
		                            </div>
		                        </div>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- WalkOut_recommend 끝 -->
	
	<script type="text/javascript">
	/* 
	 window.onload = function() {
		const xhttp = new XMLHTTPRequest();
		const weatherIcon = document.getElementById("weatherIcon");
		const weatherTemp = document.getElementById("temp");
		const weatherPty = document.getElementById("pty");
		const addToWeather = (weatherDto) => {
			weatherIcon.innerHTML = weatherDto.sky;
			weatherTemp.innerHTML = "현재온도  " + weatherDto.temp + '도'; 
			weatherPty.innerHTML = "강수량  " + weatherDto.pty + '%'; 
		};

		xhttp.addEventListener('readystatechange', (e) => {
			const readyState = e.target.readyState;
			const httpState = e.target.state;

			if (readyState == 4 && httpState == 200) {
				addToWeather(JSON.oarse(e.targe.responseText));
			}
		});
	}
	
	function weather() {
		jQuery.ajax({
			url : "/tools/weather",
			type : "get",
			timeout: 30000,
			contentType: "application/json",
			dataType : "json",
			success : function(data, status, xhr) {

				let dataHeader = data.result.response.header.resultCode;

				if (dataHeader == "00") {
				console.log("success == >");
				console.log(data);
				} else {
				console.log("fail == >");
				console.log(data);               
				}
			},
			error : function(e, status, xhr, data) {
				console.log("error == >");
				console.log(e);
			}
		});
	}
	*/

	var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
	var options = { // 지도를 생성할 때 필요한 기본 옵션
	    center: new kakao.maps.LatLng(37.519580, 127.093538), // 지도의 중심좌표.
	    level: 3 // 지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
    
    var positions = [
        // 마포구
        {
            title: '하늘공원 메타세콰이어길', 
            latlng: new kakao.maps.LatLng(37.5663243, 126.8838553)
        },
     	// 도봉구
        {
            title: '초안산 도봉 둘레길', 
            latlng: new kakao.maps.LatLng(37.6450674, 127.0449737)
        },
     	// 동작구
        {
            title: '보라매공원 둘레길', 
            latlng: new kakao.maps.LatLng(37.4918982, 126.9192807)
        },
     	// 동대문구
        {
            title: '가을단풍길(송정 제방길)', 
            latlng: new kakao.maps.LatLng(37.553292, 127.066897)
        }

   	 ]
	
 	// 마커 이미지의 이미지 주소입니다
    var imageSrc = "${ path }/resources/images/common/running.png"; 

    for (var i = 0; i < positions.length; i ++) {
    	var data = positions[i];
   
        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(33, 33); 

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지 
        });

    	// 마커 위에 커스텀오버레이를 표시합니다
    	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
    	var overlay = new kakao.maps.CustomOverlay({
    		yAnchor:3,
    	    position: marker.getPosition()       
    	});
    	
    	var content = document.createElement('div');
        content.innerHTML =  data.title;
        content.style.cssText = 'background: white; border: 1px solid black';
        
        var closeBtn = document.createElement('button');
        closeBtn.innerHTML = '닫기';
        closeBtn.onclick = function () {
            overlay.setMap(null);
        };
        content.appendChild(closeBtn);
        overlay.setContent(content);

    }
	
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	    overlay.setMap(map);
	});
    
 	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

          });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }
    
	// 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
        infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);


    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function() {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    });

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

            for(var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                }
            }
        }
    }

	
	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />