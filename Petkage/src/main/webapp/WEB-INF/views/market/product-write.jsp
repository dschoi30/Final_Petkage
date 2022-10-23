<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<html>
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- summernote CSS/JS -->
    <script src="${path}/resources/js/market/summernote/summernote-lite.js"></script>
    <script src="${path}/resources/js/market/summernote/lang/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="${path}/resources/css/market/summernote/summernote-lite.css">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
    <div id="wrap-all-prod">
        <div class="row">
            <div class="contents">
                <br><br>
                <div class="row justify-content-center"><h2>상품 등록</h2></div>
                <br><br>
                <form action="${ path }/market/product-write" method="POST" enctype="multipart/form-data">
                    <table class="table">
                        <tr>
                            <td><b>상품명</b></td>
                            <td><input type="text" name="proName" size="80" placeholder="노출 상품명 입력(브랜드명 + 상품명)" required></td>
                        </tr>
                        <tr>
                            <td><b>브랜드</b></td>
                            <td><input type="text" name="proBrand" size="80" placeholder="노출 브랜드명 입력" required></td>
                        </tr>
                        <tr>
                            <td><b>카테고리</b></td>
                            <td>
                                <select name="proCategory1" required>
                                    <option>카테고리 선택 1</option>
                                    <option value="dog">강아지</option>
                                    <option value="cat">고양이</option>
                                </select>
                                <select name="proCategory2" required>
                                    <option>카테고리 선택 2</option>
                                    <option value="food">사료/간식</option>
                                    <option value="health">건강/관리</option>
                                    <option value="poo">배변용품</option>
                                    <option value="living">리빙용품</option>
                                    <option value="beauty">미용/목욕</option>
                                    <option value="outdoor">야외용품</option>
                                    <option value="toy">장난감</option>
                                    <option value="fashion">패션용품</option>
                                    <option value="etc">기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><b>태그</b></td>
                            <td><input type="text" name="proTag" size="80" placeholder="쉼표(,)로 구분하여 최대 10개까지 입력 가능"></td>
                        </tr>
                        <tr>
                            <td><b>대표 이미지</b></td>
                            <td><input type="file" name="upfile" id="cit_file_1" required/></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 1/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 2/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 3/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 4/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 5/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                    </table>
                    <table class="prod-input-detail">
                        <tr>
                            <td><b>상품 수량(개)</b></td>
                            <td><b>정상가(원)</b></td>
                            <td><b>판매가(원)</b></td>
                            <td><b>배송비(원)</b></td>
                            <td><b>출고 소요 기간(일)</b></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="proQty" size="18" dir="rtl"></td>
                            <td><input type="text" name="proOPrice" size="18" dir="rtl"></td>
                            <td><input type="text" name="proSPrice" size="18" dir="rtl"></td>
                            <td><input type="text" name="proDelFee" size="18" dir="rtl"></td>
                            <td><input type="text" name="proLTime" size="18" dir="rtl"></td>
                        </tr>
                    </table>
                    <br><br>
                    <b>상품 상세 설명</b>
                    <textarea id="summernote" name="proContent" required></textarea>
                    <br>
                    <div class="align-btn-prod-write">
                        <button type="reset" class="btn btn-light text-nowrap">입력취소</button>
                        <button class="btn btn-light text-nowrap">미리보기</button>
                        <button class="btn btn-light text-nowrap">중간저장</button>
                        <button type="submit" class="btn btn-light text-nowrap">저장하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 400,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '최대 2,048자까지 내용을 입력할 수 있습니다.'	//placeholder 설정
        });
    });    
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
