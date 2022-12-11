console.log("drop.js");

$(".deptLi").click(function(){

    console.log("li태그 클릭");

    console.log('dd',$(this));

    $(this).attr("data-depNum");
    $("#dropId").val($(this).attr("data-depNum"));

    console.log($("#dropId").val($(this).attr("data-depNum")));

    const di = $(this).attr("data-depNum");

    console.log("di ==> " ,di);

    $("#dropId").val(di);
    let value = $(".deptLi").attr("data-depNum");
    console.log("value ==> " , value);

    console.log($(this).text());

    $("#depInput").val($(this).text());

    
    // $("#depInput").val($(".deptLi").prop("data-depNum").text());
});




$(".roleLi").click(function(){

    console.log("롤넘 li태그 클릭");

    console.log('rr',$(this));

    $(this).attr("data-roleNum");
    $("#roleId").val($(this).attr("data-roleNum"));

    console.log($("#roleId").val($(this).attr("data-roleNum")));

    let ri = $(this).attr("data-roleNum");

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

    let name = $(this).attr("data-name");

    $.ajax({
        type: 'POST',
        url:  '/report/insa',
        data:{
            id : name
        },

    }).done(function(){
        
        alert("수정이 되었습니다.")

        })

});