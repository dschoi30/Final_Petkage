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
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
    <title>wherego_main</title>
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_main.css?ver=9">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>

<body>

    <section class="wg_1">
        <div class="wg_top">
            <div class="wg_title">
                <p>어디가지?</p>
            </div>
            <div class="ht_search2">
                <form class="ht_12" action="search_list_lod">
                    <div class="ht_22">
                        <input type="text" name="all_search">
                        <button type="submit">
                            <img src="${ path }/resources/images/wherego/검색.png" alt="search">
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div id="visual">     
            <div class="on"><a href="#"><img src="${ path }/resources/images/wherego/광고베너.png" alt="1" width="100%" height="100%"></a></div>
            <div><a href="#"><img src="${ path }/resources/images/wherego/광고베너 2.png" alt="2" width="100%" height="100%"></a></div>
            <div><a href="#"><img src="${ path }/resources/images/wherego/광고베너 3.png" alt="3" width="100%" height="100%"></a></div>
            <div><a href="#"><img src="${ path }/resources/images/wherego/광고베너 4.png" alt="4" width="100%" height="100%"></a></div>   
            <section>   
                <div id="left">
                    <span></span>
                    <span></span>
                </div>
                <div id="right">
                    <span></span>
                    <span></span>
                </div>
            </section>
            <section id="control">
                <a class="on" href="#"></a>
                <a href="#"></a>
                <a href="#"></a>
                <a href="#"></a>
            </section>
        </div>

        <div class="wg_cate">
            <div class="wgc_1">
                <div class="wgc_box">
	                <a href="${ path }/wherego/lodging">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/숙소.png" alt="숙소">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>숙소</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/wherego/cafe">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/카페.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>카페</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/wherego/food">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/식당.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>맛집</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/wherego/hair">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/미용.png" alt="">
	                    </div>
	                    <div class="wgcb_text" style="border-right-style: none;">
	                        <p>미용</p>
	                    </div>
	                </a>
                </div>
            </div>

            <div class="wgc_2">
                <div class="wgc_box">
	                <a href="${ path }/wherego/trip">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/여행지.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>여행지</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/wherego/hospital">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/병원.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>동물병원</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/wherego/preschool">
	                    <div class="wgcb_img">
	                        <img src="${ path }/resources/images/wherego/유치원.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>유치원</p>
	                    </div>
	                </a>
                </div>
                <div class="wgc_box">
	                <a href="${ path }/wherego/bath">
	                    <div class="wgcb_img" style="border-right-style: none;">
	                        <img src="${ path }/resources/images/wherego/목욕.png" alt="">
	                    </div>
	                    <div class="wgcb_text">
	                        <p>셀프목욕</p>
	                    </div>
	                </a>
                </div>
            </div>

            <div class="wgc_3">
                <div class="wgc3_img">
                    <img src="${ path }/resources/images/wherego/전문가.png">
                </div>
                <div class="wgc3_text">
                    <div class="wgct_1">
                        <p>펫시터를 찾고 계신가요?</p>
                    </div>
                    <div class="wgct_2">
                        <p>믿고 맡길 수 있는 전문 펫시터 분들 저희가 연결해드릴게요!</p>
                    </div>
                </div>
                <div class="wgc3_btn">
                    <button onclick="location.href='${ path }/wherego/petsitter'"><p>바로가기</p></button>
                </div>
            </div>

            <div class="wgc_4">
                <div class="wgc4_text">
                    <p>갓성비 숙소 추천! 😉</p>
                </div>
                <div class="cardsb">
                <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="wgc4_card">
                                <a href="">
                                    <div class="card_img">
                                        <img src="${ path }/resources/images/wherego/호텔사진1.png">
                                    </div>
                                    <div class="card_text">
                                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                                        <div class="ct_2">1박 ~80,000원</div>
                                    </div>
                                </a>   
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="wgc4_card">
                                <a href="">
                                    <div class="card_img">
                                        <img src="${ path }/resources/images/wherego/호텔사진1.png">
                                    </div>
                                    <div class="card_text">
                                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                                        <div class="ct_2">1박 ~80,000원</div>
                                    </div>
                                </a> 
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="wgc4_card">
                                <a href="">
                                    <div class="card_img">
                                        <img src="${ path }/resources/images/wherego/호텔사진1.png">
                                    </div>
                                    <div class="card_text">
                                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                                        <div class="ct_2">1박 ~80,000원</div>
                                    </div>
                                </a> 
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="wgc4_card">
                                <a href="">
                                    <div class="card_img">
                                        <img src="${ path }/resources/images/wherego/호텔사진1.png">
                                    </div>
                                    <div class="card_text">
                                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                                        <div class="ct_2">1박 ~80,000원</div>
                                    </div>
                                </a> 
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="wgc4_card">
                                <a href="">
                                    <div class="card_img">
                                        <img src="${ path }/resources/images/wherego/호텔사진1.png">
                                    </div>
                                    <div class="card_text">
                                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                                        <div class="ct_2">1박 ~80,000원</div>
                                    </div>
                                </a> 
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="wgc4_card">
                                <a href="">
                                    <div class="card_img">
                                        <img src="${ path }/resources/images/wherego/호텔사진1.png">
                                    </div>
                                    <div class="card_text">
                                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                                        <div class="ct_2">1박 ~80,000원</div>
                                    </div>
                                </a> 
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    
        <div class="wgc_5">
            <div class="wgc5_text">
                <p>추천플레이스 ></p>
            </div>
            <div class="card bg-dark text-white">
                <img src="${ path }/resources/images/wherego/배경1.png" class="card-img" alt="...">
                <div class="card-img-overlay">
                <a href="">
                    <h3 class="card-title">KH cafe</h3>
                    <p class="card-text">[속보] 문인수 선생님 극찬.. "이 집 잘해.."</p>
                </a>
                </div>
            </div>
            <div class="wgc5_rm">
                <div class="wgcm_1">
                    <div class="wgcm_img">
                    <a href="">
                        <img src="${ path }/resources/images/wherego/배경4.png" alt="">
                    </a>
                    </div>
                    <div class="wgcm_text">
                    <a href="">
                        <div class="wgcmt_1">
                            <p>해외 안가도 됨.(근엄)</p>
                        </div>
                        <div class="wgcmt_2">
                            <p>이국적인 느낌 물씬 나는 카페 Best 3!</p>
                        </div>
                    </a>    
                    </div>
                </div>
                <div class="wgcm_2">
                    <div class="wgcm_text">
                    <a href="">
                        <div class="wgcmt_1">
                            <p>해외 안가도 됨.(근엄)</p>
                        </div>
                        <div class="wgcmt_2">
                            <p>이국적인 느낌 물씬 나는 카페 Best 3!</p>
                        </div>
                    </a> 
                    </div>
                    <div class="wgcm_img2">
                    <a href="">
                        <img src="${ path }/resources/images/wherego/배경3.png" alt="">
                    </a>
                    </div>
                </div>
                <div class="wgcm_3">
                    <div class="wgcm_img">
                    <a href="">
                        <img src="${ path }/resources/images/wherego/배경2.png" alt="">
                    </a>
                    </div>
                    <div class="wgcm_text">
                    <a href="">
                        <div class="wgcmt_1">
                            <p>해외 안가도 됨.(근엄)</p>
                        </div>
                        <div class="wgcmt_2">
                            <p>이국적인 느낌 물씬 나는 카페 Best 3!</p>
                        </div>
                    </a> 
                    </div>
                </div>
            </div>
        </div>

        <div class="wgc_6">
            <div class="wgc6_text">
                <p>요즘 많이 찾는 핫플 🔥</p>
            </div>
            <div class="wgc6_cate">
                <section>
                    <div id="wgc6_Icon_01" class="btnBox active">
                        <div class="textItem">
                            <p class="text">숙소</p> 
                        </div>
                    </div>
                    <div id="wgc6_Icon_02" class="btnBox">
                        <div class="textItem">
                            <p class="text">카페</p> 
                        </div>
                    </div>
                    <div id="wgc6_Icon_03" class="btnBox">
                        <div class="textItem">
                            <p class="text">맛집</p> 
                        </div>
                    </div>
                    <div id="wgc6_Icon_04" class="btnBox">
                        <div class="textItem">
                            <p class="text">미용</p> 
                        </div>
                    </div>
                    <div id="wgc6_Icon_05" class="btnBox">
                        <div class="textItem">
                            <p class="text">여행지</p> 
                        </div>
                    </div>
                    <div id="wgc6_Icon_06" class="btnBox">
                        <div class="textItem">
                            <p class="text">셀프목욕</p> 
                        </div>
                    </div>
                </section>
            </div>

            <div class="plogCourseTab_row_02">
                <!-- 숙소 -->
                <div id="plogCourseTab_Info_01" class="content_container content_container_01 active">
                    <div class="wgc6_list">
                        <div class="contentBox">
                            <div class="wgc6l_1">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/금.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_2">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/은.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_3">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/동.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div> 
            </div>

            <div class="plogCourseTab_row_02">
                <!-- 카페 -->
                <div id="plogCourseTab_Info_02" class="content_container content_container_01">
                    <div class="wgc6_list">
                        <div class="contentBox">
                            <div class="wgc6l_1">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/금.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_2">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/은.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_3">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/동.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div> 
            </div>

            <div class="plogCourseTab_row_02">
                <!-- 맛집 -->
                <div id="plogCourseTab_Info_03" class="content_container content_container_01">
                    <div class="wgc6_list">
                        <div class="contentBox">
                            <div class="wgc6l_1">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/금.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_2">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/은.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_3">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/동.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div> 
            </div>

            <div class="plogCourseTab_row_02">
                <!-- 미용 -->
                <div id="plogCourseTab_Info_04" class="content_container content_container_01">
                    <div class="wgc6_list">
                        <div class="contentBox">
                            <div class="wgc6l_1">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/금.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_2">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/은.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_3">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/동.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div> 
            </div>

            <div class="plogCourseTab_row_02">
                <!-- 여행지 -->
                <div id="plogCourseTab_Info_05" class="content_container content_container_01">
                    <div class="wgc6_list">
                        <div class="contentBox">
                            <div class="wgc6l_1">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/금.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_2">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/은.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_3">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/동.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div> 
            </div>

            <div class="plogCourseTab_row_02">
                <!-- 셀프목욕 -->
                <div id="plogCourseTab_Info_06" class="content_container content_container_01">
                    <div class="wgc6_list">
                        <div class="contentBox">
                            <div class="wgc6l_1">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/금.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_2">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/은.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wgc6l_3">
                                <div class="wgc6l_icon">
                                    <img src="${ path }/resources/images/wherego/동.png" alt="">
                                </div>
                                <div class="wgc6l_img">
                                    <img src="${ path }/resources/images/wherego/배경5.png" alt="">
                                </div>
                                <div class="wgc6l_text">
                                    <div class="wgc6lt_1">
                                        <p>경기 가평군</p>
                                    </div>
                                    <div class="wgc6lt_2">
                                        <p>가평 멍벨리펜션(애견동반)</p>
                                    </div>
                                </div>
                                <div class="wgc6l_score">
                                    <div class="wgc6ls_icon">
                                        <img src="${ path }/resources/images/wherego/star.png" alt="">
                                    </div>
                                    <div class="wgc6ls_score">
                                        <p>4.9점</p>
                                    </div>
                                    <div class="wgc6ls_coment">
                                        <p>(25)</p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div> 
            </div>

        </div>

        <script>
        jQuery(document).ready(function ($) {
    
            var btnAll = $('.wg_1 .wgc_6 .wgc6_cate section .btnBox');
            var tabAll = $('.plogCourseTab_row_02 .content_container');
        
        
            // 숙소
            $('#wgc6_Icon_01').click(function () {
                if ($(this).hasClass('active') === false) {
                    // 초기화
                    btnAll.removeClass('active');
                    tabAll.removeClass('active');
                    // 활성화
                    $(this).addClass('active');
                    $('#plogCourseTab_Info_01').addClass('active');
                }
            });
        
            // 카페
            $('#wgc6_Icon_02').click(function () {
                if ($(this).hasClass('active') === false) {
                    // 초기화
                    btnAll.removeClass('active');
                    tabAll.removeClass('active');
                    // 활성화
                    $(this).addClass('active');
                    $('#plogCourseTab_Info_02').addClass('active');
                }
            });
            
            // 맛집
            $('#wgc6_Icon_03').click(function () {
                if ($(this).hasClass('active') === false) {
                    // 초기화
                    btnAll.removeClass('active');
                    tabAll.removeClass('active');
                    // 활성화
                    $(this).addClass('active');
                    $('#plogCourseTab_Info_03').addClass('active');
                }
            });
            
            // 미용
            $('#wgc6_Icon_04').click(function () {
                if ($(this).hasClass('active') === false) {
                    // 초기화
                    btnAll.removeClass('active');
                    tabAll.removeClass('active');
                    // 활성화
                    $(this).addClass('active');
                    $('#plogCourseTab_Info_04').addClass('active');
                }
            });
        
            // 여행지
            $('#wgc6_Icon_05').click(function () {
                if ($(this).hasClass('active') === false) {
                    // 초기화
                    btnAll.removeClass('active');
                    tabAll.removeClass('active');
                    // 활성화
                    $(this).addClass('active');
                    $('#plogCourseTab_Info_05').addClass('active');
                }
            });

            // 셀프목욕
            $('#wgc6_Icon_06').click(function () {
                if ($(this).hasClass('active') === false) {
                    // 초기화
                    btnAll.removeClass('active');
                    tabAll.removeClass('active');
                    // 활성화
                    $(this).addClass('active');
                    $('#plogCourseTab_Info_06').addClass('active');
                }
            });
        
        });
        </script>

        <div class="wgc_7">
            <div class="wgc7_text">
                <p>리뷰</p>
            </div>
            <div class="wgc7_rbar">
                <div class="wgc7r_img">
                    <img src="${ path }/resources/images/wherego/리뷰.png">
                </div>
                <div class="wgc7r_text">
                    <div class="wgc7rt_1">
                        <p>리뷰는 다른 집사들에게 도움이 되요!</p>
                    </div>
                </div>
                <div class="wgc7r_btn">
                    <button onclick="location.href='${ path }/review/review_list'"><p>더보기</p></button>
                </div>
            </div>
           
            <div class="wgc7_list">
             	<c:forEach var="review" items="${review}" begin="0" end="2" step="1">
             	<c:set var="rename" value="${ review.revrenameimg }" />
	                <div class="wgc7l_1">
	                    <div class="wgc7l_1_1">
	                        <div class="wgc7l_name">
	                            <p>${review.revtitle}</p>
	                            <div class="wgc7l_nickname">
	                                <p>${review.memname}</p>
	                            </div>
	                        </div>
	                        <div class="wgc7l_img">
	                            <img src="${ path }/resources/uploadFiles/${ fn:substring(rename,0,22) }" alt="">
	                        </div>
	                    </div>
	                    <div class="wgc7l_1_2">
	                        <div class="wgc7l_star">
	                            <c:choose>
	                            	<c:when test ="${review.revscore == 1}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 2}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 3}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 4}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/빈별.png" alt="">
									</c:when>
									<c:when test ="${review.revscore == 5}">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
										<img src="${ path }/resources/images/wherego/별.png" alt="">
									</c:when>
	                            </c:choose>
	                        </div>
	                        <div class="wgc7l_review">
	                            <div class="wgc7l_revcoment">${review.revcoment}</div>
	                            <div class="wgc7l_write_time">
	                                <p><fmt:formatDate value="${review.revdate}" pattern="MM월 dd일"/></p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>    
	        </div>
	    </div>


    </section>

        <!-- 이미지 슬라이드 스크립트 -->
        <script>
            var idx_lgth = $("#visual>div").length;
            var srt = 1;
            var idx = 0;

        $("section>a").click(function(){
            idx = $(this).index();
        srt = idx;
        $(this).addClass('on').siblings().removeClass('on');
        $("#visual>div").eq(idx).addClass('on').siblings().removeClass('on');
        });
            var AutoSlide = setInterval(AutoRun, 3000);

        function AutoRun(){
            srt++;  
            if(srt == idx_lgth){
            srt = 0;  
            }
    $("section>a").eq(srt).addClass('on').siblings().removeClass('on');
    $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
    }

    $("#visual").mouseover(function(){
    clearInterval(AutoSlide);
    $("#right").css({opacity : '1'});
    $("#left").css({opacity : '1'});
    });
    $("#visual").mouseleave(function(){
    AutoSlide = setInterval(AutoRun, 3000);
    $("#right").css({opacity : '0'});
    $("#left").css({opacity : '0'});
    });

    $("#right").click(function(){
    srt++;
    if(srt == idx_lgth){
        srt = 0;   
    } 
    $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on'); $("section>a").eq(srt).addClass('on').siblings().removeClass('on');
    });

    $("#left").click(function(){
    srt--;
    if(srt == -1){
        srt = idx_lgth-1; 
    }
    $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
    $("section>a").eq(srt).addClass('on').siblings().removeClass('on'); 
    });
    </script>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 4,
            spaceBetween: 20,
            freeMode: true,
            pagination: {
            el: ".swiper-pagination",
            clickable: true,
            },
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>