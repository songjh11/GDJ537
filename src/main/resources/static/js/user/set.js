//프로필 사진 삭제
$("#profile_delete").click(function () {
    let id = $("#sessionId").val();
    $.ajax({
      type: "POST",
      url: "profile_delete",
      data: {
        id: id,
      },
      success: function (data) {
        $("#profile_image").attr("src", "/file/profile/" + data);
        $("#profile_save").attr("onclick", "location.href='/member/mypage'");
        $("#profile_save").attr("type", "button");
      },
    });
  });
  
  //프로필 사진 업로드 없이 적용버튼 누를 경우, button타입으로 변경
  $("#profile_save").click(function () {
    if ($("#file").val() == "") {
      $("#profile_save").attr("type", "button");
    } else {
      $("#profile_save").attr("type", "submit");
    }
  });
  
  //폰 번호 변경
  $("#phoneUpdate_btn").click(function () {
    let phone = $("#phoneUpdate_input").val();
    if (phone == "") {
      $("#phoneUpdate_Check").attr("style", "color: red; font-size: 14px;");
      $("#phoneUpdate_b").text("빈칸을 입력해주세요.");
    } else if (!/^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/) {
      $("#phoneUpdate_Check").attr("style", "color: red; font-size: 14px;");
      $("#phoneUpdate_b").text("휴대폰 정보를 확인해주세요.");
    } else if (phone.length < 11 || phone.length > 11) {
      $("#phoneUpdate_Check").attr("style", "color: red; font-size: 14px;");
      $("#phoneUpdate_b").text("휴대폰 정보를 확인해주세요.");
    } else {
      $("#phoneUpdate_Check").attr("style", "display:none");
      $.ajax({
        type: "POST",
        url: "/member/changePhone",
        data: {
          phone: phone,
        },
        success: function (data) {
          if (data == 1) {
            location.href = "/member/setting";
          } else {
            alert("변경 실패");
          }
        },
      });
    }
  });
  
  //이메일변경
  $("#emailUpdate_btn").click(function () {
    let e = $("#email_e").val();
    let emailOption = $("#email_option").val();
    if (e == "" || emailOption == "선택") {
      $("#emailUpdate_Check").attr("style", "color: red; font-size: 14px;");
      $("#emailUpdate_b").text("빈칸을 입력해주세요.");
    } else if (!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])/.test(e)) {
      $("#emailUpdate_Check").attr("style", "color: red; font-size: 14px;");
      $("#emailUpdate_b").text("이메일 주소를 확인해주세요.");
    } else {
      $("#emailUpdate_Check").attr("style", "display:none");
      $.ajax({
        type: "POST",
        url: "/member/changeEmail",
        data: {
          e: e,
          mailOption: emailOption,
        },
        success: function (data) {
          if (data == 1) {
            location.href = "/member/setting";
          } else {
            alert("변경실패");
          }
        },
      });
    }
  });
  
  //내 설정 - 비밀번호 변경
  $(".btnPw_change").click(function () {
    let pw = $("#cur_pw").val();
    let newPw = $("#new_pw").val();
    let newPwCheck = $("#new_pwCheck").val();
    if (pw == "" || newPw == "" || newPwCheck == "") {
      $("#pwCheck_setText2").text("빈칸을 채워주세요.");
      $("#pwText_1").text("");
      $("#cur_pw").val("");
      $("#setPw_modal").click();
      return false;
    }
    $.ajax({
      type: "POST",
      url: "/member/pwCheck",
      data: {
        pw: pw,
      },
      success: function (data) {
        if (pw.length < 8 || pw.length > 20) {
          $("#pwText_1").text("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
          $("#pwText_1").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
        } else if (pw.search(/\s/) != -1) {
          $("#pwText_1").text("비밀번호는 공백 없이 입력해주세요.");
          $("#pwText_1").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
        } else if (data == 0) {
          $("#pwText_1").text("비밀번호가 일치하지 않습니다.");
          $("#new_pw").val("");
          $("#new_pwCheck").val("");
          $("#pwText_2").text("");
          $("#pwText_3").text("");
          $("#pwText_1").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
        } else {
          $("#pwText_1").attr("style", "display:none");
  
          if (pw == newPw) {
            $("#pwText_2").text("기존 비밀번호와 동일합니다.");
            $("#pwText_2").attr(
              "style",
              "font-size: 14px; color: red; padding: 2px 2px;"
            );
            $("#new_pw").val("");
            $("#new_pwCheck").val("");
            $("#pwText_3").text("");
          } else if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}$/.test(newPw)) {
            $("#pwText_2").text(
              "비밀번호는 영문과 특수문자 숫자를 포함하며 8자 이상이어야 합니다."
            );
            $("#pwText_2").attr(
              "style",
              "font-size: 14px; color: red; padding: 2px 2px;"
            );
            $("#new_pwCheck").val("");
            $("#pwText_3").text("");
          } else if (newPw.length < 8 || newPw.length > 20) {
            $("#pwText_2").text("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
            $("#pwText_2").attr(
              "style",
              "font-size: 14px; color: red; padding: 2px 2px;"
            );
            $("#new_pwCheck").val("");
            $("#pwText_3").text("");
          } else if (newPw.search(/\s/) != -1) {
            $("#pwText_2").text("비밀번호는 공백 없이 입력해주세요.");
            $("#pwText_2").attr(
              "style",
              "font-size: 14px; color: red; padding: 2px 2px;"
            );
            $("#new_pwCheck").val("");
            $("#pwText_3").text("");
          } else if (newPw != newPwCheck) {
            $("#pwText_2").attr("style", "display:none");
            $("#pwText_3").text("새 비밀번호가 일치하지 않습니다.");
            $("#pwText_3").attr(
              "style",
              "font-size: 14px; color: red; padding: 2px 2px;"
            );
          } else {
            $("#pwText_3").attr("style", "display:none");
            $.ajax({
              type: "POST",
              url: "/member/changePw",
              data: {
                pw: newPwCheck,
              },
              success: function (data) {
                if (data == 1) {
                  $("#pwCheck_icon").attr("style", "color:green");
                  $("#pwCheck_setText3").attr("style", "color:green");
                  $("#pwCheck_setText3").text("변경 성공");
                  $("#setPw_change").click();
                } else {
                  $("#pwCheck_setText3").text("변경 실패");
                  $("#setPw_change").click();
                }
              },
            });
          }
        }
      },
    });
  });