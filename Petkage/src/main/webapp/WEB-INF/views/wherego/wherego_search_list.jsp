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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_search_list.css?ver=8">
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

    <section class="wg_13">
        <div class="wg_top">
            <div class="wg_title">
                <p>어디가지?</p>
            </div>
            <div class="ht_search2">
                <form class="ht_12">
                    <div class="ht_22">
                        <input type="text">
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

        <div class="wg6_bottom">
            <div class="wg6b_ca">
                <c:forEach var="cafeselect" items="${cafeselect}">
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
            </c:forEach>  
            </div>
            
            <div class="wgc7l_2">
                <div id="pageBar">
                    <button onclick="location.href='${ path }/review_list?page=${ pageInfo.prevPage }'">&lsaquo;</button>
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                        <c:if test="${ status.current == pageInfo.currentPage }">
                            <button disabled class="checked">${ status.current }</button>
                        </c:if>
                        <c:if test="${ status.current != pageInfo.currentPage }">
                            <button onclick="location.href='${ path }/review_list?page=${ status.current }'">${ status.current }</button>
                        </c:if>
                    </c:forEach>

                    <button onclick="location.href='${ path }/review_list?page=${ pageInfo.nextPage }'">&rsaquo;</button>
                </div>
                <div class="top_link">
                    <a href="#wg_top">▲ TOP</a>
                </div>
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