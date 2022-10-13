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
<title>회원가입</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!-- css 스타일 -->
	<link rel="stylesheet" href="${ path }/css/member/enroll.css">
 
</head>
<body>

    <section class="join">
      <div class="container">
        <div class="py-5 text-center"  style="padding-bottom: 15px !important;">
          <h1>Join to <strong><span style="color: #753422;">Pet</span>kage</strong></h1>
        </div>

        <!-- 회원가입 정보 입력 form -->
        <form action="${ path }/member/enroll" method="POST" id="formJoin" name="formJoin">
        
          <!-- 일반회원 / 판매자 회원 -->
          <div class="memberType text-center">
            <label class="joinMemberRadioType">
              <input type="radio" name="memberRole" id="memberUser" value="ROLE_USER" checked onchange="memberTypeDisplay()">
              <span>일반 회원</span>
            </label>
            <label class="joinMemberRadioType">
              <input type="radio" name="memberRole" id="memberSeller" value="ROLE_SELLER" onchange="memberTypeDisplay()">
              <span>판매자 회원</span>
            </label>
          </div>
          
          <!-- 약관 동의 -->
          <div class="termsBox">
            <div id="agreeCheck" style="font-size: 17px; font-weight: bold;">
              약관을 읽고 동의해주세요.
              <button type="button" class="btn btn-Link" id="btnAgree" data-toggle="modal" data-target="#agreemodal">
                <img src="${ path }/images/member/click.png" style="height: 20px; width: 20px; padding: 0;">
              </button>
            </div>
            <input type="hidden" name="agreeTest" value="0" />
          </div>
          
          <!-- 약관 동의 Modal -->
          <div class="modal fade" id="agreemodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                    <img class="logo" src="${ path }/images/member/Petkage_Logo2.png" alt="" width="170" height="80">
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Clrrrrrrrose"></button> -->
                </div>
                <div class="modal-body">
                  <div class="form-check checkbox_group" > 
                      <input class="form-check-input checkAll" id="checkAll" type="checkbox" value="" style="width: 20px; height:20px; margin-left: -1.5em;" >
                      <label class="form-check-label agreeAllTitle" for="checkAll" >
                        <strong><span style="color: #753422">Pet</span>kage</strong>의 이용약관 및 개인정보 수집 및 이용에 모두 동의합니다.
                      </label> <br>
                      
                      <input class="form-check-input checkSep" id="check1" type="checkbox" value="">
                      <label class="form-check-label agreeTitle" for="check1">
                        <strong><span style="color: #753422">Pet</span>kage</strong>의 이용약관에 동의합니다.
                      </label><br>
                      <textarea class="terms" cols="80" rows="10" readonly>제 1 장 총칙
                      </textarea>
                  
                    <input class="form-check-input checkSep" id="check2" type="checkbox" value="">
                    <label class="form-check-label agreeTitle" for="check2">
                      <strong><span style="color: #753422">Pet</span>kage</strong>의 개인정보 수집 및 이용에 동의합니다.
                    </label> <br>
                    <textarea class="terms" cols="80" rows="10" readonly>1. 개인정보의 수집항목 및 수집방법 
                    </textarea>
                  </div>
                </div>
                <div class="submitForm-no" id="please_allCheck"> 
                    <span></span> 
                  </div>
                <div class="modal-footer" style="justify-content: center;">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" id="btnAgreeFinish" data-dismiss="modal">동의 완료</button>
                </div>
              </div>
            </div>
          </div>

          <!-- 가입 기본 정보-->
          <div class="joinInfoBox">
            <table>
              <tbody>
                <tr>
                  <th>아이디</th>
                  <td>
                    <input type="text" class="joinInfoInput" name="userId" id="userId">
                    <input type="hidden" name="idTest" value="0" />
                  </td>
                  <td>
                    <input type="hidden" name="idDuplicateTest" value="0" />
                    <input type="button" class="btnInfo" id="userIdDuplicate" value="중복확인" disabled=""/>
                  </td>
                </tr>
                <tr>
                  <th></th>
                  <td>
                    <span class="checkAlert" id="id_termsCheck">10~12자의 영문 대소문자와 숫자를 입력해 주세요.</span>
                  </td>
                </tr>
                <tr>
                  <th>비밀번호</th>
                  <td>
                    <input type="hidden" name="pwdTest" value="0" />
                    <input type="password" class="joinInfoInput" name="userPwd" id="userPwd" >
                  </td>
                  <th>비밀번호 확인</th>
                  <td>
                    <input type="hidden" name="pwdCheckTest" value="0" />
                    <input type="password" class="joinInfoInput" name="userPwdCheck" id="userPwdCheck">
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
                    <input type="text" class="joinInfoInput" name="userName" id="userName" >
                  </td>
                  <th>핸드폰 번호</th>
                  <td>
                    <input type="hidden" name="phoneTest" value="0" />
                    <input type="text" class="joinInfoInput" name="userPhone" id="userPhone" >
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
                        <input type="text" class="joinInfoInput" name="zonecode" style="width: 100px; display: flex; text-justify: center;" id="zonecode" readonly="readonly" placeholder="우편번호">

                        <input type="button" class="btnInfo" id="btnPostcode"  onclick="postCode()" value="주소검색" style="margin-top:16px" />
                      </div>
                    </td>
                </tr>
                <tr>
                  <th></th>
                    <td>
                      <input type="text" class="joinInfoInput" name="userAddress" id="userAddress" readonly>
                    </td>
                    <th>나머지 주소</th>
                    <td>
                      <input type="hidden" name="addressTest" value="0" />
                      <input type="text" class="joinInfoInput" name="addressSub" id="addressSub" disabled>
                    </td>
                </tr>
                <tr>
                  <th></th>
                  <td></td>
                  <th></th>
                  <td>
                    <span class="checkAlert" id="address_termsCheck"></span>
                    
                  </td>
                </tr>
                <tr>
                  <th style="margin-top: 10px" >이메일</th>
                    <td>
                      <input type="text" class="joinInfoInput" name="userEmail" id="userEmail" >
                      <span class="userInfoAlert" id="error_Email"></span>
                    </td>
                    <td>
                      <input type="hidden" name="emailDuplicateTest" value="0" />
                      <input type="button" class="btnInfo" id="emailDuplicate" value="중복확인" disabled />
                    </td>
                    <td>
                      <div class="petTypeBox" style="margin-top: 15px" >
                        <label class="joinRadioType">
                          <input type="radio" name="petYN" id="petYes" value="Y" onclick="petInfoDisplay()" >
                          <span>YES PET</span>
                        </label>
                        <label class="joinRadioType">
                          <input type="radio" name="petYN" id="petNo" value="N" onclick="petInfoDisplay()" checked>
                          <span>NO PET</span>
                        </label>
                      </div>
                    </td>
                </tr>
                <tr>
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
          <div id="joinPetInfoBox" style="display: none;">
            <div class="addInfoTitle">
              *반려동물 정보 입력
            </div>
            <table class="joinInfoBox" id="petInfoAdd" >
              <tbody>
                <tr>
                  <th style="padding-right: 20px; padding-bottom: 25px;">이름</th>
                    <td>
                      <input type="text" class="joinInfoInput" name="petName" id="petName" >
                    </td>
                  <th style="padding:30px; padding-top:40px;">My Pet</th>
                    <td>
                      <div class="petTypeBox"  style="margin-top: 15px">
                        <label class="joinRadioType">
                          <input type="radio" name="petType" id="pDog" value="D">
                          <span>강아지</span>
                        </label>
                        <label class="joinRadioType">
                          <input type="radio" name="petType" id="pCat" value="C">
                          <span>고양이</span>
                        </label>
                      </div>
                    </td>
                </tr>
                <tr>
                  <th style="padding-right: 25px; padding-bottom: 15px;">몸무게 선택</th>
                  <td>
                  <div class="petWeighBox">
                    <label class="joinRadioType">
                      <input type="radio" name="petWeight" id="" value="S" disabled>
                      <span>소(~9kg)</span>
                    </label>
                    <label class="joinRadioType">
                      <input type="radio" name="petWeight" id="" value="M" disabled>
                      <span>중(9~23kg)</span>
                    </label>
                    <label class="joinRadioType">
                      <input type="radio" name="petWeight" id="" value="L" disabled>
                      <span>대(23kg~)</span>
                    </label>
                  </div>
                </td>
                  <th style="padding-right: 25px; padding-bottom: 15px;">특징</th>
                  <td>
                    <input type="text" class="joinInfoInput" name="petInfo" id="petInfo" >
                  </td>
                </tr>
                <tr>
                  
                </tr>
              </tbody>
            </table>
          </div>

          <!-- 판매자 회원 정보 입력-->
          <div id="joinSellerInfoBox" style="display: none;">
            <div class="addInfoTitle">*판매자 회원 추가 입력</div>
            <table class="joinInfoBox">
              <tbody>
                <tr>
                  <th>상호명</th>
                    <td>
                      <input type="hidden" name="bNameTest" value="0" />
                      <input type="text" class="joinInfoInput" name="bName" id="bName" >
                    </td>
                  <th>사업자 번호</th>
                    <td>
                      <input type="text" class="joinInfoInput" name="bNumber" id="bNumber" >
                    </td>
                </tr>
                <tr>
                  <th></th>
                  <td>
                    <span class="checkAlert" id="bName_termsCheck">10자 이내의 한글과 영문만 입력해 주세요.</span>
                  </td>
                  <th></th>
                  <td>
                    <input type="hidden" name="bNumTest" value="0" />
                    <span class="checkAlert" id="bNumber_termsCheck">-를 제외한 숫자만 입력해 주세요</span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- 가입 정보 입력 끝 -->
          <div class="btnBox">
            <button type="submit" class="btnJoin" >가입</button>
          </div>
        </form>
      </div>
    </section>

  <!-- 모달 사용하기 위한 script -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

	<!-- java script -->
	<script src="${ path }/js/member/jquery-3.6.0.js"></script>
	<script async src="${ path }/js/member/enroll.js?ver=1"></script>
	
  <!-- 다음 주소 검색 API -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function postCode() {
      new daum.Postcode({
        oncomplete: function (data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ""; // 주소 변수
          var extraAddr = ""; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === "R") {
            // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
          } else {
            // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if (data.userSelectedType === "R") {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
              extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== "" && data.apartment === "Y") {
              extraAddr += extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
            }
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById("zonecode").value = data.zonecode;
          document.getElementById("userAddress").value = addr;
          
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("addressSub").removeAttribute("disabled"); 
          document.getElementById("addressSub").focus();
        }
      }).open();
  }
  
