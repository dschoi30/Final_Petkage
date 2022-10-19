// 약관 동의 모달
// 전체 동의
$(".checkbox_group").on("click", "#checkAll", function () {
  $(this)
    .parents(".checkbox_group")
    .find("input")
    .prop("checked", $(this).is(":checked"));
});

$(".checkbox_group").on("click", ".checkSep", function () {
  var is_checked = true;

  $(".checkbox_group .checkSep").each(function () {
    is_checked = is_checked && $(this).is(":checked");
  });

  $("#checkAll").prop("checked", is_checked);
});

$("#btnAgreeFinish").on("click", function () {
  if ($("#checkAll").is(":checked")) {
    $("#please_allCheck").html("");
    $("#agreeCheck").html("약관에 모두 동의하였습니다.");
    $("[name=agreeTest]").val("1");
  } else {
    $("#please_allCheck").html("모든 항목에 체크 해주세요.");
    $("#please_allCheck").css("color", "#753422");
    return false;
  }
});

// 일반 회원 - 판매자 회원 타입 설정
function memberTypeDisplay() {
  if ($("input:radio[id=memberSeller]").is(":checked")) {
    // 판매자 회원 타입
    $("#joinSellerInfoBox").show();
    $("#joinPetInfoBox").hide();
    $("#petYes").attr("disabled", true);
    $("#petNo").attr("disabled", true);
    console.log("js파일 - 판매자 회원");
  } else {
    // 일반 회원 타입
    $("#joinSellerInfoBox").hide();
    $("#petYes").attr("disabled", false);
    $("#petNo").attr("disabled", false);
    console.log("js파일- 일반 회원");
  }
}

// PET 정보 추가 설정
function petInfoDisplay() {
  if ($("input:radio[id=petYes]").is(":checked")) {
    $("#joinPetInfoBox").show();
    console.log("PET O");
  } else {
    $("#joinPetInfoBox").hide();
    console.log("PET X");
  }
}

// 정규식 표현

// 이름 - 한글 또는 영문만 5자 이내 입력 가능
var nameCheck = /^[가-힣|a-z|A-Z]{2,5}$/;

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

// 이름 유효성 검사
$("#userName").keyup(function () {
  if (!nameCheck.test($("#userName").val())) {
    $("#name_termsCheck").text("한글 또는 영문만 입력해 주세요.");
  } else if (
    $("#userName").val().length < 2 ||
    $("#userName").val().length > 6
  ) {
    $("#name_termsCheck").text("2자 이상 5자 이하로 입력해 주세요.");
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

$("#formJoin").submit(function () {
  // 약관 동의 체크
  if ($("[name=agreeTest]").val() != "1") {
    alert("약관에 동의해 주세요.");
    $("#btnAgree").focus();
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
