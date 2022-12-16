console.log("drop.js");

$(".deptLi").click(function(){

    console.log("li태그 클릭");

    console.log('dd',$(this));

    $(this).attr("data-depnum");
    $("#dropId").val($(this).attr("data-depnum"));

    console.log($("#dropId").val($(this).attr("data-depnum")));

    const di = $(this).attr("data-depnum");

    console.log("di ==> " ,di);

    $("#dropId").val(di);
    let value = $(".deptLi").attr("data-depnum");
    console.log("value ==> " , value);

    console.log($(this).text());

    $("#depInput").val($(this).text());

    
    // $("#depInput").val($(".deptLi").prop("data-depnum").text());
});




$(".roleLi").click(function(){

    console.log("롤넘 li태그 클릭");

    console.log('rr',$(this));

    $(this).attr("data-rolenum");
    $("#roleId").val($(this).attr("data-rolenum"));

    console.log($("#roleId").val($(this).attr("data-rolenum")));

    let ri = $(this).attr("data-rolenum");

    console.log("ri ==> " , ri);

    $("#roleId").val(ri);


    $("#roleInput").val($(this).text());

});

// $("#listBtn").click(function(){


//     console.log("조회버튼 클릭");


// });

const listBtn = $("#listBtn");
const statusBtn = $("#statusBtn");
const tdId = $("#tdId");


// ajax에 나오는 부여버튼을 클릭할려면 그 바로 위 tbody에 있는 부모선택자 id로 선택을 해야 작동됨
$("#tbd").on("click", "#statusBtn", function(event){

    console.log("부여버튼 클릭 콘솔");

    // console.log("ididididid : ", event.target.siblings());

    // console.log("아이디:::" ,$("#tbd").find("#tdId").text());

    console.log("내 아이디  : ", $(this).attr("data-name"));
    console.log("내 depnum :  ", $(this).attr("data-depnum"));

    let name = $(this).attr("data-name");

    let depnum = $(this).attr("data-depnum");

    $.ajax({
        type: 'POST',
        url:  '/report/insa',
        data:{
            id : name,
            depnum : depnum
        },

        success:function(){
            alert("수정에 성공하였습니다.")
            console.log($(this).attr("data-name"));
            $(this).text("이미 부여됨");
        },
        error:function(){
            alert("수정에 실패하였습니다");
        }

    })

});