// 아이디 중복 검사
  $("#userIdDuplicate").on("click", () => {
    $("[name=idDuplicateTest]").val("1");

    let userId = $("#userId").val().trim();

    // DB를 통해 중복검사
    $.ajax({
      type: "POST",
      url: "${path}/member/idCheck",
      data: {
        userId,
      },

      success: (result) => {
        console.log(result);
        
        if(result == 'success') {
          // 중복 아이디 X
          $("[name=idTest]").val("1");
          $("#id_termsCheck").text("사용 가능한 아이디 입니다.");
        } else {
          // 중복 아이디 O
          $("[name=idTest]").val("0");
          $("#userId").val("").focus();
          $("#id_termsCheck").text("이미 사용중인 아이디 입니다.");
        }
      } // success 종료

    }); // ajax 종료

    //아이디 중복검사 이후 id값 변경시 다시 중복검사 하게끔
    $("#userId").change(function () {
      $("[name=idDuplicateTest]").val("0");
    });

  }); 

  // 이메일 중복 검사
  $("#emailDuplicate").on("click", () => {
    $("[name=emailDuplicateTest]").val("1");

    let userEmail = $("#userEmail").val().trim();

    // DB를 통해 중복검사
    $.ajax({
      type: "POST",
      url: "${path}/member/emailCheck",
      data: {
        userEmail,
      },

      success: (result) => {
        console.log(result);
        
        if(result == 'success') {
          // 중복 아이디 X
          $("[name=emailDuplicateTest]").val("1");
          $("#email_termsCheck").text("사용 가능한 이메일 입니다.");
        } else {
          // 중복 아이디 O
          $("[name=emailDuplicateTest]").val("0");
          $("#userEmail").val("").focus();
          $("#email_termsCheck").text("이미 사용중인 이메일 입니다.");
        }
      } // success 종료

    }); // ajax 종료

    //아이디 중복검사 이후 id값 변경시 다시 중복검사 하게끔
    $("#userEmail").change(function () {
      $("[name=emailDuplicateTest]").val("0");
    });

  }); 
  </script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>