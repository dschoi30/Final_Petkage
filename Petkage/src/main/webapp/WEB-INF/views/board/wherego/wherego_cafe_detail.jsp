<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wherego_main</title>
    <link rel="stylesheet" href="${ path }/resources/css/board/wherego/wherego_cafe_detail.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25029489670655943df197a370a5aa89"></script>

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
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페1.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페2.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페3.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페4.png" />
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페1.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페2.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페3.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/카페4.png" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="wg5t_2">
                <div class="wg5t2_name">
                    KH 정보 교육원 앞에 있는 거기
                    <div>
                        <span id = heart><i class="fa fa-heart-o" aria-hidden="true" ></i> </span>
                    </div>
                </div>
                <div class="wg5t2_score">
                    4.8  추천해요!
                </div>
                <div class="wg5t2_address">
                    서울 특별시 강남구 테헤란로25길 10
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
                    <p>강남 한가운데 마당 있는 애견 동반 카페</p>
                    <p>강형욱도 인정한 대한민국 NO.1 애견 카페</p>
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
                            <h5>주변 정보</h5>
                            <ul>
                                <li>역삼역 도보 1분</li>
                                <li>선정릉 차량 8분</li>
                                <li>잠원 한강 공원 차량 12분</li>
                            </ul>
                            <h5>기본 정보</h5>
                            <ul>
                                <li>체크인 : 15:00 | 체크아웃 : 12:00</li>
                                <li>22시 이후 체크인 시 호텔 프론트 문의</li>
                                <li>무료 Wi-Fi</li>
                                <li>전 객실 금연 (흡연 적발 시 300,000원 위약금이 발생됩니다)</li>
                                <li>Bath Amenity (치약, 칫솔 무료)</li>
                                <li>주차 가능 (발렛파킹만 가능 / 박 당 10,000원)</li>
                            </ul>
                            <h5>인원 추가 정보</h5>
                            <ul>
                                <li>기준인원 외 추가 시, 1인 33,000원 (만 12세 이상~성인), 만 12세 미만 무료</li>
                                <li>영유아 인원수 포함 / 최대인원 초과 불가</li>
                                <li>반려동물 1마리 (추가금액 없음)</li>
                            </ul>
                        </div>
                    </details>
                    <details class="wg5bc_inf" open>
                        <summary class="wg5bci_1">지도</summary>
                        <div class="wg5bci_content">
                            <div id="map"></div> <!-- 지도 -->
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
                                4.8
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
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션

        center: new kakao.maps.LatLng(37.520277, 127.122590), //지도의 중심좌표.

        level: 5 //지도의 레벨(확대, 축소 정도)
        };
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.520277, 127.122590), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

    </script>

    <script>
        // 좋아요 버튼
        $(document).ready(function(){
        $("#heart").click(function(){
            if($("#heart").hasClass("liked")){
            $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
            $("#heart").removeClass("liked");
            }else{
            $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
            $("#heart").addClass("liked");
            }
        });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>