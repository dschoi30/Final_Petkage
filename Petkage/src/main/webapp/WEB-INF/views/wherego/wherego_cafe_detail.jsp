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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_cafe_detail.css?ver=4">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	25029489670655943df197a370a5aa89&libraries=services"></script>
	
    <!-- fontawesome -->
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

    <!-- 제이쿼리 datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
</head>

<body>

    <section class="wg_7">
        <div class="wg5_top">
            <div class="wg5t_1">
                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper2">
                    <div class="swiper-wrapper">
                    <c:forEach items="${imgList}" var="imgList">
                        <div class="swiper-slide filst">
                            <img src="${ path }/resources/upload/wherego/${imgList}"/>
                        </div>
 					</c:forEach>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
    				<c:forEach items="${imgList}" var="imgList">
                        <div class="swiper-slide second">
                            <img src="${ path }/resources/upload/wherego/${imgList}"/>
                        </div>
 					</c:forEach>
                    </div>
                </div>
            </div>
            <div class="wg5t_2">
                <div class="wg5t2_name">
                    ${wherego.spotName}
                    <div>
                        <span id = heart><i class="fa fa-heart-o" aria-hidden="true" ></i> </span>
                    </div>
                </div>
                <div class="wg5t2_score">
                    4.8 점
                </div>
                <div class="wg5t2_address">
                    ${wherego.spotAddress}
                </div>
                <div class="wg5t2_option">
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/무선인터넷.png" alt="">
                        <p>무선인터넷</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/소형견.png" alt="">
                        <p>소형견</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/대형견.png" alt="">
                        <p>대형견</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/주차.png" alt="">
                        <p>무료주차</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/단체석.png" alt="">
                        <p>단체석</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/마당.png" alt="">
                        <p>마당</p>
                    </div>
                </div>
                <div class="wg5t2_info">
                   	${wherego.introduce}
                </div>
            </div>    
        </div>

        <div class="wg5_bottom">
            <div class="wg5b_btn">
                <section>
                    <div id="wg5b_tab_02" class="btnBox active">
                        <div class="textItem">
                            <p class="text">정보</p>
                        </div>
                    </div>
                    <div id="wg5b_tab_03" class="btnBox">
                        <div class="textItem">
                            <p class="text">리뷰</p>
                        </div>
                    </div>
                </section>
            </div>
            <div class="wg5b_content">
                <div id="wg5bc_2" class="content_container content_container_01 active">
                    <details class="wg5bc_inf" open>
                        <summary class="wg5bci_1">기본 정보</summary>
                        <div class="wg5bci_content">
                           ${wherego.info}
                        </div>
                    </details>
                    <details class="wg5bc_inf" open>
                        <summary class="wg5bci_1">지도</summary>
                        <div class="wg5bci_content">
                            <div id="map" style="width: 100%; height: 300px;"></div> <!-- 지도 -->
                            <div class="hAddr">
                                <span class="title">현재 위치 :</span>&nbsp;
                                <span id="centerAddr"></span>
                            </div>
                        </div>
                    </details>
                    <details class="wg5bc_inf" open>
                        <summary class="wg5bci_1">메뉴</summary>
                        <div class="wg5bci_content">
                            <h5>커피</h5>
                            <ul>
                                <li>아메리카노 - 5,000원</li>
                                <li>카페라떼 - 1,000원</li>
                                <li>바닐라라떼 - 500원</li>
                            </ul>
                            <h5>음료</h5>
                            <ul>
                                <li>허브차 - 10,000원</li>
                                <li>초코라떼 - 300원</li>
                                <li>망고주스 - 7,500원</li>
                                <li>딸기스무디 - 8,500원</li>
                                <li>댕댕이스무디 - 7,000원</li>
                                <li>고양이스무디 - 7,000원</li>
                            </ul>
                            <h5>댕댕이 식사</h5>
                            <ul>
                                <li>교토식 개마카세 - 1犬 105,000원</li>
                                <li>최고급 사료(소고기) - 7,000원</li>
                                <li>최고급 사료(연어) - 7,000원</li>
                            </ul>
                        </div>
                    </details>
                </div>
            </div>    
            <div class="wg5b_content">
                <div id="wg5bc_3" class="content_container content_container_01">
                    <div class="wg5nc_ts">
                        <div class="wg5nc_text">별점</div>
                        <div class="wg5nc_star">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/빈별.png" alt="">
                            <div class="wg5nc_sscore">
                                ${wherego.score}
                            </div>
                        </div>
                        <div class="wg5nc_review">
                            <a href="">전체 리뷰 <span>(67)</span></a>
                        </div>
                    </div>
                    <div class="wg5nc_tr">
                        <div class="wg5nc_name">
                            <p>김창식</p>
                        </div>
                        <div class="wg5nc_star">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/빈별.png" alt="">
                        </div>
                        <div class="wg5nc_review">
                            나쁘지 않습니다. <br>
                            여러모로 괜찮아요~ <br>
                            어쩌구 저쩌굽니다~ 직원분들 친절해요 :) <br>
                            재방문 의사는 없습니다~ <br>
                        </div>
                        <div class="wg5nc_image">
                            <div class="wg5nc_images">
                                <img src="${ path }/resources/images/wherego/배경9.png" alt="">
                                <img src="${ path }/resources/images/wherego/배경6.png" alt="">
                                <img src="${ path }/resources/images/wherego/배경8.png" alt="">
                            </div>
                            <div class="wgc7l_write_time">
                                <p>9월 20일 작성</p>
                            </div>
                        </div>
                    </div>
                    <div class="wg5nc_tr">
                        <div class="wg5nc_name">
                            <p>김창식</p>
                        </div>
                        <div class="wg5nc_star">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/빈별.png" alt="">
                        </div>
                        <div class="wg5nc_review">
                            나쁘지 않습니다. <br>
                            여러모로 괜찮아요~ <br>
                            어쩌구 저쩌굽니다~ 직원분들 친절해요 :) <br>
                            재방문 의사는 없습니다~ <br>
                        </div>
                        <div class="wg5nc_image">
                            <div class="wg5nc_images">
                                <img src="${ path }/resources/images/wherego/배경9.png" alt="">
                                <img src="${ path }/resources/images/wherego/배경6.png" alt="">
                                <img src="${ path }/resources/images/wherego/배경8.png" alt="">
                            </div>
                            <div class="wgc7l_write_time">
                                <p>9월 20일 작성</p>
                            </div>
                        </div>
                    </div>
                    <div class="wg5nc_tr">
                        <div class="wg5nc_name">
                            <p>김창식</p>
                        </div>
                        <div class="wg5nc_star">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/별.png" alt="">
                            <img src="${ path }/resources/images/wherego/빈별.png" alt="">
                        </div>
                        <div class="wg5nc_review">
                            나쁘지 않습니다. <br>
                            여러모로 괜찮아요~ <br>
                            어쩌구 저쩌굽니다~ 직원분들 친절해요 :) <br>
                            재방문 의사는 없습니다~ <br>
                        </div>
                        <div class="wg5nc_image">
                            <div class="wg5nc_images">
                                <img src="${ path }/resources/images/wherego/배경9.png" alt="">
                                <img src="${ path }/resources/images/wherego/배경6.png" alt="">
                                <img src="${ path }/resources/images/wherego/배경8.png" alt="">
                            </div>
                            <div class="wgc7l_write_time">
                                <p>9월 20일 작성</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
        </div>

        <script>
            jQuery(document).ready(function ($) {
        
                var btnAll = $('.wg_7 .wg5_bottom .wg5b_btn section .btnBox');
                var tabAll = $('.wg5b_content .content_container');

                // 숙소정보
                $('#wg5b_tab_02').click(function () {
                    if ($(this).hasClass('active') === false) {
                        // 초기화
                        btnAll.removeClass('active');
                        tabAll.removeClass('active');
                        // 활성화
                        $(this).addClass('active');
                        $('#wg5bc_2').addClass('active');
                    }
                });

                // 리뷰
                $('#wg5b_tab_03').click(function () {
                    if ($(this).hasClass('active') === false) {
                        // 초기화
                        btnAll.removeClass('active');
                        tabAll.removeClass('active');
                        // 활성화
                        $(this).addClass('active');
                        $('#wg5bc_3').addClass('active');
                    }
                });

            });
        </script>
        
    </section>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper(".mySwiper", {
        loop: true,
        spaceBetween: 10,
        slidesPerView: 4,
        freeMode: true,
        watchSlidesProgress: true,
    });
    var swiper2 = new Swiper(".mySwiper2", {
        loop: true,
        spaceBetween: 10,
        navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
        },
        thumbs: {
        swiper: swiper,
        },
    });
    </script>

   <!--  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=334344dce2f2aee24efdae6872bcd47a"></script> -->
    <script>
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng("${wherego.spotMapX}","${wherego.spotMapY}"), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
    
        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 
	
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

	    var imageSrc = 'https://cdn-icons-png.flaticon.com/128/2171/2171990.png', // 마커이미지의 주소입니다    
	        imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
	        imageOption = {offset: new kakao.maps.Point(10, 10)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	          
	    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	        markerPosition = new kakao.maps.LatLng("${wherego.spotMapX}","${wherego.spotMapY}"); // 마커가 표시될 위치입니다
	
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: markerPosition, 
	        image: markerImage // 마커이미지 설정 
	    });
	
	       	console.log(markerPosition);
	        
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);  

    </script>

    <script>
        // 좋아요 버튼
        $(document).ready(function(){
        	
        	let wherego_like = "${wherego_like}"
        	
        	if(wherego_like > 0) {
        		$("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
 	            $("#heart").addClass("liked");
        	}
        	
        $("#heart").click(function(){
            let spotNo = "${wherego.spotNo}"
	
            let loginmember = "${loginMember}"
            
            if (loginmember != null && loginmember != "") {
            
	            if($("#heart").hasClass("liked")){
	                
	    		$.ajax({
	    			url : "${path}/wherego/wherego_like",
	    			type : "POST",
	    			data : {'spotNo': spotNo},
	    			success : function(data) {
						alert("찜삭제 :(");
					},
					error : function () {
						alert("안타깝지만 실패~");
					}
	    		});
	        	
	    		$("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
	            $("#heart").removeClass("liked");
	            
	            }else{
	            
	        		$.ajax({
	        			url : "${path}/wherego/wherego_like",
	        			type : "POST",
	        			data : {'spotNo': spotNo},
	        			success : function(data) {
							alert("찜하기가 반영되었습니다 :)");
						},
						error : function () {
							alert("안타깝지만 실패~");
						}
	        		});
	        
	            $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
	            $("#heart").addClass("liked");
	        	
	            }
            } else {
            	alert("로그인이 필요합니다 :)");
            	location.href="${path}/member/loginPage"
            }
        });
        });
        
  
    </script>
    
    <script>
    
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>