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
<body>
<div id="wrap-all-prod">
    <div class="row">
        <div class="contents">
            <br><br>
            <div class="row justify-content-center"><h2>상품 등록 수정</h2></div>
            <br><br>
            <form action="${ path }/market/product-update" method="POST" enctype="multipart/form-data">
            	<input type="hidden" name="proNo" value="${ product.proNo }">
                <table class="table">
                    <tr>
                        <td><b>상품명</b></td>
                        <td><input type="text" name="proName" size="80" placeholder="노출 상품명 입력(브랜드명 + 상품명)" value="${ product.proName }"></td>
                    </tr>
                    <tr>
                        <td><b>브랜드</b></td>
                        <td><input type="text" name="proBrand" size="80" placeholder="노출 브랜드명 입력" value="${ product.proBrand }"></td>
                    </tr>
                    <tr>
                        <td><b>카테고리</b></td>
                        <td>
                            <select id="proCategory1" name="proCategory1" required>
                                <option>카테고리 선택 1</option>
                                <option value="dog" name="category1">강아지</option>
                                <option value="cat" name="category1">고양이</option>
                            </select>
                            <select id="proCategory2" name="proCategory2" required>
                                <option>카테고리 선택 2</option>
                                <option value="food" name="category2">사료/간식</option>
                                <option value="health" name="category2">건강/관리</option>
                                <option value="poo" name="category2">배변용품</option>
                                <option value="living" name="category2">리빙용품</option>
                                <option value="beauty" name="category2">미용/목욕</option>
                                <option value="outdoor" name="category2">야외용품</option>
                                <option value="toy" name="category2">장난감</option>
                                <option value="fashion" name="category2">패션용품</option>
                                <option value="etc" name="category2">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><b>태그</b></td>
                        <td><input type="text" name="proTag" size="80" placeholder="쉼표(,)로 구분하여 최대 10개까지 입력 가능" value="${ product.proTag }"></td>
                    </tr>
                    <tr>
                        <td><b>대표 이미지</b></td>
                        <td><input type="file" name="upfile" id="cit_file_1"/>
                        	<c:if test="${ not empty product.renamedFileName }">
                        		<span>${ product.renamedFileName }</span>
                        	</c:if>
                        </td>
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
                        <td><input type="text" name="proQty" size="18" dir="rtl" value="${ product.proQty }"></td>
                        <td><input type="text" name="proOPrice" size="18" dir="rtl" value="${ product.proOPrice }"></td>
                        <td><input type="text" name="proSPrice" size="18" dir="rtl" value="${ product.proSPrice }"></td>
                        <td><input type="text" name="proDelFee" size="18" dir="rtl" value="${ product.proDelFee }"></td>
                        <td><input type="text" name="proLTime" size="18" dir="rtl" value="${ product.proLTime }"></td>
                    </tr>
                </table>
                <br><br>
                <b>상품 상세 설명</b>
                <textarea id="summernote" name="proContent" value="${ product.proContent }"></textarea>
                <br>
                <div class="align-btn-prod-write">
                    <button type="reset" class="btn btn-light text-nowrap">변경취소</button>
                    <button type="submit" class="btn btn-light text-nowrap">저장하기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {

	 $('#summernote').summernote({
		 	placeholder: '최대 2,048자까지 내용을 입력할 수 있습니다.',
	        height: 400,
	        minHeight: null,
	        maxHeight: null, 
	        lang: 'ko-KR',
	        callbacks: {
	        	onImageUpload: function(files, editor, welEditable) {
	        		for(var i = files.length -1; i>=0; i--) {
	        			sendFile(files[i], this);
	        		}
	        	}
	        }
	 });
    
	$("#proCategory1 option[value=${product.proCategory1}]").attr("selected", "selected");    		
	$("#proCategory2 option[value=${product.proCategory2}]").attr("selected", "selected");
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />