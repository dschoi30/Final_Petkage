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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_lodging_detail.css?ver=2">
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

    <section class="wg_5">
        <div class="wg5_top">
            <div class="wg5t_1">
                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper2">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경7.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경1.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경2.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경3.png" />
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경7.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경1.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경2.png" />
                        </div>
                        <div class="swiper-slide">
                            <img src="${ path }/resources/images/wherego/배경3.png" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="wg5t_2">
                <div class="wg5t2_name">
                    AC 호텔 바이 메리어트 서울 강남
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
                        <img src="${ path }/resources/images/wherego/바베큐.png" alt="">
                        <p>바베큐</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/조식.png" alt="">
                        <p>조식</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/주차.png" alt="">
                        <p>무료주차</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/노래방.png" alt="">
                        <p>노래방</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/수영장.png" alt="">
                        <p>수영장</p>
                    </div>
                    <div class="wg5t2_icon">
                        <img src="${ path }/resources/images/wherego/스파.png" alt="">
                        <p>스파</p>
                    </div>
                </div>
                <div class="wg5t2_info">
                    <p>반려동물과 함께하는 이국적인 분위기!</p>
                    <p>대중교통 접근성이 좋으며 다양한 편의시설과 시티뷰를 즐겨보세요!</p>
                </div>
            </div>    
        </div>

        <div class="wg5_bottom">
            <div class="wg5b_btn">
                <section>
                    <div id="wg5b_tab_01" class="btnBox active">
                        <div class="textItem">
                            <p class="text">객실안내 / 예약</p>
                        </div>
                    </div>
                    <div id="wg5b_tab_02" class="btnBox">
                        <div class="textItem">
                            <p class="text">숙소정보</p>
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
                <div id="wg5bc_1" class="content_container content_container_01 active">
                    <div class="wg5bc_date">
                        <div class="wg5bc_d">
                            <img src="${ path }/resources/images/wherego/달력.png" alt="">
                            <span>09. 27</span>&nbsp; - &nbsp;<span>09. 28</span>
                        </div>
                    </div>
                    <div class="wg5bc_room">
                        <div class="wg5bcr_1">
                            <div class="wg5bcr_img">
                                <img src="${ path }/resources/images/wherego/침대.png" alt="">
                            </div>
                            <div class="wg5bcr_text">
                                <div class="te1">
                                    스탠다드
                                </div>
                                <div class="te2">
                                    <div class="te2_1">
                                        가격
                                    </div>
                                    <div class="te2_2">
                                        <span>256,000원</span> &nbsp; &nbsp;
                                        <span>199,000원</span>
                                    </div>
                                </div>
                                <div class="te3">
                                    <a data-toggle="modal" href=".modal" id="modala">객실 이용 안내 ></a>
                                    <!-- Vertically centered scrollable modal -->
                                    <div class="modal" tabindex="-1">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                            <h5 class="modal-title">객실 이용 안내</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>기본정보</p>
                                                <ul>
                                                    <li>
                                                        2인 기준 최대 2인
                                                    </li>
                                                    <li>
                                                        더블베드 1개
                                                    </li>
                                                    <li>
                                                        반려동물 베드 1개
                                                    </li>
                                                </ul>
                                                <hr>
                                                <p>편의시설</p>
                                                <ul>
                                                    <li>TV, 블루투스 스피커, 무선 충전기, 티테이블, 옷장, 에어컨, 미니냉장고, 드라이기, 욕실용품, 샤워가운,슬리퍼, 반려동물 식사 그릇</li>
                                                </ul>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="te4">
                                    <button class="te4_btn active">
                                        예약
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="wg5bcr_1">
                            <div class="wg5bcr_img">
                                <img src="${ path }/resources/images/wherego/침대.png" alt="">
                            </div>
                            <div class="wg5bcr_text">
                                <div class="te1">
                                    스탠다드
                                </div>
                                <div class="te2">
                                    <div class="te2_1">
                                        가격
                                    </div>
                                    <div class="te2_2">
                                        <span>256,000원</span> &nbsp; &nbsp;
                                        <span>199,000원</span>
                                    </div>
                                </div>
                                <div class="te3">
                                    <a data-toggle="modal" href=".modal" id="modala">객실 이용 안내 ></a>
                                    <!-- Vertically centered scrollable modal -->
                                    <div class="modal" tabindex="-1">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                            <h5 class="modal-title">객실 이용 안내</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>기본정보</p>
                                                <ul>
                                                    <li>
                                                        2인 기준 최대 2인
                                                    </li>
                                                    <li>
                                                        더블베드 1개
                                                    </li>
                                                    <li>
                                                        반려동물 베드 1개
                                                    </li>
                                                </ul>
                                                <hr>
                                                <p>편의시설</p>
                                                <ul>
                                                    <li>TV, 블루투스 스피커, 무선 충전기, 티테이블, 옷장, 에어컨, 미니냉장고, 드라이기, 욕실용품, 샤워가운,슬리퍼, 반려동물 식사 그릇</li>
                                                </ul>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="te4">
                                    <button class="te4_btn" disabled>
                                        예약마감
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="wg5bcr_1">
                            <div class="wg5bcr_img">
                                <img src="${ path }/resources/images/wherego/침대.png" alt="">
                            </div>
                            <div class="wg5bcr_text">
                                <div class="te1">
                                    스탠다드
                                </div>
                                <div class="te2">
                                    <div class="te2_1">
                                        가격
                                    </div>
                                    <div class="te2_2">
                                        <span>256,000원</span> &nbsp; &nbsp;
                                        <span>199,000원</span>
                                    </div>
                                </div>
                                <div class="te3">
                                    <a data-toggle="modal" href=".modal" id="modala">객실 이용 안내 ></a>
                                    <!-- Vertically centered scrollable modal -->
                                    <div class="modal" tabindex="-1">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                            <h5 class="modal-title">객실 이용 안내</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>기본정보</p>
                                                <ul>
                                                    <li>
                                                        2인 기준 최대 2인
                                                    </li>
                                                    <li>
                                                        더블베드 1개
                                                    </li>
                                                    <li>
                                                        반려동물 베드 1개
                                                    </li>
                                                </ul>
                                                <hr>
                                                <p>편의시설</p>
                                                <ul>
                                                    <li>TV, 블루투스 스피커, 무선 충전기, 티테이블, 옷장, 에어컨, 미니냉장고, 드라이기, 욕실용품, 샤워가운,슬리퍼, 반려동물 식사 그릇</li>
                                                </ul>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="te4">
                                    <button class="te4_btn active">
                                        예약
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
            <div class="wg5b_content">
                <div id="wg5bc_2" class="content_container content_container_01">
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
        
                var btnAll = $('.wg_5 .wg5_bottom .wg5b_btn section .btnBox');
                var tabAll = $('.wg5b_content .content_container');
            
            
                // 객실안내
                $('#wg5b_tab_01').click(function () {
                    if ($(this).hasClass('active') === false) {
                        // 초기화
                        btnAll.removeClass('active');
                        tabAll.removeClass('active');
                        // 활성화
                        $(this).addClass('active');
                        $('#wg5bc_1').addClass('active');
                    }
                });

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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>