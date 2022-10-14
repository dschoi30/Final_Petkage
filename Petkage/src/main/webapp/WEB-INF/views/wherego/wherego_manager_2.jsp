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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_manager_2.css?ver=3">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25029489670655943df197a370a5aa89"></script>

    <!-- 제이쿼리 datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
</head>

<body>

    <section class="wg_10">
        <form action="">
            <div class="wg5_top">
                <div class="wg5t_1">
                    <div class="wgc7w_upload">
                        <div class="wgc7w_imgbox">
                            <label for="image">
                                <div class="btn-upload">업로드</div>
                            </label>
                            <input type="file" name="image" id="image" multiple>
                            <div id="preview"></div>
                        </div>
                    </div>
                </div>
                <div class="wg5t_2">
                    <div class="wg5t2_name">
                        <input type="text" name="name" placeholder="매장 명" required>
                    </div>
                    <div class="wg5t2_address">
                        <input type="text" name="address" placeholder="매장 주소" required>
                    </div>
					<div class="wg5t2_location">
                        <div class="wg5t2_loca">지역</div>
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
                    <div class="wg5t2_option">
                        <div class="wg5t2_size">크기</div>
                        <div class="wg5t2_breed">
                            <input type="checkbox" name="small" id="small">
                            <label for="small">소형견</label>
                            <input type="checkbox" name="medium" id="medium">
                            <label for="medium">중형견</label>
                            <input type="checkbox" name="large" id="large">
                            <label for="large">대형견</label>
                        </div>
                    </div>
                    <div class="wg5t2_amenities">
                        <div class="wg5t2_amentext">편의시설</div>
                        <div class="wgs_checkbox1">
                            <input type="checkbox" id="internet">
                            <label for="internet">무선 인터넷</label>
                            <input type="checkbox" id="parking">
                            <label for="parking">무료주차</label>
                            <input type="checkbox" id="withpet">
                            <label for="withpet">애견동반</label>
                        </div>
                        <div class="wgs_checkbox2">
                            <input type="checkbox" id="groups">
                            <label for="groups">단체석</label>
                            <input type="checkbox" id="garden">
                            <label for="garden">마당</label>
                        </div>
                    </div>

                    <div class="wg5t2_info">
                        <div class="wg5t2_introduce">
                            <label for="introduce">소개</label>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="introduce" id="exampleFormControlTextarea1" rows="5"></textarea>
                        </div>
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
                    </section>
                </div>
                <div class="wg5b_content">
                    <div id="wg5bc_2" class="content_container content_container_01 active">
                        <details class="wg5bc_inf" open>
                            <summary class="wg5bci_1">기본 정보</summary>
                            <div class="wg5bci_content">
                                <div class="form-group">
                                    <textarea class="form-control" name="information" id="exampleFormControlTextarea1" rows="5"></textarea>
                                </div>
                            </div>
                        </details>
                        <details class="wg5bc_inf" open>
                            <summary class="wg5bci_1">지도</summary>
                            <div class="wg5bci_content">
                                <div id="map"></div> <!-- 지도 -->
                                <div class="hAddr">
                                    <span class="title">좌표 :</span>&nbsp;
                                    <span id="centerAddr"><input type="text" name="Coord" required></span>
                                </div>
                            </div>
                        </details>
                        <details class="wg5bc_inf" open>
                            <summary class="wg5bci_1">메뉴</summary>
                            <div class="wg5bci_content">
                                <div class="form-group">
                                    <textarea class="form-control" name="menu" id="exampleFormControlTextarea1" rows="5"></textarea>
                                </div>
                            </div>
                        </details>
                    </div>
                </div>    
            </div>

            <div class="wg9_btn">
                <input type="submit" value="작성완료">
            </div>
        </form>

        <script>
            jQuery(document).ready(function ($) {
        
                var btnAll = $('.wg_9 .wg5_bottom .wg5b_btn section .btnBox');
                var tabAll = $('.wg_9 .wg5b_content .content_container');
            
            
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

            });
        </script>
        
    </section>

    <script type="text/javascript">
        $(document).ready(function (e){
        $("#image").change(function(e){

            //div 내용 비워주기
            $('#preview').empty();

            var files = e.target.files;
            var arr =Array.prototype.slice.call(files);
            
            //업로드 가능 파일인지 체크
            for(var i=0;i<files.length;i++){
                if(!checkExtension(files[i].name,files[i].size)){
                return false;
                }
            }
            
            preview(arr);
            
            
        });//file change

        function checkExtension(fileName,fileSize){
            var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            var maxSize = 20971520;  //20MB
            
            if(fileSize >= maxSize){
                alert('파일 사이즈 초과');
            $("#image").val("");  //파일 초기화
                return false;
            }
            
            if(regex.test(fileName)){
                alert('업로드 불가능한 파일이 있습니다.');
                $("#image").val("");  //파일 초기화
                return false;
            }
            return true;
        }

        function preview(arr){
            arr.forEach(function(f){

              //파일명이 길면 파일명...으로 처리
            var fileName = f.name;
            if(fileName.length > 10){
                fileName = fileName.substring(0,7)+"...";
            }

              //div에 이미지 추가
            var str = '<div style="display: inline-flex; padding: 10px;"><li>';

              //이미지 파일 미리보기
            if(f.type.match('image.*')){
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                  //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
                str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
                str += '</li></div>';
                $(str).appendTo('#preview');
                } 
                reader.readAsDataURL(f);
            }else{
                str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
                $(str).appendTo('#preview');
            }
            });//arr.forEach
        }
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>