console.log("test.js");


const lsId = document.querySelector("#lsId");
const lsName = document.querySelector("#lsName");
const lsDepName = document.querySelector("#lsDepName");
const lsRoleName = document.querySelector("#lsRoleName");

let dh = $("#dbName").prop("data-hh");
console.log(dh);
console.log("attr:: " , $("#dbName").attr("data-hh"));

$("#dbName").ready(function(event){

    console.log("h6텍스트 바꾸자");
    console.log("디스 : " , $(this));
    console.log("111" , $("#dbName"));
    console.log("222 : " , $("#dbName").val());
    console.log("333: " , $("#dbName").text());
    console.log("222 : " , $(this).val());

    let dh = $(this).attr("data-hh");
    console.log("attr:: " , $(this).attr("data-hh"));

    // console.log("333: " , $(this).text());

    if($(this)){

    }

})

