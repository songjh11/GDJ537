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
    console.log("디스 : " , $(this));
    console.log("222 : " , $("#dpName").val());
    console.log("333: " , $("#dpName").text());
    console.log("222 : " , $(this).val());

    let dh = $("#aaa").attr("data-hh");
    console.log("attr:: " , $(this).attr("data-hh"));
    console.log(dh);

    // console.log("333: " , $(this).text());

    if($(dh)){

    }

})

