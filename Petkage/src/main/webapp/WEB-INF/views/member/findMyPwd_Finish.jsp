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
<title>비밀번호 찾기</title>
  <!-- Bootstrap CSS -->
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
    crossorigin="anonymous"
  />

  <link rel="stylesheet" href="${ path }/css/member/findByEmail.css" />

</head>
<body>
  <section class="findIdPwd">
  <!-- 비밀번호 완료 -->
  <div class="container" id="findMyPwdFinish">
    <div class="py-5 text-center">
      <h2>
        <strong><span style="color: #753422; padding-bottom: 100px;">Pet</span>kage</strong><br/>
        <div class="find_mainTitle">비밀번호 찾기</div>
      </h2>
    </div>

    <%-- 비밀번호 변경 --%>
    <div class="find_Box1">
      <div class="find_Box2">
        <div style="text-align: center">
          <div div class="find_subTitle">새로운 비밀번호를 등록해 주세요.</div>
          <hr/>
        </div>

        <c:if test="${ not empty saveMember }">
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
    </c:if>
    <c:if test="${ empty saveMember }">
      <div style="height: 15em;" id="saveName">
          <span class="findByEmailAlert" style="font-weight: bold; color: #753422;" >
          잘못된 접근입니다. 
          </span>
      </div>
      <div class="btnBox">
        <button type="button" class="btnFindMyIdFinish" id="btnLogin" onclick="location.href='${path}/member/loginPage'">로그인</button>
        <button type="button" class="btnFindMyIdFinish" id="btnFindPwd" onclick="location.href='${path}/member/findMyPwdPage'">비밀번호 찾기</button>
      </div>
    </c:if>
    </div> <!-- find_Box2 --> 

  </div>
  </section>
  <script src="${ path }/js/member/jquery-3.6.0.js"></script>
  <script src="${ path }/js/member/find_PwdFinish.js"></script>

  <script type="text/javascript">
    $(document).ready(function () {
      $('#find_PwdChange').click(function () {
        // 비밀번호를 입력하지 않았을 경우
        if ($("[name=pwdTest]").val() != "1") {
          $("#pwd_termsCheck").text("이상해");
          $("#newPwd").focus();

          return false;
        }

        // 비밀번호를 확인하지 않았을 경우
        if ($("[name=pwdCheckTest]").val() != "1") {
          $("#pwd_doubleCheck").text("비밀번호 확인을 해주세요.");
          $("#newPwdCheck").focus();

          return false;
        }

        if($("[name=pwdTest]").val() == "1" && $("[name=pwdCheckTest]").val() == "1") {
          let newPwd = $("#find_newPwd").val().trim();
          let newPwdCheck = $("#find_newPwdCheck").val().trim();

          $.ajax({
            type : "POST",
            url: "${ path }/member/updateFindPwd",
            data : {
              newPwd, 
              newPwdCheck
            },
            dataType: "text",
            success : (result) => {
              if(result == "success") {
                alert("[Petkage] 비밀번호 변경이 성공하였습니다. ")
                location.href="${ path }/member/loginPage"
              }

              if(result == "fail") {
                alert("잘못된 접근입니다. ")
                location.href="${ path }/member/findMyPwdPage"
              }

              if(result == "pwd fail") {
                $("#pwd_doubleCheck").text("비밀번호가 일치하지 않습니다.");
                $("[name=pwdCheckTest]").val("0");
              }

              if(result == "member fail") {
                alert("비밀번호 찾기 인증을 다시 시도해 주세요.")
                location.href="${ path }/member/findMyPwdPage"
              }
            } // success 종료
          }) // ajax 종료

        }
      })




    })

  </script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>