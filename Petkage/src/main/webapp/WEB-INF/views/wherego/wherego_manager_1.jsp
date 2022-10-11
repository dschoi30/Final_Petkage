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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_manager_1.css?ver=2">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25029489670655943df197a370a5aa89"></script>

    <!-- 제이쿼리 datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
</head>

<body>

    <section class="wg_9">
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
                        <input type="text" name="address" placeholder="호텔 주소" required>
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
                            <input type="checkbox" id="bbq">
                            <label for="bbq">개별바베큐</label>
                            <input type="checkbox" id="breakfast">
                            <label for="breakfast">아침식사</label>
                        </div>
                        <div class="wgs_checkbox2">
                            <input type="checkbox" id="parking">
                            <label for="parking">무료주차</label>
                            <input type="checkbox" id="karaoke">
                            <label for="karaoke">노래방</label>
                            <input type="checkbox" id="spa">
                            <label for="spa">스파/월풀</label>
                        </div>
                        <div class="wgs_checkbox3">
                            <input type="checkbox" id="cafe">
                            <label for="cafe">카페</label>
                            <input type="checkbox" id="swimming">
                            <label for="swimming">수영장</label>
                        </div>
                    </div>
                    <div class="wg5t2_thema">
                        <div class="wg5t2_thematext">테마</div>
                        <div class="wgs_checkbox1">
                            <input type="checkbox" id="layer">
                            <label for="layer">복층</label>
                            <input type="checkbox" id="detached">
                            <label for="detached">독채</label>
                            <input type="checkbox" id="hotwater">
                            <label for="hotwater">온수풀</label>
                        </div>
                        <div class="wgs_checkbox2">
                            <input type="checkbox" id="hokangs">
                            <label for="hokangs">호캉스</label>
                            <input type="checkbox" id="pool">
                            <label for="pool">풀빌라</label>
                            <input type="checkbox" id="glamping">
                            <label for="glamping">글램핑</label>
                        </div>
                        <div class="wgs_checkbox3">
                            <input type="checkbox" id="caravan">
                            <label for="caravan">카라반</label>
                            <input type="checkbox" id="hanok">
                            <label for="hanok">한옥</label>
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

                    <!-- 모달 창 정보 -->
                    <div class="wg5t2_info">
                        <div class="wg5t2_introduce">
                            <label for="information">기본정보</label>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="information" id="exampleFormControlTextarea1" rows="5"></textarea>
                        </div>
                    </div>

                    <div class="wg5t2_info">
                        <div class="wg5t2_introduce">
                            <label for="attre">편의시설</label>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="attre" id="exampleFormControlTextarea1" rows="5"></textarea>
                        </div>
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
                    </section>
                </div>
                <div class="wg5b_content">
                    <div id="wg5bc_1" class="content_container content_container_01 active">
                        <div class="wg5bc_room">
                            <div class="wg5bcr_1">
                                <div class="wgc7w_upload">
                                    <div>
                                        <label for="image_1">
                                            <div class="btn-upload">업로드</div>
                                        </label>
                                        <input type="file" name="image_1" id="image_1" multiple>
                                        <div id="preview"></div>
                                    </div>
                                </div>
                                <div class="wg5bcr_text">
                                    <div class="te1">
                                        <input type="text" name="room_name" required placeholder="룸 이름">
                                    </div>
                                    <div class="te2">
                                        <div class="te2_1">
                                            가격
                                        </div>
                                        <div class="te2_2">
                                            <input type="text" name="room_price" required>
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
                                <div class="wgc7w_upload">
                                    <div>
                                        <label for="image_2">
                                            <div class="btn-upload">업로드</div>
                                        </label>
                                        <input type="file" name="image_2" id="image_2" multiple>
                                        <div id="preview"></div>
                                    </div>
                                </div>
                                <div class="wg5bcr_text">
                                    <div class="te1">
                                        <input type="text" name="room_name" required placeholder="룸 이름">
                                    </div>
                                    <div class="te2">
                                        <div class="te2_1">
                                            가격
                                        </div>
                                        <div class="te2_2">
                                            <input type="text" name="room_price" required>
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
                                <div class="wgc7w_upload">
                                    <div>
                                        <label for="image_3">
                                            <div class="btn-upload">업로드</div>
                                        </label>
                                        <input type="file" name="image_3" id="image_3" multiple>
                                        <div id="preview"></div>
                                    </div>
                                </div>
                                <div class="wg5bcr_text">
                                    <div class="te1">
                                        <input type="text" name="room_name" required placeholder="룸 이름">
                                    </div>
                                    <div class="te2">
                                        <div class="te2_1">
                                            가격
                                        </div>
                                        <div class="te2_2">
                                            <input type="text" name="room_price" required>
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
                                                    <textarea name="moinfo" id="moinfo" cols="30" rows="10"></textarea>
                                                    <hr>
                                                    <p>편의시설</p>
                                                    <textarea name="ameinfo" id="ameinfo" cols="30" rows="10"></textarea>
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
                                <div class="wgc7w_upload">
                                    <div>
                                        <label for="image_4">
                                            <div class="btn-upload">업로드</div>
                                        </label>
                                        <input type="file" name="image_4" id="image_4" multiple>
                                        <div id="preview"></div>
                                    </div>
                                </div>
                                <div class="wg5bcr_text">
                                    <div class="te1">
                                        <input type="text" name="room_name" required placeholder="룸 이름">
                                    </div>
                                    <div class="te2">
                                        <div class="te2_1">
                                            가격
                                        </div>
                                        <div class="te2_2">
                                            <input type="text" name="room_price" required>
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
                                <div class="form-group">
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
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
</html>