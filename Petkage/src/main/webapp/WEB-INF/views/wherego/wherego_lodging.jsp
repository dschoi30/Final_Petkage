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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_lodging.css?ver=8">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- 제이쿼리 datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
</head>

<body>
<form action="" id="formobj">
    <section class="wg_4">
        <div class="wg_top" id="wg_top">
            <div class="wg_title">
                <img src="${ path }/resources/images/wherego/숙소.png" alt="">
                <p>숙소</p>
            </div>
            <div class="ht_search2">
                    <div class="ht_22">
	                    <c:if test="${location == null && empty location }">
	                        <select name="location_filter" id="" required>
	                            <option value="서울" selected="selected">서울</option>
	                            <option value="부산">부산</option>
	                            <option value="제주">제주</option>
	                            <option value="경기">경기</option>
	                            <option value="인천">인천</option>
	                            <option value="강원">강원</option>
	                            <option value="경상">경상</option>
	                            <option value="전라">전라</option>
	                            <option value="충청">충청</option>
	                        </select>
	                    </c:if>
	                    <c:if test="${location != null && !empty location }">
	                        <select name="location_filter" id="" required value="">
	                            <option class="opt_location" value="서울" selected="selected">서울</option>
	                            <option class="opt_location" value="부산">부산</option>
	                            <option class="opt_location" value="제주">제주</option>
	                            <option class="opt_location" value="경기">경기</option>
	                            <option class="opt_location" value="인천">인천</option>
	                            <option class="opt_location" value="강원">강원</option>
	                            <option class="opt_location" value="경상">경상</option>
	                            <option class="opt_location" value="전라">전라</option>
	                            <option class="opt_location" value="충청">충청</option>
	                        </select>
	                    </c:if>
                    </div>
                    <div class="ht_22_btn">
                        <button type="submit" id="location_search">검색</button>
                    </div>
            	</div>
        	</div>

        <div class="wg_filter">
        	<input type="hidden" id="filter" name="filter">
            <button id="wgf_btn1" type="submit" class="wgfbtn" value="추천순">추천순</button>
            <button id="wgf_btn2" type="submit" class="wgfbtn" value="별점순">별점순</button>
            <button id="wgf_btn3" type="submit" class="wgfbtn" value="낮은가격">낮은가격</button>
            <button id="wgf_btn4" type="submit" class="wgfbtn" value="높은가격">높은가격</button> 
        </div>

        <div class="wg_content">
            <div class="wg_sidebar">
                    <div class="wgs_main">
                        <div class="wgs_date">
                            <div class="datext">날짜</div>
                            <div class="date-search-wrap">
                                <label for="datepicker1">체크인</label>
                                <input type="text" id="datepicker1"> <br>
                                <label for="datepicker2">체크아웃</label>
                                <input type="text" id="datepicker2">
                            </div>
                        </div>
                        <div class="wgs_option">
                            <div class="optext">상세 조건</div>
                            <div class="opt_btn">
                            	<input type="hidden" name="size_filter" id="size_filter">
                            	<input type="hidden" name="ameni" id="ameni">
                            	<input type="hidden" name="theme" id="theme">
                                <button type="reset" onclick="location.href='${path}/wherego/whergo_lodging'">초기화</button>
                                <button type="submit" id="detail_search">적용</button>
                            </div>
                        </div>    
                        <div class="wgs_opt_1">
                            <div class="wgs_ptext">인원</div>
                            <div class="wgs_pnumber">
                                <input type="button" onclick='count("minus")' value="-">
                                <div id="result">0</div>
                                <input type="button" onclick='count("plus")' value="+">
                            </div>
                        </div>
                        <div class="wgs_opt_1">
                            <div class="wgs_ptext">반려동물</div>
                            <div class="wgs_pnumber">
                                <input type="button" onclick='count2("minus2")' value="-">
                                <div id="result2">0</div>
                                <input type="button" onclick='count2("plus2")' value="+">
                            </div>
                        </div>
                        <div class="wgs_opt_1">
                            <div class="wgs_ptext">견종</div>
                            <div class="wgs_popt">
                                <select id="size_filter" name="size_filter">
                                    <option value="소형견" selected="selected">소형견</option>
                                    <option value="중형견">중형견</option>
                                    <option value="대형견">대형견</option>
                                </select>
                            </div>
                        </div>
                        <div class="wgs_opt_2">
                            <div class="wgs_ptext2">편의시설</div>
                            <div class="wgs_popt2">
                                <div class="wgs_checkbox1">
                                    <input type="checkbox" id="internet" class="ameni" value="무선인터넷">
                                    <label for="internet">무선 인터넷</label>
                                    <input type="checkbox" id="bbq" class="ameni" value="개별바베큐">
                                    <label for="bbq">개별바베큐</label>
                                </div>
                                <div class="wgs_checkbox2">
                                    <input type="checkbox" id="breakfast" class="ameni" value="아침식사">
                                    <label for="breakfast">아침식사</label>
                                    <input type="checkbox" id="parking" class="ameni" value="무료주차">
                                    <label for="parking">무료주차</label>
                                </div>
                                <div class="wgs_checkbox3">
                                    <input type="checkbox" id="karaoke" class="ameni" value="노래방">
                                    <label for="karaoke">노래방</label>
                                    <input type="checkbox" id="spa" class="ameni" value="스파/월풀">
                                    <label for="spa">스파/월풀</label>
                                </div>
                                <div class="wgs_checkbox4">
                                    <input type="checkbox" id="cafe" class="ameni" value="카페">
                                    <label for="cafe">카페</label>
                                    <input type="checkbox" id="swimming" class="ameni" value="수영장">
                                    <label for="swimming">수영장</label>
                                </div>
                            </div>
                        </div>
                        <div class="wgs_opt_2">
                            <div class="wgs_ptext2">테마</div>
                            <div class="wgs_popt2">
                                <div class="wgs_checkbox1">
                                    <input type="checkbox" id="layer" class="theme" value="복층">
                                    <label for="layer">복층</label>
                                    <input type="checkbox" id="detached" class="theme" value="독채"> 
                                    <label for="detached">독채</label>
                                </div>
                                <div class="wgs_checkbox2">
                                    <input type="checkbox" id="hotwater" class="theme" value="온수풀">
                                    <label for="hotwater">온수풀</label>
                                    <input type="checkbox" id="hokangs" class="theme" value="호캉스">
                                    <label for="hokangs">호캉스</label>
                                </div>
                                <div class="wgs_checkbox3">
                                    <input type="checkbox" id="pool" class="theme" value="풀빌라">
                                    <label for="pool">풀빌라</label>
                                    <input type="checkbox" id="glamping" class="theme" value="글램핑">
                                    <label for="glamping">글램핑</label>
                                </div>
                                <div class="wgs_checkbox4">
                                    <input type="checkbox" id="caravan" class="theme" value="카라반">
                                    <label for="caravan">카라반</label>
                                    <input type="checkbox" id="hanok" class="theme" value="한옥">
                                    <label for="hanok">한옥</label>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="wg_content_card">
            	<c:forEach var="lodgingselect" items="${ lodgingselect }">
            	<c:set var="rename_wherego" value="${ lodgingselect.renameImg }" />
                <div class="wgc4_card">
                	<a href="${ path }/wherego/wherego_lodging_detail?no=${ lodgingselect.spotNo }">
	                    <div class="card_img"value="${ lodgingselect.renameImg }">
	                        <img src="${ path }/resources/upload/wherego/${ fn:substring(rename_wherego,0,21) }" alt=""/>
	                    </div>
	                    <div class="card_text">
	                        <div class="ct_1">${lodgingselect.spotName}</div>
	                        <div class="ct_2">4.8점</div>
	                        <div class="ct_3">
	                            <p>${lodgingselect.spotAddress}</p>
	                            <p>${lodgingselect.price}원</p>
	                        </div>
	                    </div>
                    </a>
                </div>
                </c:forEach>
                <%--  
                <div class="wgc4_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카드2.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>강남구 | 역삼역 도보 1분</p>
                            <p>310,000원</p>
                        </div>
                    </div>
                </div>
                <div class="wgc4_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카드3.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>강남구 | 역삼역 도보 1분</p>
                            <p>310,000원</p>
                        </div>
                    </div>
                </div>
                <div class="wgc4_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카드4.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>강남구 | 역삼역 도보 1분</p>
                            <p>310,000원</p>
                        </div>
                    </div>
                </div>
                <div class="wgc4_card">
                    <div class="card_img">
                        <img src="${ path }/resources/images/wherego/카드5.png">
                    </div>
                    <div class="card_text">
                        <div class="ct_1">플로리다 애견 동반 숙소</div>
                        <div class="ct_2">4.8점</div>
                        <div class="ct_3">
                            <p>강남구 | 역삼역 도보 1분</p>
                            <p>310,000원</p>
                        </div>
                    </div>
                </div>
                --%>
            </div>
        </div>

    </section>
  	</form>
    <script>
    $(function() {
        $("#datepicker1,#datepicker2").datepicker({
            dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                 
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 

        });              
        
        $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후) 
    });

    // 숫자 증감 스크립트

    function count(type)  {
    // 결과를 표시할 element
    const resultElement = document.getElementById('result');
    
    // 현재 화면에 표시된 값
    let number = resultElement.innerText;
    
    // 더하기/빼기
    if(type === 'plus') {
        number = parseInt(number) + 1;
    }else if(type === 'minus')  {
        if(number > 0) {
        number = parseInt(number) - 1;
        } else {
            alert('인원을 다시 입력해주세요.');
        }
    }
    
    // 결과 출력
    resultElement.innerText = number;
    }


    function count2(type2)  {
    // 결과를 표시할 element
    const resultElement2 = document.getElementById('result2');
    
    // 현재 화면에 표시된 값
    let number2 = resultElement2.innerText;
    
    // 더하기/빼기
    if(type2 === 'plus2') {
        number2 = parseInt(number2) + 1;
    }else if(type2 === 'minus2')  {
        if(number2 > 0) {
        number2 = parseInt(number2) - 1;
        } else {
            alert('인원을 다시 입력해주세요.');
        }
    }
    
    // 결과 출력
    resultElement2.innerText = number2;
    }
    </script>
    
    <!-- 카테고리  --> 
    <script type="text/javascript">
    
    $(document).ready(function() {
		
    	var location = "";
    	var choice = "";
		
    	
	    $(function() {
	        var joinButton = $('.wgfbtn');
	
	        joinButton.click(function() {
	            $('.wgfbtn').removeClass('active');
	            $(this).addClass('active');
	            $('#filter').attr('value', $(this).val());
	        	
	            choice = $(this).val();
	            location = $('#location_filter').val();
	            
	            console.log(choice);
	            
	            const formElement = $('#formobj');
	            formElement.attr("action", "${path}/wherego/lodging_category?filter="+ choice + "&location_filter=" + location)
	            formElement.attr("method", "get");
	            formElement.submit();
	        })
	    });
	    
	    $(function() {
	        var locationButton = $('#location_search');
	
	        locationButton.click(function() {
	        	
	            location = $('#location_filter').val();
	        	
	            const formElement = $('#formobj');
	            formElemnet.attr("action", "${path}/wherego/lodging_category?location_filter="+ location)
	            formElement.attr("method", "get");
	            formElement.submit();
	        })
	    });
	    
	    var opt_location = $('.opt_location').length
	    
	    for (var i = 0; i < opt_location; i++) {
	    	if($($($('.opt_location')[i])).val() == '${location}') {
	    		$('.opt_location').removeClass('selected')
	    		$($($('.opt_location')[i])).attr("selected","selected")
		    	break;
	    	}
		
		};
			    
	    
	}); 
    
    </script>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>
