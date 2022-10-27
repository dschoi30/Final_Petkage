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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_manager_1.css?ver=3">
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
        <form action="${ path }/wherego/lodging_write" method="post" enctype="multipart/form-data">
            <div class="wg5_top">
                <div class="wg5t_1">
                    <div class="wgc7w_upload">
                        <div class="wgc7w_imgbox">
                            <label for="image">
                                <div class="btn-upload">업로드</div>
                            </label>
                            <input type="file" name="multiFile" id="image" multiple>
                            <div id="preview"></div>
                        </div>
                    </div>
                </div>
                <div class="wg5t_2">
                    <div class="wg5t2_name">
                        <input type="text" id="spotName" name="spotName" placeholder="매장 명" required>
                    </div>
                    <div class="wg5t2_address">
                        <input type="text" name="spotAddress" placeholder="호텔 주소" required>
                    </div>
      				<div class="wg5t2_location">
                        <div class="wg5t2_loca">지역</div>
                        <select name="spotLocation" id="spotLocation" required>
                            <option disabled selected>지역선택</option>
                            <option value="서울">서울</option>
                            <option value="부산">부산</option>
                            <option value="제주">제주</option>
                            <option value="경기">경기</option>
                            <option value="인천">인천</option>
                            <option value="강원">강원</option>
                            <option value="경상">경상</option>
                            <option value="전라">전라</option>
                            <option value="충청">충청</option>
                        </select>
                    </div>
                    <div class="wg5t2_option">
                        <div class="wg5t2_size">크기</div>
                        <div class="wg5t2_breed">
                            <input type="checkbox" name="spotSize" id="small" value="소형견">
                            <label for="small">소형견</label>
                            <input type="checkbox" name="spotSize" id="medium" value="중형견">
                            <label for="medium">중형견</label>
                            <input type="checkbox" name="spotSize" id="large" value="대형견">
                            <label for="large">대형견</label>
                        </div>
                    </div>
                    <div class="wg5t2_amenities">
                        <div class="wg5t2_amentext">편의시설</div>
                        <div class="wgs_checkbox1">
                            <input type="checkbox" id="internet" name="ameni" value="무선 인터넷">
                            <label for="internet">무선 인터넷</label>
                            <input type="checkbox" id="bbq" name="ameni" value="개별바베큐">
                            <label for="bbq">개별바베큐</label>
                            <input type="checkbox" id="breakfast" name="ameni" value="아침식사">
                            <label for="breakfast">아침식사</label>
                        </div>
                        <div class="wgs_checkbox2">
                            <input type="checkbox" id="parking" name="ameni" value="무료주차">
                            <label for="parking">무료주차</label>
                            <input type="checkbox" id="karaoke" name="ameni" value="노래방">
                            <label for="karaoke">노래방</label>
                            <input type="checkbox" id="spa" name="ameni" value="스파/월풀">
                            <label for="spa">스파/월풀</label>
                        </div>
                        <div class="wgs_checkbox3">
                            <input type="checkbox" id="cafe" name="ameni" value="카페">
                            <label for="cafe">카페</label>
                            <input type="checkbox" id="swimming" name="ameni" value="수영장">
                            <label for="swimming">수영장</label>
                        </div>
                    </div>
                    <div class="wg5t2_thema" >
                        <div class="wg5t2_thematext">테마</div>
                        <div class="wgs_checkbox1">
                            <input type="checkbox" id="layer" name="theme" value="복층">
                            <label for="layer">복층</label>
                            <input type="checkbox" id="detached" name="theme" value="독채">
                            <label for="detached">독채</label>
                            <input type="checkbox" id="hotwater" name="theme" value="온수풀">
                            <label for="hotwater">온수풀</label>
                        </div>
                        <div class="wgs_checkbox2">
                            <input type="checkbox" id="hokangs" name="theme" value="호캉스">
                            <label for="hokangs">호캉스</label>
                            <input type="checkbox" id="pool" name="theme" value="풀빌라">
                            <label for="pool">풀빌라</label>
                            <input type="checkbox" id="glamping" name="theme" value="글램핑">
                            <label for="glamping">글램핑</label>
                        </div>
                        <div class="wgs_checkbox3">
                            <input type="checkbox" id="caravan" name="theme" value="카라반">
                            <label for="caravan">카라반</label>
                            <input type="checkbox" id="hanok" name="theme" value="한옥">
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
                            <div class="wgc7w_upload">
                                <div class="imageBox">
                                    <label for="image_1">
                                        <div class="btn-upload">업로드</div>
                                    </label>
                                    <input type="file" class="files" name="upfile" id="image_1" multiple="multiple">
                                    <div id="preview_1"></div>
                                </div>
                            </div>
                            <div class="wgc7w_add">
                                <div>
                                    <label for="rood_add">
                                        <div class="btn-add">추가</div>
                                    </label>
                                    <button type="button" id="rood_add" class="wgfbtn"></button>
                                </div>
                            </div>
                            <div class="wgc7w_del">
                                <div>
                                    <label for="rood_del">
                                        <div class="btn-del">삭제</div>
                                    </label>
                                    <button type="button" id="rood_del" class="wgfbtn"></button>
                                </div>
                            </div>
                            <div class="wg5bcr_box">
                                <div class="wg5bcr_1" id="room_1" style="height: 100%;">
                                    <input type="hidden" name="roomTypeNo" value="1">
                                    <div class="wg5bcr_text">
                                        <div class="te1">
                                            <input type="text" id="roomName" name="roomName" required placeholder="객실 이름">
                                        </div>
                                        <div class="te2">
                                            <div class="te2_1">
                                                가격
                                            </div>
                                            <div class="te2_2">
                                                <input type="text" name="roomPrice" required>
                                            </div>
                                        </div>

                                        <!-- 모달 창 정보 -->
                                        <div class="wg5t2_info">
                                            <div class="wg5t2_introduce">
                                                <label for="information">기본정보</label>
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" name="mInfo" id="exampleFormControlTextarea1" rows="5"></textarea>
                                            </div>
                                        </div>

                                        <div class="wg5t2_info">
                                            <div class="wg5t2_introduce">
                                                <label for="attre">편의시설</label>
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" name="mAmeni" id="exampleFormControlTextarea1" rows="5"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <input type="hidden" name="roomNum" value="1">
                            
                    </div>
                </div>    
                <div class="wg5b_content">
                    <div id="wg5bc_2" class="content_container content_container_01">
                        <details class="wg5bc_inf" open>
                            <summary class="wg5bci_1">기본 정보</summary>
                            <div class="wg5bci_content">
                                <div class="form-group">
                                    <textarea class="form-control" id="exampleFormControlTextarea1" name="info" rows="5"></textarea>
                                </div>
                            </div>
                        </details>
                        <details class="wg5bc_inf" open>
                            <summary class="wg5bci_1">지도</summary>
                            <div class="wg5bci_content">
                                <div id="map"></div> <!-- 지도 -->
                                <div class="hAddr">
                                    <h5 class="title" >좌표</h5>&nbsp; <br>
                                    <span id="centerAddr">
                                        위도&nbsp;:&nbsp;<input type="text" name="spotMapX" required style="width: 100px;"> <br><br>
                                        경도&nbsp;:&nbsp;<input type="text" name="spotMapY" required style="width: 100px;">           
                                    </span>
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

        
    </section>

    <script>
        $(document).ready(function() {
            
            var i = 2; // 변수 설정은 함수의 바깥에 설정!
            $("#rood_add").click(function() {
                $("[name=roomNum]").attr("value", i);
                console.log("증가 : " + $("[name=roomNum]").attr("value"));
                
                // if(i >= 6){
                //     alert('객실은 최대 5개까지만 추가 가능합니다.');
                //     return false;
                // } else {
                    var html = "<div class='wg5bcr_1' id='room_"+ i + "' style='height: 100%;'>"
                        html += "    <input type='hidden' name='roomTypeNo' value='"+ i +"'>"
                        html += "    <div class='wg5bcr_text'>"
                        html += "        <div class='te1'>"
                        html += "            <input type='text' name='roomName' required placeholder='객실 이름'>"
                        html += "        </div>"
                        html += "        <div class='te2'>"
                        html += "            <div class='te2_1'>"
                        html += "                가격"
                        html += "            </div>"
                        html += "            <div class='te2_2'>"
                        html += "                <input type='text' name='roomPrice' required>"
                        html += "            </div>"
                        html += "        </div>"
                        html += "        <div class='wg5t2_info'>"
                        html += "            <div class='wg5t2_introduce'>"
                        html += "                <label for='information'>기본정보</label>"
                        html += "            </div>"
                        html += "            <div class='form-group'>"
                        html += "                <textarea class='form-control' name='mInfo' id='exampleFormControlTextarea1' rows='5'></textarea>"
                        html += "            </div>"
                        html += "        </div>"
                        html += "        <div class='wg5t2_info'>"
                        html += "            <div class='wg5t2_introduce'>"
                        html += "                <label for='attre'>편의시설</label>"
                        html += "            </div>"
                        html += "            <div class='form-group'>"
                        html += "                <textarea class='form-control' name='mAmeni' id='exampleFormControlTextarea1' rows='5'></textarea>"
                        html += "            </div>"
                        html += "        </div>"
                        html += "    </div>"
                        html += "</div>"
                    
                    $(".wg5bcr_box").append(html);
                // }

               

                i++; // 함수 내 하단에 증가문 설정
                
            });

                $("#rood_del").click(function() {
                    var j = parseInt($("[name=roomNum]").attr("value"));
                    console.log("j" + j); 
                    
                    if (j <= 1) {
                        alert('객실은 최소 1개이상 추가 해야합니다.');
                        return false;
                    } else{
                        div = document.getElementById("room_" + j);
                        $("[name=roomNum]").attr("value", j-1);    
                        console.log("감소 : " + $("[name=roomNum]").attr("value"));


                        div.remove();
                        j--;
                    }

                });
            
        
        });
        
    </script>

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

    <!-- 숙소 사진 프리뷰 -->
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

    <!-- 객실 사진 프리뷰 -->
    <script type="text/javascript">
        $(document).ready(function (e){
        $("#image_1").change(function(e){

            //div 내용 비워주기
            $('#preview_1').empty();

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
                $("#image_1").val("");  //파일 초기화
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
                str += '<img src="'+e.target.result+'" title="'+f.name+'" width=70 height=70 />';
                str += '</li></div>';
                $(str).appendTo('#preview_1');
                } 
                reader.readAsDataURL(f);
            }else{
                str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=70 height=70 />';
                $(str).appendTo('#preview_1');
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