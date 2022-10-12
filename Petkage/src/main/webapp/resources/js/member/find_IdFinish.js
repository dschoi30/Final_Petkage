// 정규식 표현
// 이름 - 한글 또는 영문만 5자 이내 입력 가능
var nameCheck = /^[가-힣|a-z|A-Z]{3,5}$/;

// 이메일 - @ 입력
var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{3}$/;

// 이름 유효성 검사
$("#findMyIdInputId").keyup(function () {
  if (!nameCheck.test($("#findMyIdInputId").val())) {
    $("#name_termsCheck").text("한글 또는 영문만 입력해 주세요.");
  } else if (
    $("#findMyIdInputId").val().length < 3 ||
    $("#findMyIdInputId").val().length > 5
  ) {
    $("#name_termsCheck").text("3자 이상 5자 이하로 입력해 주세요.");
  } else {
    $("#name_termsCheck").text("");
    $("[name=findMyIdInputName]").attr("disabled", false);
    $("[name=nameTest]").val("1");
    $("#email_termsCheck").text("");
    return true;
  }
});

// 이메일 유효성 검사
//이메일 인증하기 구현
$("#findMyIdInputEmail").keyup(function () {
  if (!emailCheck.test($("#findMyIdInputEmail").val())) {
    $("#email_termsCheck").text("올바른 이메일을 입력해 주세요.");
    $(".btnSendNum").attr("disabled", true);
  } else {
    $(".btnSendNum").attr("disabled", false);
    $("#email_termsCheck").text("인증 번호를 보내주세요.");
  }

  // 보낼 인증번호 담는곳
  // var confirmCode;
  // $.ajax({
  //   url: "${ path }/member/emailCheck",
  //   data: {
  //     email: eamilId,
  //   },
  //   method: "POST",
  //   dataType: "text",

  //   //성공했을시
  //   success: function (data) {
  //     if (data == "overlap") {
  //       $("#email_termsCheck").text("이미 가입된 이메일 입니다.");
  //       return;
  //     }

  //     confirmCode = data;

  //     //인증번호 박스, 버튼나타나기
  //     $("#emailCheck").attr("disabled", false);

  //     //인증번호 확인눌렀을 시 구현
  //     $(btnEmailConfirm).click(function () {
  //       var memberConfirmCode = $("#emailConfirm").val();

  //       if (confirmCode == memberConfirmCode) {
  //         $("[name=emailTest]").val("1"); //인증에 성공하면 value를 1로바꿈
  //         $("#email_numCheck").text("인증이 완료되었습니다.");
  //         $("#userEmail, #userEmailCheck").attr("readonly", true); //인증성공하면 이메일 + 인증번호창 readonly
  //       } else {
  //         alert("인증에 실패하셨습니다");
  //       }
  //     });
  //   },
  //   error: function (xhr, status, error) {
  //     console.log("error call!");
  //     console.log(xhr, status, error);
  //   },
  // });
});
