//사원번호조회
$("#search").click(function () {
    let id = $("#idCheck").val();
    let name = $("#nameCheck").val();
    $.ajax({
        type: "POST",
        url: "/user/idCheck",
        data: {
            id: id,
            name: name,
        },
        success: function (data) {
            $(".table").attr("style", "display:")
            $("#id").html(data.id)
            $("#name").html(data.name)
            $("#dep").html(data.departmentVO.depName)
            $("#role").html(data.roleVO.roleName)
            $("#date").html(data.entDate)

            //사원번호등록
            $("#add").click(function () {
                $('#idCheckModal').modal("hide");
                $("#addId").val(data.id)
                $("#addName").val(data.name)
                $("#addDep").val(data.departmentVO.depName)
            })
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
        $("#default").attr("style","display:none");
        $("#profile").html(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}

//프로필사진 취소했을때
$("#file").on("change", function () {
    let cancel = $(this)[0].files;
    if (cancel.length < 1) {
        $("#default").attr("style","display:");
        $("#profile").attr("style","display:none");
    }
});