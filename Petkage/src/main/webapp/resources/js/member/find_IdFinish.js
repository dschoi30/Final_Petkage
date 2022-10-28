// 정규식 표현
// 이름 - 한글 또는 영문만 5자 이내 입력 가능
var nameCheck = /^[가-힣|a-z|A-Z]{3,5}$/;

// 이메일 - @ 입력
var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{3}$/;

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
    $("[name=userEmail]").attr("disabled", false);
    $("[name=nameTest]").val("1");
    $("#sendFinishAlert").text("");
    return true;
  }
});

// 이메일 유효성 검사
//이메일 인증하기 구현
$("#userEmail").keyup(function () {
  if (!emailCheck.test($("#userEmail").val())) {
    $("#sendFinishAlert").text("올바른 이메일을 입력해 주세요.");
    $(".btnSendNum").attr("disabled", true);
  } else {
    $(".btnSendNum").attr("disabled", false);
    $("#sendFinishAlert").text("인증 번호를 보내주세요.");
  }
});
