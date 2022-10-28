<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<link rel="stylesheet" href="${ path }/resources/css/tools/weather-icons.css">
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
						<div class="content_write walkOut">
							<span class="content_write_input write_divline ">
								<div class="weather_content">
									<!--  <div class="weatherTitle">지금 현재 위치의 날씨는</div> -->
									<div class="wContents" id="weatherIcon">
										<img id="petIcon" src="">
									</div>
									<div class="wContents" id="weatherMain">
										<img id="wIcon" src="">
										<div class="wnames">
											<div class="wName">온도 <span id="temp"></span></div>
											<div class="wName">습도 <span id="humidity"></span></div>
										</div>
									</div>
									<div class="wContents" id="weatherDesc">
										<span class="wName" id="description"></span>
									</div>	
								</div>
							</span>
							<span class="content_write_input write_divline ">
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

	var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
	var options = { // 지도를 생성할 때 필요한 기본 옵션
	    center: new kakao.maps.LatLng(37.519580, 127.093538), // 지도의 중심좌표.
	    level: 3 // 지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
    
    var positions = [
        // 마포구
        {
            title: '<a href="http://kko.to/IW1UcXQFLr" target="_blank" class="maplink">하늘공원 메타세콰이어길', 
            latlng: new kakao.maps.LatLng(37.5663243, 126.8838553)
        },
     	// 도봉구
        {
            title: '<a href="http://kko.to/Qyb4GjSJYV" target="_blank" class="maplink">초안산 생태공원', 
            latlng: new kakao.maps.LatLng(37.647113, 127.045892)
        },
     	// 동작구
        {
            title: '<a href="http://kko.to/buTmnEsgnT" target="_blank" class="maplink">보라매공원 둘레길', 
            latlng: new kakao.maps.LatLng(37.4918982, 126.9192807)
        },
     	// 동대문구
        {
            title: '<a href="http://kko.to/LnObxvOxo7" target="_blank" class="maplink">가을단풍길(송정 제방길)', 
            latlng: new kakao.maps.LatLng(37.553292, 127.066897)
        },
        // 인천
        {
            title: '<a href="http://kko.to/6yXeHwJxhN" target="_blank" class="maplink">송도 달빛 축제공원', 
            latlng: new kakao.maps.LatLng(37.406482, 126.635805)
        },
        // 부산
        {
            title: '<a href="http://kko.to/-JQPikhcK1" target="_blank" class="maplink">부산 시민공원', 
            latlng: new kakao.maps.LatLng(35.168056, 129.057214)
        },
        {
            title: '<a href="http://kko.to/WmkRpq1e4g" target="_blank" class="maplink">동래 읍성지', 
            latlng: new kakao.maps.LatLng(35.209940, 129.090277)
        }

	]
	
    for (var i = 0; i < positions.length; i ++) {
    	overlayMarker(positions[i]);
    }
    
    function overlayMarker(place){
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "${ path }/resources/images/common/running.png"; 

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(35, 35); 

		// 마커 이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    	
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            // position: new kakao.maps.LatLng(place.y, place.x) 
            image: markerImage
        });

    	// 마커 위에 커스텀오버레이를 표시합니다
    	var overlay = new kakao.maps.CustomOverlay({
    		yAnchor:2.2,
    	    position: marker.getPosition()       
    	});
    	
    	var content = document.createElement('div');
    		content.classList.add('mapOverlay');
    		content.innerHTML =  positions[i].title;
        
        var closeBtn = document.createElement('button');
        	closeBtn.classList.add('btnOverlay');
        	closeBtn.innerHTML = 'X';
        	closeBtn.onclick = function () {
        	    overlay.setMap(null);
        	};
        
        	content.appendChild(closeBtn);
        	overlay.setContent(content);

		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
		});
    }
    
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

			function showLocation(event) {

				var latitude = event.coords.latitude;
				var longitude = event.coords.longitude;
				
				let apiKey = "84f768a9f0ee1c1111d29e6c79cdd359"
				let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude 
								+ "&lon=" + longitude 
								+ "&appid=" + apiKey; 

				let options = { method: 'GET' }
				$.ajax(weatherUrl, options).then((response) => {
					console.log(response)
					console.log("현재온도 : "+ (response.main.temp - 273.15).toFixed(1) + ", 현재습도 : "+ response.main.humidity);
					console.log("코드 : "+ response.weather[0].id + ", 날씨 이미지 : "+ response.weather[0].icon);
					console.log("날씨 : "+ response.weather[0].main + ", 상세날씨설명 : "+ response.weather[0].description);
					console.log("나라 : "+ response.sys.country + ", 도시이름 : "+ response.name);

					let icon = response.weather[0].icon
					let iconUrl = "http://openweathermap.org/img/wn/" + icon + "@2x.png"
					let img = document.querySelector("#wIcon");
					let petImg = document.querySelector("#petIcon");

					img.src = iconUrl 
					petImg.src = changePetIcon("\"" + response.weather[0].id + "\"");
					document.querySelector("#temp").textContent = (response.main.temp - 273).toFixed(1) + " ℃" // 현재 온도
					document.querySelector("#humidity").textContent = (response.main.humidity) + " %" // 현재 온도
					document.querySelector("#description").textContent = (wDescEngToKor(response.weather[0].id)) // 현재 날씨
				}).catch((error) => {
					console.log(error)
				})
			}

			kakao.maps.event.addListener(map, 'center_changed', function() {

				// 지도의 중심좌표를 얻어옵니다 
				var latlng = map.getCenter(); 
			
				// 중심좌표의 위도 경도를 변수에 담기
				var latitude = latlng.getLat() 
				var longitude = latlng.getLng()

				let apiKey = "84f768a9f0ee1c1111d29e6c79cdd359"
				let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude 
								+ "&lon=" + longitude 
								+ "&appid=" + apiKey; 

				let options = { method: 'GET' }

				$.ajax(weatherUrl, options).then((response) => {
					console.log(response)
					console.log("현재온도 : "+ (response.main.temp - 273.15).toFixed(1) + ", 현재습도 : "+ response.main.humidity);
					console.log("코드 : "+ response.weather[0].id + ", 날씨 이미지 : "+ response.weather[0].icon);
					console.log("날씨 : "+ response.weather[0].main + ", 상세날씨설명 : "+ response.weather[0].description);
					console.log("나라 : "+ response.sys.country + ", 도시이름 : "+ response.name);

					let icon = response.weather[0].icon
					let iconUrl = "http://openweathermap.org/img/wn/" + icon + "@2x.png"
					let img = document.querySelector("#wIcon");
					let petImg = document.querySelector("#petIcon");

					img.src = iconUrl 
					petImg.src = changePetIcon("\"" + response.weather[0].id + "\"");
					// document.querySelector("#petIcon") = changePetIcon(response.weather[0].id);
					document.querySelector("#temp").textContent = (response.main.temp - 273).toFixed(1) + " ℃" // 현재 온도
					document.querySelector("#humidity").textContent = (response.main.humidity) + " %" // 현재 온도
					document.querySelector("#description").textContent = (wDescEngToKor(response.weather[0].id)) // 현재 날씨
				}).catch((error) => {
					console.log(error)
				}); 
			});

			function showError(event) {
				alert("위치 정보를 얻을 수 없습니다.")
			}

			window.addEventListener('load', () => { 
				if(window.navigator.geolocation) {
					window.navigator.geolocation.getCurrentPosition(showLocation,showError)
				}
			});
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
		console.log("중심좌표 : " + locPosition);
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

	function wDescEngToKor(weatherId) {

		const weatherDescKo = {
				200: '비를 동반한 천둥구름',
				201: '가벼운 비를 동반한 천둥구름',
				202: '폭우를 동반한 천둥구름' ,
				210: '약한 천둥구름' ,
				211: '천둥구름' ,
				212: '강한 천둥구름' ,
				221: '불규칙적 천둥구름' ,
				230: '약한 연무를 동반한 천둥구름' ,
				231: '연무를 동반한 천둥구름' ,
				232: '강한 안개비를 동반한 천둥구름' ,
				300: '가벼운 안개비' ,
				301: '안개비' ,
				302: '강한 안개비' ,
				310: '가벼운 적은비' ,
				311: '적은비' ,
				312: '강한 적은비' ,
				313: '소나기와 안개비' ,
				314: '강한 소나기와 안개비' ,
				321: '소나기' ,
				500: '악한 비' ,
				501: '중간 비' ,
				502: '강한 비' ,
				503: '매우 강한 비' ,
				504: '극심한 비' ,
				511: '우박' ,
				520: '약한 소나기 비' ,
				521: '소나기 비' ,
				522: '강한 소나기 비' ,
				531: '불규칙적 소나기 비' ,
				600: '가벼운 눈' ,
				601: '눈' ,
				602: '강한 눈' ,
				611: '진눈깨비' ,
				612: '소나기 진눈깨비' ,
				615: '약한 비와 눈' ,
				616: '비와 눈' ,
				620: '약한 소나기 눈' ,
				621: '소나기 눈' ,
				622: '강한 소나기 눈' ,
				701: '박무' ,
				711: '연기' ,
				721: '연무' ,
				731: '모래 먼지' ,
				741: '안개' ,
				751: '모래',
				761: '먼지' ,
				762: '화산재' ,
				771: '돌풍' ,
				781: '토네이도' ,
				800: '구름 한 점 없는 맑은 하늘' ,
				801: '약간의 구름이 낀 하늘' ,
				802: '드문드문 구름이 낀 하늘' ,
				803: '구름이 거의 없는 하늘' ,
				804: '구름으로 뒤덮인 흐린 하늘' ,
				900: '토네이도' ,
				901: '태풍' ,
				902: '허리케인' ,
				903: '한랭' ,
				904: '고온' ,
				905: '바람부는' ,
				906: '우박' ,
				951: '바람이 거의 없는' ,
				952: '약한 바람',
				953: '부드러운 바람' ,
				954: '중간 세기 바람' ,
				955: '신선한 바람' ,
				956: '센 바람' ,
				957: '돌풍에 가까운 센 바람' ,
				958: '돌풍' ,
				959: '심각한 돌풍' ,
				960: '폭풍' ,
				961: '강한 폭풍' ,
				962: '허리케인' 
		}

		for (key in weatherDescKo) {
			if(key == weatherId) {
				console.log("value: " + weatherDescKo[key]);
				return weatherDescKo[key];
				break;
			}
		}
	}
	
	function changePetIcon(weatherCode) {
		var code = weatherCode.substr(1, 3);
		var codeXX = weatherCode.substr(1, 1);
		console.log("날씨 코드 : " + code);
		console.log("날씨 한자리 코드 : " + codeXX);

		if (codeXX == 2) {
			petUrl = '${ path }/resources/images/common/w_2XX.png';
		} else if (codeXX == 3 || codeXX == 5 || codeXX == 6) {
			petUrl = '${ path }/resources/images/common/w_3XX.png';
		} else if (codeXX == 7) {
			petUrl = '${ path }/resources/images/common/w_7XX.png';
		} else if (code == 800) {
			petUrl = '${ path }/resources/images/common/w_800.png';
		} else if (code == 801 || code == 802) {
			petUrl = '${ path }/resources/images/common/w_801.2.png';
		} else if (code == 803 || code == 804) {
			petUrl = '${ path }/resources/images/common/w_803.4.png';
		} else if (901 <= code && code <= 906) {
			petUrl = '${ path }/resources/images/common/w_901.6.png';
		} else if (951 <= code && code <= 962) {
			petUrl = '${ path }/resources/images/common/w_951.62.png';
		} 

		return petUrl
	}
	
</script>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />