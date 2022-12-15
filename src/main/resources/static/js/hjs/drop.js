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
    console.log($("#roleId").val(ri));


    $("#roleInput").val($(this).text());

});

// $("#listBtn").click(function(){


//     console.log("조회버튼 클릭");


// });

const listBtn = $("#listBtn");
const statusBtn = $("#statusBtn");


const ls = document.querySelector("#ls");

// ajax에 나오는 부여버튼을 클릭할려면 그 바로 위 tbody에 있는 부모선택자 id로 선택을 해야 작동됨
$("#tbd").on("click", ".b1", function(event){

    console.log("부여버튼 클릭 콘솔");

    // console.log("ididididid : ", event.target.siblings());

    // console.log("아이디:::" ,$("#tbd").find("#tdId").text());

    console.log("내 아이디  : ", $(this).attr("data-name"));
    console.log("내 depNum :  ", $(this).attr("data-depNum"));

    $(this).attr("disabled", false);
    
    let name = $(this).attr("data-name");
    
    let depNum = $(this).attr("data-depNum");
    
    
    $.ajax({
        type: 'POST',
        url:  '/report/insa',
        data:{
            id : name,
            depNum : depNum
        },
        
        success:function(result){
            alert("수정에 성공하였습니다.");
            console.log($("#statusBtn").text());
            // console.log($("#statusBtn").text('부여됨'));
            console.log("dd", ls);
            
        },
        error:function(){
            alert("수정에 실패하였습니다");
        }



    });

});

//ajax에 부여버튼을 클릭하면 user table에서 승인자 table로 insert 와 lstatus=2 로 update가 동시에 되는데 이 사람의 권한을 회수하고 싶다면 승인자 테이블에서 delete해주면 됌

$("#tbd").on('click', ".b2", function(event){


    console.log("권한회수 버튼 클릭");

    let name = $(this).attr("data-name");
    console.log("내가 클릭한 아이디 : ", name);

    $(this).attr("disabled", false);

    
    $.ajax({
        type: 'POST',
        url:  '/report/deleteLicenser',
        data:{
            id : name
        },

        success:function(){
            alert("ID가" + name + "인 직원의 권한을 회수 하였습니다.");
            console.log("콘소로오오오오올")
            
        },
        error:function(){
            alert("권한 회수에 실패하였습니다.");
        }

    })

});

let d1 = $("#statusBtn").click();
let d2 = $("#deleteBtn").click();

let a1 = $("#statusBtn").attr("data-btn");
let a2 = $("#deleteBtn").attr("data-btn");

// if(d1){     //부여 버튼이 눌렸다면 부여버튼을 disabled한다
//     $("#statusBtn").disabled(true);
// }
// if(d2){     //권한회수 버튼을 눌렀다면 권한회수 버튼을 disabled하고, 부여버튼을 다시 활성화 시킨다
//     $("#deleteBtn").disabled(true);
//     $("#statusBtn").disabled(false);
// }

$(".b1").click(function(){

    console.log("회색버튼 클래스 콘솔");

});

$(".b2").click(function(){

    console.log("빨간버튼 클래스 콘솔");
})

$(".tdId").on('each', '.btn', function(){


    console.log("하이");

});




