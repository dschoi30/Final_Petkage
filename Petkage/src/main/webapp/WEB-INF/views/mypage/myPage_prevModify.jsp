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
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_prevModify.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	
	<section class="prevmdfy">
        <p class="mypagept" style="width: 1500px; height: 50px; font-size: 32px; font-weight: 700; font-family: 'GmarketSansMedium'; line-height: 100%; text-align: center; color: #803D3D;">회원정보확인</p>
        <div class="container">
		<form action="${ path }/member/prevModify" method="post"> 
		<input type="htdden" name="replaceUri" value="${ param.replaceUri }"/>      
            <p class="v91_238" style=" font-size: 16px; font-family: 'GmarketSansMedium';">    님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>

            <div class="modifyBox">
                <table>

                    <tbody>                    
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" class="modifyInput" name="userId" id="userId" "${ loginMember.userId }" disabled>
                            </td>
                        </tr>
                        <th></th>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input type="password" class="modifyInput" name="userPwd" id="userPwd" required >
                            </td>
                        </tr>
                    </tbody>
                </table>
                </div>

                <div class="md_button">
                    <button type="submit">확인</button>
                    <button type="submit">취소</button>
                  </div>
              </div>
        </div>
        </form>
    </section>
<script>

</script>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>