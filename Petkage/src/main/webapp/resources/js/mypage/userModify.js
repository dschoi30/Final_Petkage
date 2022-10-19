
// 정규식 표현
//  아이디 - 대소문자 + 숫자 + 6자 이상 12자 이하
var idCheck = /^[a-zA-z0-9]{6,12}$/;

// 비밀번호 - 영대소문자, 숫자 모두 포함 8자리 이상
var pwdCheck = /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,}$/;

// 이름 - 한글 또는 영문만 5자 이내 입력 가능
var nameCheck = /^[가-힣|a-z|A-Z]{3,5}$/;

// 핸드폰 번호 - 숫자만 입력 가능
var phoneCheck = /^010[0-9]{8}$/;

// 이메일 - @ 입력
var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{3}$/;

// 숫자 - 숫자만 입력 가능
var numCheck = /^[0-9]+$/;

// 공백 체크
var blankCheck = /\s/g;

// 상호명 - 한글 또는 영문만 10자 입력 가능
var bNameCheck = /^[가-힣|a-z|A-Z]{1,10}$/;

// 아이디 유효성 검사
$("#userId").keyup(function () {
  if (!idCheck.test($("#userId").val())) {
    $("#id_termsCheck").text("6~12자의 영문자와 숫자를 입력해 주세요.");
    $("#userIdDuplicate").attr("disabled", true);
    $("[name=idTest]").val("0");
  } else {
    $("#id_termsCheck").text("중복 확인을 해주세요 ");
    $("#userIdDuplicate").attr("disabled", false);
    $("[name=idTest]").val("1");
  }
});

// 비밀번호 유효성 검사
$("#userPwd").keyup(function () {
  if (!pwdCheck.test($("#userPwd").val())) {
    $("#pwd_termsCheck").text(
      "영문자, 숫자 모두 포함해 8자리 이상 입력해 주세요."
    );
    $("[name=pwdTest]").val("0");
  } else {
    $("#pwd_termsCheck").text("");
    $("[name=pwdTest]").val("1");
    return true;
  }
});

// 비밀번호 일치 여부
$("#userPwdCheck").keyup(function () {
  var userPwd = $("#userPwd").val();
  var userPwdCheck = $("#userPwdCheck").val();

  // 비밀번호 입력 안했을 경우
  if (userPwd != "" && userPwdCheck == "") {
    $("#pwd_doubleCheck").text("비밀번호를 확인해 주세요");
  } else if (userPwd != "" || userPwdCheck != "") {
    if (userPwd == userPwdCheck) {
      // 비밀번호 일치 이벤트 실행
      $("#pwd_doubleCheck").text("비밀번호가 일치합니다.");
      // userPwdCheck == "1";
      $("[name=pwdCheckTest]").val("1");
    } else {
      // 비밀번호 불일치 이벤트 실행
      $("#pwd_doubleCheck").text("비밀번호가 일치하지 않습니다.");
      $("[name=pwdCheckTest]").val("0");
      return true;
    }
  }
});

// 이름 유효성 검사
$("#userName").keyup(function () {
  if (!nameCheck.test($("#userName").val())) {
    $("#name_termsCheck").text("한글 또는 영문만 입력해 주세요.");
  } else if (
    $("#userName").val().length < 3 ||
    $("#userName").val().length > 5
  ) {
    $("#name_termsCheck").text("3자 이상 5자 이하로 입력해 주세요.");
  } else {
    $("#name_termsCheck").text("");
    $("[name=nameTest]").val("1");
    return true;
  }
});

// 핸드폰 번호 유효성 검사
$("#userPhone").keyup(function () {
  if (!phoneCheck.test($("#userPhone").val())) {
    $("#phone_termsCheck").text("문자를 제외한 번호만 입력해 주세요.");
  } else {
    $("#phone_termsCheck").text("");
    $("[name=phoneTest]").val("1");
    return true;
  }
});

// 주소 유효성 검사
$("#addressSub").keyup(function () {
  var val = $("#addressSub").val();
  var trimVal = val.trim();
  if (trimVal != "") {
    $("#address_termsCheck").text("");
    $("[name=addressTest]").val("1");
    return true;
  } else {
    $("#address_termsCheck").text("나머지 주소를 입력해 주세요.");
    $("[name=addressTest]").val("0");
  }
});

