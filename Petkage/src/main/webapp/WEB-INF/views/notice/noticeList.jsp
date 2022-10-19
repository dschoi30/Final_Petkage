<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

    <link rel="stylesheet" href="${ path }/resources/css/notice/notice.css">
    <link rel="stylesheet" href="${ path }/resources/css/notice/fontello-embedded.css">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<body>
	
	<br><br>
    <section class="nt">
        <div class="container py-5">
        	<div class="nt_header">
                <span style="margin-right: 200px;">
                    <img src="${ path }/resources//images/notice/image 69.png" alt="">
                </span>         
                <span>
                    <span class="nt_color">Pet</span>kage  공지사항
                </span>
                <span style="margin-left: 150px;">
                	<c:if test="${ empty loginMember || loginMember.memberRole != 'ROLE_ADMIN' }">
                		<span class="btn opacity-0" style="cursor: default; width: 120px;"></span>
                	</c:if>
                	<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
                    	<button type="button" onclick="location.href='${ path }/notice/noticeWrite'" class="b-btn">글쓰기</button>
                    </c:if>
                </span>
            </div>
            <div class="nt_inner" style="color:white;">
            	<br><br>
            	전체
	            <span style="color: #803D3D">${ noticeCount }</span>
            </div>

            <table class="table" style="margin: 0;">
                <thead>
                <tr>
                    <th style="width: 40px; text-align: center;">NO</th>
                    <th style="width: 550px; text-align: center;">제목</th>
                    <th style="width: 120px; text-align: center;">작성일</th>
                    <th style="width: 60px; text-align: center;">보기</th>
                </tr>
                </thead>
            </table>
			
			<c:if test="${ empty list }">
			<div style="text-align: center; font-size: 1.5em;">
				<br><br>
				조회된 공지사항이 없습니다.			
			</div>
			</c:if>
			
			<c:if test="${ not empty list }">
				<c:forEach var="notice" items="${ list }">
				
                <div id="accordion" class="accordion">
                	<div class="card-header collapsed" data-toggle="collapse" href="#collapse${ notice.no }">
                    <div>
                        <span class="nt_no">${ notice.no }</span>
                        <span class="nt_title">${ notice.title }</span>
	                    <c:if test="${ empty loginMember || loginMember.memberRole != 'ROLE_ADMIN' }">
	                    	<span class="btn opacity-0" style="cursor: pointer; width: 100px;"></span>
	                    </c:if>
                        <c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
                        	<button type="button" id="btnUpdate" class="nt_btn nt_ud"
                        		onclick="location.href='${ path }/notice/noticeUpdate?no=${ notice.no }'">수정</button>
                        	
                   	        <button type="button" id="btnDelete" class="nt_btn nt_ud ntDelete" noticeId="${ notice.no }"
                   	        	style="margin-right: 15px;">삭제</button>
	                    </c:if>
                        <span class="nt_date" style="width: 135px;">${ notice.createDate }</span>
                        <span id="down" style="display: inline-block; width: 50px; text-align: right;"><i class="icon-angle-down down"></i></span>
                    </div>
                </div>
                <div style="background-color: #ffeddb;">
                    <div id="collapse${ notice.no }" class="card-body collapse" data-parent="#accordion" >
                        <div class="nt_content">
                        	${ notice.content }
                        </div>
                    </div>
                </div>
                </div>
                
                </c:forEach>
        	</c:if>
			<br><br>
		<div style="text-align: center;">

			<button class="btn btn-customlr btn-xs" onclick="location.href='${ path }/notice/noticeList?page=${ pageInfo.prevPage }'">&lt;</button>
			&nbsp;&nbsp;
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<button class="btn btn-custom btn-xs" disabled>${ status.current }</button>
					&nbsp;&nbsp;
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<button class="btn btn-custom btn-xs" onclick="location.href='${ path }/notice/noticeList?page=${ status.current }'">${ status.current }</button>
					&nbsp;&nbsp;
				</c:if>
			</c:forEach>

			<button class="btn btn-customlr btn-xs" onclick="location.href='${ path }/notice/noticeList?page=${ pageInfo.nextPage }'">&gt;</button>

		</div>
	</div>

    </section>

    <br>
      
 <!-- 
    <style>
    .nt .nt_inner{
    text-align: center;
    font-weight: bold;
    font-size: 1.25em;
    background-image: url('${ path }/resources/images/notice/Rectangle 2051.png');
    height : 150px;
	}
  --> 

    </style> 
      
    <script> 
	    $(document).ready(() => {			
			console.log('작동');
			
			// noticeId를 가져와야해..
	        $(function() {
	            $(".ntDelete").click(function(){
	            	if(confirm("공지사항을 삭제 하시겠습니까?")){
	            		location.replace("${ path }/notice/noticeDelete?no=" + $(this).attr("noticeId"));	            		
	            	}
	            })
	        });
			
		});  
	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />