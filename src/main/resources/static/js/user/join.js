$("#addId, #addName, #addDep").click(function(){
    alert("사원번호를 먼저 조회해주세요")
    $("#idBtn").focus();
})


//사원번호조회
$("#search").click(function () {
    $("#addId").val("");
    $("#addName").val("");
    $("#addDep").val("");

    let id = $("#idCheck").val();
    let name = $("#nameCheck").val();
    if (id == "" || name == "") {
        $("#noDate").attr("style", "display:")
        $(".table").attr("style", "display:none")
        $("#noDate").html("빈칸을 모두 입력해주세요.")
        $("#add").attr("disabled", true);
    }
    $.ajax({
        type: "POST",
        url: "/user/idCheck",
        data: {
            id: id,
            name: name,
        },
        success: function (data) {
            alert(data)
            if (data == "") {
                $("#noDate").attr("style", "display:")
                $(".table").attr("style", "display:none")
                $("#noDate").html("일치하는 정보가 없습니다.")
                $("#add").attr("disabled", true);
            } else {
                $(".table").attr("style", "display:")
                $("#noDate").attr("style", "display:none")
                $("#id").html(data.id)
                $("#name").html(data.name)
                $("#dep").html(data.departmentVO.depName)
                $("#role").html(data.roleVO.roleName)
                $("#date").html(data.entDate)
                $("#add").attr("disabled", false);
                //사원번호등록
                $("#add").click(function () {
                    $('#idCheckModal').modal("hide");
                    $("#addId").val(data.id)
                    $("#addName").val(data.name)
                    $("#addDep").val(data.departmentVO.depName)
                })
            }

        }
    })
})



//이미지 썸네일
function setThumbnail(event) {
    let reader = new FileReader();
    reader.onload = function (event) {
        let img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("style", "width:140px; height:160px;");
        img.setAttribute("class", "border border-black rounded-3");
        $("#profile").html(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}



//프로필사진 등록중 취소버튼 눌렀을때
$("#file").on("change", function () {
    let cancel = $(this)[0].files;
    if (cancel.length < 1) {
        $("#profile").attr("style", "display:none");
        $("#default").attr("style", "display:");
        $("#file").attr("name", "")
    } else {
        $("#default").attr("style", "display:none");
        $("#profile").attr("style", "display:");
        $("#file").attr("name", "file")
    }
});



