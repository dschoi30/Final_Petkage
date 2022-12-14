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
    <link rel="stylesheet" href="${ path }/resources/css/wherego/wherego_review_write.css?ver=4">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>

<body>

    <section class="wg_3">
        <div class="wg_top" id="wg_top">
            <div class="wg_title">
                <p>리뷰 게시판</p>
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

        <div class="wgc_7">
            <div class="wgc7_rbar">
                <div class="wgc7r_img">
                    <img src="${ path }/resources/images/wherego/리뷰.png">
                </div>
                <div class="wgc7r_text">
                    <div class="wgc7rt_1">
                        <p>리뷰 작성</p>
                    </div>
                </div>
            </div>
            <form action="${path}/review/review_write" method="post" enctype="multipart/form-data" >
                <div class="wgc7_option">
                    <div class="wgc7_select">
                        <div class="wgc7_cate">
                            <label for="cate">카테고리</label>
                            <select class="form-control" id="exampleFormControlSelect1" name="revcategory" required="required">
                                <option value="숙소">숙소</option>
                                <option value="카페">카페</option>
                                <option value="맛집">맛집</option>
                                <option value="미용">미용</option>
                                <option value="여행지">여행지</option>
                                <option value="동물병원">동물병원</option>
                                <option value="유치원">유치원</option>
                                <option value="셀프목욕">셀프목욕</option>
                            </select>
                        </div>
                        <div class="wgc7_location">
                            <label for="location">장소 이름</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" name="revtitle" placeholder="장소 이름을 명확히 적어주세요!" required="required">
                        </div>
                    </div>
                    <div class="wgc7_score">
                        <div class="wgc7_sl">
                            별점
                        </div>
                        <div class="wgc7_star">
                            <fieldset>
                                <input type="radio" name="revscore" value="5" id="rate1"><label
                                    for="rate1">★</label>
                                <input type="radio" name="revscore" value="4" id="rate2"><label
                                    for="rate2">★</label>
                                <input type="radio" name="revscore" value="3" id="rate3"><label
                                    for="rate3">★</label>
                                <input type="radio" name="revscore" value="2" id="rate4"><label
                                    for="rate4">★</label>
                                <input type="radio" name="revscore" value="1" id="rate5"><label
                                    for="rate5">★</label>
                            </fieldset>
                        </div>
                    </div>
                </div>

                <div class="wgc7_write">
                    <div class="wgc7w_upload">
                        <div>
                            <label for="image">
                                <div class="btn-upload">업로드</div>
                            </label>
                            <input type="file" name="multiFile" id="image" multiple>
                            <div id="preview"></div>
                        </div>
                    </div>
                    <div class="wgc7w_text">
                        <div class="form-group">
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="revcoment" rows="3" placeholder="리뷰를 적어주세요!" required="required"></textarea>
                        </div>
                    </div>
                </div>

                <div class="wgc7_button">
                    <button type="submit">작성</button>
                </div>
            </form>
        </div>




    </section>

    <script type="text/javascript">
        $(document).ready(function (e){
        $("input[type='file']").change(function(e){

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
            $("input[type='file']").val("");  //파일 초기화
                return false;
            }
            
            if(regex.test(fileName)){
                alert('업로드 불가능한 파일이 있습니다.');
                $("input[type='file']").val("");  //파일 초기화
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>