<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wherego_main</title>
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_cafe.css?ver=9">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!-- 카카오 맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	25029489670655943df197a370a5aa89&libraries=services"></script>	

    <!-- 제이쿼리 datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
</head>

<body>
<form action="" id="formobj">
    <section class="wg_6">
        <div class="wg_top" id="wg_top">
            <div class="wg_title">
                <img src="${ path }/resources/images/wherego/카페.png" alt="">
                <p>카페</p>
            </div>
             <div class="ht_search2">
                    <div class="ht_22">
	                        <select name="location_filter" id="location_select" required>
	                            <option  class="opt_location"  value="서울" selected="selected">서울</option>
	                            <option  class="opt_location"  value="부산">부산</option>
	                            <option  class="opt_location"  value="제주">제주</option>
	                            <option  class="opt_location"  value="경기">경기</option>
	                            <option  class="opt_location"  value="인천">인천</option>
	                            <option  class="opt_location"  value="강원">강원</option>
	                            <option  class="opt_location"  value="경상">경상</option>
	                            <option  class="opt_location"  value="전라">전라</option>
	                            <option  class="opt_location"  value="충청">충청</option>
	                        </select>
                    </div>
                    <div class="ht_22_btn">
                        <button type="submit" id="location_search">검색</button>
                    </div>
            	</div>
        </div>
        <div class="wg6_map">
            <div id="map" style="width: 100%; height: 350px; margin-top: 20px; margin-bottom: 20px;"></div>
        </div>
        <div class="wg6_mid">
            <div class="wg6_line"></div>
            <div class="wg6_sel">
                <select name="" id="opt_filter" >
                   	<option value="추천순" class="of_opt" selected="selected">추천순</option>
                   	<option value="별점순" class="of_opt">별점순</option>
                </select>
            </div>
        </div>
        <div class="wg6_bottom">
            <div class="wg6b_ca">
                <c:forEach var="cafeselect" items="${ cafeselect }">
                <c:set var="rename_wherego" value="${ cafeselect.renameImg }" />
                <div class="wgc6_card">
	                <a href="${ path }/wherego/wherego_cafe_detail?no=${ cafeselect.spotNo }">
	                    <div class="card_img" value="${ cafeselect.renameImg }">
	                        <img src="${ path }/resources/upload/wherego/${ fn:substring(rename_wherego,0,21) }" alt=""/>
	                    </div>
	                    <div class="card_text">
	                        <div class="ct_1">${cafeselect.spotName}</div>
	                        <div class="ct_2">4.8점</div>
	                        <div class="ct_3">
	                            <p>수리남 / 도보 148일 18시간</p>
	                            <p>${cafeselect.spotSize}</p>
	                        </div>
	                    </div>
	                </a>
                </div>
                <!--  
                <div class="wgc6_card">
	                <a href="${ path }/cafedetail">
	                    <div class="card_img">
	                        <img src="${ path }/resources/images/wherego/${cafeselect.img}">
	                    </div>
	                    <div class="card_text">
	                        <div class="ct_1">${cafeselect.spotName}</div>
	                        <div class="ct_2">4.8점</div>
	                        <div class="ct_3">
	                            <p>수리남 / 도보 148일 18시간</p>
	                            <p>${cafeselect.spotSize}</p>
	                        </div>
	                    </div>
	                </a>
                </div>
                -->
             <!-- 
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페2.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
               -->
            </c:forEach>   
            </div>
            <!--  
            <div class="wg6b_ca">
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페3.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페4.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wg6b_ca">
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페5.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페6.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wg6b_ca">
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페7.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페8.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wg6b_ca">
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페2.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페6.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">KH Cafe</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>수리남 / 도보 148일 18시간</p>
                            <p>소형견 / 대형견</p>
                        </div>
                    </div>
                </div>
            </div>
            -->
        </div>


    </section>
</form>    
        <script>

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.520277, 127.122590), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 
	
     // 마커를 표시할 위치와 title 객체 배열입니다 
        var positions = [
            {
                title: '카카오', 
                latlng: new kakao.maps.LatLng(37.520277, 127.122590)
            },
            {
                title: '생태연못', 
                latlng: new kakao.maps.LatLng(37.528384, 127.123590)
            },
            {
                title: '텃밭', 
                latlng: new kakao.maps.LatLng(37.520782, 127.124590)
            },
            {
                title: '근린공원',
                latlng: new kakao.maps.LatLng(37.525895, 127.125590)
            }
        ];
            
        for (var i = 0; i < positions.length; i ++) {
        	overlayMarker(positions[i]);
        }
        
        function overlayMarker(place){
            // 마커 이미지의 이미지 주소입니다
            var imageSrc = "https://cdn-icons-png.flaticon.com/128/2171/2171990.png"; 
            
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(30, 30); 
            
            // 마커 이미지를 생성합니다    
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
            
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                image : markerImage // 마커 이미지 
            });
            
         	// 마커 위에 커스텀오버레이를 표시합니다
        	var overlay = new kakao.maps.CustomOverlay({
        		yAnchor:2.2,
        	    position: marker.getPosition()       
        	});
        	
        	var content = document.createElement('div');
        		content.classList.add('mapOverlay');
        		content.innerHTML =  positions[i].title	
            
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
               
    </script>
    
      <!-- 카테고리  --> 
    <script type="text/javascript">
    
    $(document).ready(function() {
	   var location = '';
	   var opt_link = '${opt_link}';

	    $(function() {
	        var locationButton = $('#location_search');
	
	        locationButton.click(function() {
	        	
	        	var location = $('#location_filter').val();
	        	
	            const formElement = $('#formobj');
	            formElement.attr("action", "${path}/wherego/cafe_category?location_filter="+ location + "&opt=" + opt_link);
	            formElement.attr("method", "get");
	            formElement.submit();
	        })
	    });
	    
	    var opt_location = $('.opt_location').length
	    
	    for (var i = 0; i < opt_location; i++) {
	    	if($($($('.opt_location')[i])).val() == '${location}') {
	    		$('.opt_location').removeClass('selected')
	    		$($($('.opt_location')[i])).attr("selected","selected")
			location = $($($('.opt_location')[i])).val();
		    	break;
	    	}
		
		};
		
		
		$("#opt_filter").change(function(){
            	var opt_link = $(this).val(); 
           	console.log(location)
           	
			// 변경된 값으로 비교 후 alert 표출
            console.log($(this).val());
            if($(this).val() == "추천순"){
                window.location.href="${path}"+"/wherego/cafe_category?opt=" + opt_link + "&location_filter="+ location;
            } else if($(this).val() == "별점순"){
            	window.location.href="${path}"+"/wherego/cafe_category?opt=" + opt_link + "&location_filter="+ location;
            } 
        });
			    
	    
	}); 
    
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>