<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

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
    <script src="${ path }/js/member/jquery-3.6.0.js"></script>
</head>
<body>
   <section class="findIdPwd">
      <div class="container" id="findByEmail">
        <div class="py-5 text-center">
          <h2>
            <strong><span style="color: #753422">Pet</span>kage</strong><br/>
            <div class="find_mainTitle">비밀번호 찾기</div>
          </h2>
          
          <!--  비밀번호 찾기-->
          <div id="findMyPwdByEmail">
            <!-- 본인인증 -->
            <div class="find_Box1">
              <div class="find_Box2">
                <div style="text-align: center">
                  <div class="find_subTitle">본인인증</div>
                  <hr/>
                </div>
                <table class="findByEmailTable">
                  <tbody>
                    <tr>
                      <th>아이디</th>
                      <td>
                        <input type="hidden" name="idTest" value="0" />
                        <input
                          type="text"
                          class="findByEmailInput"
                          name="findMyPwdInputId"
                          id="findMyPwdInputName"
                        />
                      </td>
                    </tr>
                    <th></th>
                    <td style="padding-top: 0;">
                      <div style="text-align: left;">
                        <span class="checkAlert" id="id_termsCheck"
                        ></span>
                      </div>
                  </td>
                    <tr>
                      <th>이메일 주소</th>
                      <td>
                        <input type="hidden" name="emailTest" value="0" />
                        <input
                          type="text"
                          class="findByEmailInput"
                          name="findMyPwdInputName"
                          id="findMyPwdInputEmail" disabled
                        />
                      </td>
                    </tr>
                    <tr>
                      <th style="padding-top:0x;"></th>
                      <td>
                        <div style="text-align: left;">
                          <span class="checkAlert" id="email_termsCheck"
                            >아이디를 먼저 입력해 주세요.</span>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="btnBox">
              <input type="submit" class="btnSendNum" value="인증번호 보내기" disabled></input>
            </div>

            <!-- 이메일 인증 -->
            <div class="find_Box1">
              <div class="find_Box2">
                <div style="text-align: center">
                  <hr/>
                </div>
                <table class="findMyIdTable">
                  <tbody>
                    <tr>
                      <td>
                        <span class="checkAlert"
                          >수신된 이메일의 인증번호를 입력해 주세요.</span
                        >
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td style="padding-bottom: 0">
                        <input
                          type="text"
                          class="findByEmailInput"
                          name="findByEmail"
                          id="findByEmail"
                        />
                      </td>
                      <td style="width: auto;">
                        <input type="button" class="btnFindByEmail" value="확인"></input>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <span class="checkAlert" id="findByEmailFinish"
                          >본인인증이 완료되었습니다 !</span
                        >
                      </td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="btnBox">
              <input type="submit" class="btnFindMyIdNext" value="다음"></input>
            </div>
          </div>
        </div>
      </div>
        
      <!-- 비밀번호 찾기 완료 -->
      <div class="container" id="findMyPwdFinish" style="display: none;">
        <div class="py-5 text-center">
          <h2>
              <strong><span style="color: #753422; padding-bottom: 100px;">Pet</span>kage</strong><br/>
              <div class="find_mainTitle">비밀번호 찾기</div>
          </h2>
        </div>

        <div class="find_Box1">
          <div class="find_Box2">
              <div style="text-align: center">
              <div class="find_subTitle">새로운 비밀번호를 등록해 주세요.</div>
              <hr/>
              </div>
              <table class="findByEmailTable">
                <tbody>
                  <tr>
                    <th>비밀번호</th>
                    <td>
                      <input type="hidden" name="pwdTest" value="0" />
                      <input
                        type="password"
                        class="findByEmailInput"
                        name="findMyPwdInputNewName"
                        id="find_newPwd"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th></th>
                    <td>
                      <span class="checkAlert" id="pwd_termsCheck">영문자, 숫자 모두 포함해 8자리 이상 입력해 주세요.</span>
                    </td>
                  </tr>
                  <tr>
                    <th style="padding-bottom: 0">비밀번호 확인</th>
                    <td style="padding-bottom: 0">
                      <input type="hidden" name="pwdCheckTest" value="0" />
                      <input
                        type="password"
                        class="findByEmailInput"
                        name="findMyPwdInputNewName"
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
                <button type="button" class="btnFindMyIdFinish" id="find_PwdChange" >비밀번호 변경</button>
            </div>

            </div>
        </div>
      </div>
    </section>
    <script src="${ path }/js/member/find_PwdFinish.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {

        // 이메일 인증 완료 후 <다음> 버튼 클릭
        $('.btnFindMyIdNext').click(function (e) {
            e.preventDefault(); // 새로고침 방지

            if(true) {
              $('#findByEmail').css("display", "none");
              $('#findMyPwdFinish').css("display", "");
            } else {
              $('#findByEmail').css("display", "none");
              $('#findMyPwdFinish').css("display", "");
            }
            // location.href = '${path}/memeber/join';
            // location.href = './Join_main.html';
            console.log("이메일 인증 완료 후 <다음> 버튼 클릭");
          });

        // 비밀번호 변경 클릭 시 로그인 페이지 이동
        $('#find_PwdChange').click(function () {
          // location.href = '${path}/memeber/login';
          location.href = './login.html';
        })

        $('#btnFindPwd').click(function () {
          // location.href = '${path}/memeber/login';
          location.href = './findMyPwd.html';
        })


      })
</body>
</html>