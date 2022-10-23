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

</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />
	<section class="mp-Modify">
        <div class="container">
        <form action="${ path }/member/update" method="post">
        <p class="mypagept" style="width: 1110px; height: 50px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">회원 정보 수정</p>
        
        <div class="modifyBox">
            <table>
            <tbody>
                <tr>
                <th>아이디</th>
                <td>
                    <input type="text" class="modifyInput" name="userId" id="userId" value="${ loginMember.userId }" disabled>
                    <input type="hidden" name="idTest" value="0" />
                </td>
                </tr>
                <th></th>
                <tr>
                  <th>비밀번호</th>
                  <td>
                    <input type="hidden" name="pwdTest" value="0" />
                    <input type="password" class="modifyInput" name="userPwd" id="userPwd" >
                  </td>
                  <th>비밀번호 확인</th>
                  <td>
                    <input type="hidden" name="pwdCheckTest" value="0" />
                    <input type="password" class="modifyInput" name="userPwdCheck" id="userPwdCheck" >
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
                    <input type="text" class="modifyInput" name="userName" id="userName" value="${ loginMember.userName }" required >
                  </td>
                  <th>핸드폰 번호</th>
                  <td>
                    <input type="hidden" name="phoneTest" value="0" />
                    <input type="text" class="modifyInput" name="userPhone" id="userPhone" value="${ loginMember.userPhone }">
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
                        <input type="text" class="modifyInput" name="zonecode" style="width: 100px; display: flex; text-justify: center;" id="zonecode" readonly="readonly" placeholder="우편번호" value="${ loginMember.zonecode }" required>

                        <input type="button" class="btnInfo" id="btnPostcode"  onclick="postCode()" value="주소검색" style="margin-top:16px"></input>
                      </div>
                    </td>
                </tr>
                <tr>
                  <th></th>
                    <td>
                      <input type="text" class="modifyInput" name="userAddress" id="userAddress" value="${ loginMember.userAddress }">
                    </td>
                    <th>나머지 주소</th>
                    <td>
                      <input type="hidden" name="addressTest" value="0" />
                      <input type="text" class="modifyInput" name="addressSub" id="addressSub" value="${ loginMember.addressSub }" disabled>
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
                      <input type="text" class="modifyInput" name="userEmail" id="userEmail" value="${ loginMember.userEmail }">
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
                      <input type="text" class="modifyInput" name="petName" id="petName" value="${ pet.petName }">
                    </td>
                  <th style="padding: 33px;">My Pet</th>
                    <td>
                      <div class="petTypeBox" >
                        <label class="modifyRadioType">
                          <input type="radio" name="petType" id="pDog" value="D">
                          <span>강아지</span>
                        </label>
                        <label class="modifyRadioType">
                          <input type="radio" name="petType" id="pCat" value="C">
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
                    <input type="text" class="modifyInput" name="pCheck" id="pCheck" value="${ pet.petName }">
                  </td>
                </tr>
                <tr>
                  
                </tr>
              </tbody>
            </table>
          </div>

          
          <div class="md_button">
              <button type="submit">수정 완료</button>
              <button type="button" id="btnDelete">회원 탈퇴</button>
            </div>
        </form>
        </div>
</section>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
    		<!-- java script -->
	<script src="${ path }/js/member/jquery-3.6.0.js"></script>
	<script async src="${ path }/js/mypage/userModify.js?ver=1"></script>
	
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
    
		$(document).ready(() => {
			$("#btnDelete").on("click", () => {
				if(confirm("정말로 탈퇴하시겠습니까?")) {
					location.replace("${ path }/member/delete");
				}			
			});
		});
		

	</script>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>