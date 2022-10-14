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
	<link rel="stylesheet" href="${ path }/css/mypage/myPage_userModify.css">
	
		<!-- java script -->
	<script src="${ path }/js/member/jquery-3.6.0.js"></script>
	<script async src="${ path }/js/mypage/userModify.js?ver=1"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	<section class="mp-Modify">
        <div class="container">
        <p class="mypagept" style="width: 1110px; height: 50px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">회원 정보 수정</p>
        
        <div class="modifyBox">
            <table>
            <tbody>
                <tr>
                <th>아이디</th>
                <td>
                    <input type="text" class="modifyInput" name="userId" id="userId" required>
                    <input type="hidden" name="idTest" value="0" />
                </td>
                </tr>
                <th></th>
                <tr>
                  <th>비밀번호</th>
                  <td>
                    <input type="hidden" name="pwdTest" value="0" />
                    <input type="password" class="modifyInput" name="userPwd" id="userPwd" required >
                  </td>
                  <th>비밀번호 확인</th>
                  <td>
                    <input type="hidden" name="pwdCheckTest" value="0" />
                    <input type="password" class="modifyInput" name="userPwdCheck" id="userPwdCheck" required>
                  </td>
                </tr>
                <tr>
                  <th></th>
                  <td>
                    <span class="checkAlert" id="pwd_termsCheck">영문자, 숫자 모두 포함해 8자리 이상 입력해 주세요.</span>
                  </td>
                  <th></th>
                  <td><span class="checkAlert" id="pwd_doubleCheck"></span></td>
                </tr>
                <tr>
                  <th>이름</th>
                  <td>
                    <input type="hidden" name="nameTest" value="0" />
                    <input type="text" class="modifyInput" name="userName" id="userName" required >
                  </td>
                  <th>핸드폰 번호</th>
                  <td>
                    <input type="hidden" name="phoneTest" value="0" />
                    <input type="text" class="modifyInput" name="userPhone" id="userPhone" >
                  </td>
                </tr>
                <tr>
                  <th></th>
                  <td>
                    <span class="checkAlert" id="name_termsCheck"></span>
                  </td>
                  <th></th>
                  <td><span class="checkAlert" id="phone_termsCheck">문자를 제외한 번호만 입력해 주세요.</span></td>
                </tr>
                <tr>
                  <th>주소</th>
                    <td>
                      <div style="display: flex; justify-content: left; text-align:center;">
                        <input type="text" class="modifyInput" name="zonecode" style="width: 100px; display: flex; text-justify: center;" id="zonecode" readonly="readonly" placeholder="우편번호" required>

                        <input type="button" class="btnInfo" id="btnPostcode"  onclick="postCode()" value="주소검색" style="margin-top:16px"></input>
                      </div>
                    </td>
                </tr>
                <tr>
                  <th></th>
                    <td>
                      <input type="text" class="modifyInput" name="userAddress" id="userAddress" >
                    </td>
                    <th>나머지 주소</th>
                    <td>
                      <input type="hidden" name="addressTest" value="0" />
                      <input type="text" class="modifyInput" name="addressSub" id="addressSub" disabled>
                    </td>
                </tr>
                <tr>
                  <th></th>
                  <td></td>
                  <th></th>
                  <td>
                    <span class="checkAlert" id="address_termsCheck">나머지 주소를 입력해 주세요.</span>
                    
                  </td>
                </tr>
                <tr>
                  <th>이메일</th>
                      <td>
                      <input type="text" class="modifyInput" name="userEmail" id="userEmail" >
                      <span class="userInfoAlert" id="error_Email"></span>
                    </td>
                    <td>
                      <input type="hidden" name="emailDuplicateTest" value="0" />
                      <input type="button" class="btnInfo" id="emailDuplicate" value="중복확인" disabled />
                    </td>
                </tr>
                <th></th>
                    <td>
                      <span class="checkAlert" id="email_termsCheck"></span>
                    </td>
                  <th></th>
                  <td>
                  </td>
                </tr>
                <tr>
                  <td class="enrollForm-error" id="error_email"><span></span></td>
                </tr>	
              </tbody>
            </table>
          </div>

          <!-- 반려동물 정보 입력  -->
          <div id="petModifyBox">
   <p class="mypagept" style="width: 1110px; height: 50px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">반려 동물 정보 수정</p>
            <table class="modifyBox" id="petInfoAdd" >
              <tbody>
                <tr>
                  <th style="padding-right: 20px; padding-bottom: 25px;">이름</th>
                    <td>
                      <input type="text" class="modifyInput" name="pName" id="pName" >
                    </td>
                  <th style="padding: 33px;">My Pet</th>
                    <td>
                      <div class="petTypeBox" >
                        <label class="modifyRadioType">
                          <input type="radio" name="pType" id="pDog" value="D">
                          <span>강아지</span>
                        </label>
                        <label class="modifyRadioType">
                          <input type="radio" name="pType" id="pCat" value="C">
                          <span>고양이</span>
                        </label>
                      </div>
                    </td>
                </tr>
                </tr>
                <tr>
                  <th style="padding-right: 25px; padding-bottom: 15px;">몸무게 선택</th>
                  <td>
                  <div class="petWeighBox">
                    <label class="modifyRadioType">
                      <input type="radio" name="petWeight" id="" disabled>
                      <span>소(~9kg)</span>
                    </label>
                    <label class="modifyRadioType">
                      <input type="radio" name="petWeight" id="" disabled>
                      <span>중(9~23kg)</span>
                    </label>
                    <label class="modifyRadioType">
                      <input type="radio" name="petWeight" id="" disabled>
                      <span>대(23kg~)</span>
                    </label>
                  </div>
                </td>
                  <th style="padding-right: 25px; padding-bottom: 15px;">특징</th>
                  <td>
                    <input type="text" class="modifyInput" name="pCheck" id="pCheck" >
                  </td>
                </tr>
                <tr>
                  
                </tr>
              </tbody>
            </table>
          </div>

          
          <div class="md_button">
              <button type="submit">수정 완료</button>
              <button type="submit">회원 탈퇴</button>
            </div>
        </div>
    
</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>