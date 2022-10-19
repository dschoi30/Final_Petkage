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
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_pwdModify.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	
	<section class="prevmdfy">

        <table class="findByEmailTable">
          <tbody>
            <tr>
              <th>비밀번호</th>
              <td>
                <input type="hidden" name="pwdTest" value="0" />
                <input type="hidden" name="saveUserId" id="findPwdUserId" />
                <input
                  type="password"
                  class="findByEmailInput"
                  name="newPwd"
                  id="find_newPwd"
                />
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <span class="checkAlert" id="pwd_termsCheck"></span>
              </td>
            </tr>
            <tr>
              <th style="padding-bottom: 0">비밀번호 확인</th>
              <td style="padding-bottom: 0">
                <input type="hidden" name="pwdCheckTest" value="0" />
                <input
                  type="password"
                  class="findByEmailInput"
                  name="newPwdCheck"
                  id="find_newPwdCheck"
                />
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <div style="text-align: left;">
                <span class="checkAlert" id="pwd_doubleCheck">영문자, 숫자 모두 포함해 8자리 이상 입력해 주세요.</span></div>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="btnBox">
          <button type="button" class="btnFindMyIdFinish" id="find_PwdChange" style="margin:5rem; ">비밀번호 변경</button>
        </div>
        </div>
    </section>
    
    

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>