// 이메일 유효성 검사
// 이메일 인증하기 구현
$("#userEmail").keyup(function () {
  if (!emailCheck.test($("#userEmail").val())) {
    $("#email_termsCheck").text("올바른 이메일을 입력해 주세요.");
    $("#emailDuplicate").attr("disabled", true);
  } else {
    $("#emailDuplicate").attr("disabled", false);
    $("#email_termsCheck").text("중복 확인을 해주세요.");
  }
});

// 상호명 유효성 검사
$("#bName").keyup(function () {
  if (!bNameCheck.test($("#bName").val())) {
    $("#bName_termsCheck").text("10자 이내의 한글과 영문만 입력해 주세요.");
    return false;
  } else {
    $("#bName_termsCheck").text("");
    $("[name=bNameTest]").val("1");
    return true;
  }
});

// 사업자 번호 유효성 검사
$("#bNumber").keyup(function () {
  if (!numCheck.test($("#bNumber").val())) {
    $("#bNumber_termsCheck").text("-를 제외한 숫자만 입력해 주세요");
  } else {
    $("#bNumber_termsCheck").text("");
    $("[name=bNumTest]").val("1");
    return true;
  }
});

////////////////////////////////////
//제출버튼 클릭시 모든 값 유무 확인
// click -> submit으로 바꾸기 (지금 테스트용)
$("#formJoin").submit(function () {
  // 약관 동의 체크
  if ($("[name=agreeTest]").val() != "1") {
    alert("약관에 동의해 주세요.");
    $("#btnAgree").focus();
    return false;
  }

  // 아이디 유효성 검사
  if ($("[name=idTest]").val() != "1") {
    $("#id_termsCheck").text("아이디를 입력해 주세요.");
    $("#userId").focus();
    return false;
  }

  // 아이디 중복검사
  if ($("[name=idDuplicateTest]").val() != "1") {
    $("#id_termsCheck").text("중복 확인을 해주세요.");
    $("#userId").focus();
    return false;
  }

  // 비밀번호를 입력하지 않았을 경우
  if ($("[name=pwdTest]").val() != "1") {
    $("#pwd_termsCheck").text("비밀번호를 입력해 주세요.");
    $("#userPwd").focus();
    return false;
  }

  // 비밀번호를 확인하지 않았을 경우
  if ($("[name=pwdCheckTest]").val() != "1") {
    $("#pwd_doubleCheck").text("비밀번호 확인을 해주세요.");
    $("#userPwdCheck").focus();
    return false;
  }

  // 이름 유효성 검사
  if ($("[name=nameTest]").val() != "1") {
    $("#name_termsCheck").text("올바른 이름을 입력해 주세요.");
    $("#userName").focus();
    return false;
  }

  // 핸드폰 유효성 검사
  if ($("[name=phoneTest]").val() != "1") {
    $("#phone_termsCheck").text("문자를 제외한 번호만 입력해 주세요.");
    $("#userName").focus();
    return false;
  }

  // 주소 유효성 검사
  if ($("[name=addressTest]").val() != "1") {
    $("#address_termsCheck").text("나머지 주소를 입력해 주세요.");
    $("#addressSub").focus();
    return false;
  }
  // 이메일 유효성 검사
  if ($("[name=emailDuplicateTest]").val() != "1") {
    $("#email_termsCheck").text("이메일 주소를 입력해 주세요.");
    $("#userEmail").focus();
    return false;
  }
  // 판매자 회원일 경우
  if ($("input:radio[id=memberSeller]").is(":checked")) {
    // 상호명 유효성 검사
    if ($("[name=bNameTest]").val() != "1") {
      $("#bName_termsCheck").text("상호명을 입력해 주세요.");
      $("#bName").focus();
      return false;
    }
    // 사업자 번호 유효성 검사
    if ($("[name=bNumTest]").val() != "1") {
      $("#bNumber_termsCheck").text("사업자 번호를 입력해 주세요.");
      $("#bNumber").focus();
      return false;
    }
  }
});

	// 강아지 선택시에만 몸무게 선택 클릭 가능
	$("#pDog").click(function () {
	  console.log("강쥐 클릭");
	  $("[name=petWeight]").attr("disabled", false);
	});

	$("#pCat").click(function () {
	  console.log("고영희 클릭");
	  $("[name=petWeight]").attr("disabled", true);
	});

