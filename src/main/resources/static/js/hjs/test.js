console.log("test.js");


const lsId = document.querySelector("#lsId");
const lsName = document.querySelector("#lsName");
const lsDepName = document.querySelector("#lsDepName");
const lsRoleName = document.querySelector("#lsRoleName");

let dh = $("#dpName").prop("data-hh");
console.log(dh);
console.log("attr:: " , $("#dpName").attr("data-hh"));

$("#dpName").ready(function(event){

    console.log("h6텍스트 바꾸자");
    // console.log("디스 : " , $(this));
    // console.log("222 : " , $("#dpName").val());
    // console.log("333: " , $("#dpName").text());
    // console.log("222 : " , $(this).val());

    let dh = $("#aaa").attr("data-hh");
    console.log("attr:: " , $(this).attr("data-hh"));
    console.log("dh --> ", dh);

    // console.log("333: " , $(this).text());

    if(dh==1){
        console.log("확인");
        $("#dpName").text('영업팀');
    }else if($(dh)==2){
        $("#dpName").text('총무팀');
    }else if($(dh)==3){
        $("#dpName").text('인사팀');
    }else if($(dh)==4){
        $("#dpName").text('IT개발팀');
    }else if(dh==5){
        $("#dpName").text('생산팀');
    }

})

