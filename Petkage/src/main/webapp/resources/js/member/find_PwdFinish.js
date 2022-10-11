// 정규식 표현
//  아이디 - 대소문자 + 숫자 + 10자 이상 12자 이하
var idCheck = /^[a-zA-z0-9]{6,12}$/;

// 이메일 - @ 입력
var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{3}$/;

// 비밀번호 - 영소문자, 숫자 모두 포함 8자리 이상
var pwdCheck = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;

// 아이디 유효성 검사
$("#findMyPwdInputName").keyup(function () {
  if (!idCheck.test($("#findMyPwdInputName").val())) {
    $("#id_termsCheck").text("6~12자의 영문 대소문자와 숫자를 입력해 주세요.");
    $("[name=findMyPwdInputName]").attr("disabled", true);
    $("[name=idTest]").val("0");
  } else {
    $("#id_termsCheck").text("");
    $("[name=findMyPwdInputName]").attr("disabled", false);
    $("[name=idTest]").val("1");
    $("#email_termsCheck").text("");
  }
});

// 이메일 유효성 검사
//이메일 인증하기 구현
$("#findMyPwdInputEmail").keyup(function () {
  if (!emailCheck.test($("#findMyPwdInputEmail").val())) {
    $("#email_termsCheck").text("올바른 이메일을 입력해 주세요.");
    $(".btnSendNum").attr("disabled", true);
  } else {
    $("#email_termsCheck").text("인증 번호를 보내주세요.");
    $(".btnSendNum").attr("disabled", false);
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

// 비밀번호 유효성 검사
$("#find_newPwd").keyup(function () {
  if (!pwdCheck.test($("#find_newPwd").val())) {
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
$("#find_newPwdCheck").keyup(function () {
  var userPwd = $("#find_newPwd").val();
  var userPwdCheck = $("#find_newPwdCheck").val();

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
