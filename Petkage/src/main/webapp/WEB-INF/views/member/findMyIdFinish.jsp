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
<title>아이디 찾기</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="${ path }/css/member/findByEmail.css" />
    <script src="${ path }/js/member/jquery-3.6.0.js"></script>
</head>
<body>
  <section class="findIdPwd">
    <!-- 아이디 찾기 완료 -->
    <div class="container" id="findMyIdFinish">
      <div class="py-5 text-center">
        <h2>
            <strong><span style="color: #753422; padding-bottom: 100px;">Pet</span>kage</strong><br/>
            <div class="find_mainTitle">아이디 찾기</div>
        </h2>
      </div>

      <div class="find_Box1">
          <div class="find_Box2">
              <div style="text-align: center">
              <div class="find_subTitle">아이디</div>
              <hr/>
              </div>
              <div style="height: 15em;" id="saveName">
                  <span class="findByEmailAlert">회원님의 아이디는 <span style="font-weight: bold; color: #753422;" >
                  ${ userId }
                  </span>입니다.</span>
              </div>

          <div class="btnBox">
              <button type="button" class="btnFindMyIdFinish" id="btnLogin" onclick="location.href='${path}/member/login'">로그인</button>
              <button type="button" class="btnFindMyIdFinish" id="btnFindPwd" onclick="location.href='${path}/member/findMyPwdPage'">비밀번호 찾기</button>
          </div>

          </div>
      </div>
    </div>
  </section>

  <script src="${ path }/js/member/find_IdFinish.js"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>