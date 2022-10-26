<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!-- css 스타일 -->
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_reviewAble.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	<p class="mypagept" style="width: 1500px; height: 50px; font-size: 32px; font-weight: 700; font-family: 'GmarketSansMedium'; line-height: 100%; text-align: center; color: #803D3D;">리뷰 작성</p>

    <section class="mp-ra">
        <div class="container">
            <ul class="nav nav-tabs">            
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#product">상품</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#where">어디가지</a>
                </li>
                </ul>
            
        <div class="tab-content">
            <div class="tab-pane fade show active" id="product">                    
                <table class="table" id="tb1">
                <thead>
		          <tr>
		            <th scope="col">상품이미지</th>
		            <th scope="col">상품명</th>
		            <th scope="col">주문일자</th>
		            <th scope="col">리뷰 작성</th>
		          </tr>
		        </thead>
                 <c:forEach var="payment" items="${ payment }">
                <tbody>
                    <tr>
                        <td class="w-25">
					      <img class="img" src="${path}/resources/upload/market/${ payment.renamedFileName }" width="70" height="70">		     
		      			</td>
                        <td> ${ payment.proName } </td>
                        <td> ${ payment.payCreatedAt } </td>
                        <td>
                            
                            <button type="button" id="insBtn" class="btn btn-outline-secondary">리뷰 작성하기</button>
                            
                        </td>                       
                    </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>

        <div class="tab-pane fade" id="where">
            <table class="table" id="tb2">
                <tbody>
                    <tr>
                        <th scope="row">사진</th>
                        <td>2000-01-01</td>
                        <td>여행지</td>
                        <td>
                            <button type="button" id="insBtn" class="btn btn-outline-secondary">리뷰 작성하기</button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">사진</th>
                        <td>2000-01-01</td>
                        <td>여행지</td>
                        <td>
                            <button type="button" class="btn btn-outline-secondary">리뷰 작성하기</button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">사진</th>
                        <td>2000-01-01</td>
                        <td>여행지</td>
                        <td>
                            <button type="button" class="btn btn-outline-secondary">리뷰 작성하기</button>
                        </td>
                    </tr>                        
                </tbody>
            </table>
        </div>
    </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            </ul>
        </nav>
    </div>
    </section>
<form action="${ path }/mypage/myPage_productReview/" method="GET" >
	
	<input type="hidden" name="no" value=${ loginMember.no }>	
	<input type="hidden" name="payItemNo" value=${ paymentInfo.payItemNo }>
	
</form>
    <script type="text/javascript">

    /* 리뷰쓰기
	$(".reply_button_wrap").on("click", function(e){
		
		e.preventDefault();
		
		const memNo = '${member.no}';
		const payNo = '${paymentInfo.payItemNo}';
		
		let popUrl = "/myPage_productReview/" + no + "?payItemNo=" + payItemNo;
		console.log(popUrl);
		let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"리뷰 쓰기",popOption);  

	}); */
	
	$(document).ready(() => {
		 $("#insBtn").on("click", () => {
			 if(${empty loginMember}) {
				 alert("로그인이 필요합니다 :)");
				 location.href="${path}/member/loginPage"
			 } else {
				 location.href="${path}/mypage/myPage_productReview?payItemNo"
			 }
		 });
	 });
    
    	
    </script>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>