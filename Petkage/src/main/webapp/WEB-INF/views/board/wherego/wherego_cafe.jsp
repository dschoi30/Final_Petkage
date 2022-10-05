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
    <link rel="stylesheet" href="${ path }/resources/css/board/wherego/wherego_cafe.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- 제이쿼리 datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
</head>

<body>

    <section class="wg_6">
        <div class="wg_top" id="wg_top">
            <div class="wg_title">
                <img src="${ path }/resources/images/wherego/카페.png" alt="">
                <p>카페</p>
            </div>
            <div class="ht_search2">
                <form class="ht_12">
                    <div class="ht_22">
                        <select name="" id="" required>
                            <option disabled selected>지역선택</option>
                            <option>서울</option>
                            <option>부산</option>
                            <option>제주</option>
                            <option>경기</option>
                            <option>인천</option>
                            <option>강원</option>
                            <option>경상</option>
                            <option>전라</option>
                            <option>충청</option>
                        </select>
                    </div>
                    <div class="ht_22_btn">
                        <button type="submit">검색</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="wg6_map">
            <div id="map"></div>
        </div>
        <div class="wg6_mid">
            <div class="wg6_line"></div>
            <div class="wg6_sel">
                <select name="" id="">
                    <option value="">추천순</option>
                    <option value="">별점순</option>
                </select>
            </div>
        </div>
        <div class="wg6_bottom">
            <div class="wg6b_ca">
                <div class="wgc6_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카페1.png">
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
            </div>
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
        </div>


    </section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>