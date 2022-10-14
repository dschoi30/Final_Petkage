<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

	<link rel="stylesheet" href="${ path }/resources/css/notice/notice.css">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- summornote -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
<body>
	<html>
	<br><br>
    <section class="nt">
        <div class="container py-5">
            <div class="nt_header">
                    <img style="margin-right: 200px;" src="${ path }/resources//images/notice/image 69.png" alt="">                
                <span style="margin-right: 300px;">
                    <span class="nt_color">Pet</span>kage 공지사항
                </span>

            </div>
            <form action="${ path }/notice/noticeWrite" method="post"  enctype="multipart/form-data">
            <!-- <input type="hidden" name="writerNo" value="${ loginMember.no }" ></input>  -->
            <div class="nt_big">
                <div class="nt_small">
                    <div class="nt_write">
                        <div style="height: 60px; margin-bottom: 20px; border-bottom: #D6d6d6 2px solid;">
                            <b style="text-align: left; margin-right: 50px; font-size: 1.2em;">제목</b>
                            <input class="nt_search" type="text" name="title" required="required">
                        </div>
                            <textarea style="width: 100%;" id="summernote" name="content" required="required"></textarea>
                            <br><br>
                            <button type="submit" class="b-btn" style="font-size:14px; margin-right: 20px;">작성</button>
                            <input type="button" class="b-btn" style="font-size:14px;" 
                            	onclick="location.replace('${pageContext.request.contextPath}/notice/noticeList')" value="이전으로">
                    </div>
                </div>
            </div>
            </form>
        </div>
    </section>

    <script>
    $('#summernote').summernote({
        placeholder: ' ',
        tabsize: 2,
        height: 400
      });
    
    </script>
    
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />