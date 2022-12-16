console.log("test.js");


const lsId = document.querySelector("#lsId");
const lsName = document.querySelector("#lsName");
const lsDepName = document.querySelector("#lsDepName");
const lsRoleName = document.querySelector("#lsRoleName");

$("#dbName").ready(function(event){

    console.log("h6텍스트 바꾸자");
    console.log("디스 : " , $(this));
    console.log("111" , $("#dbName"));
    console.log("222 : " , $("#dbName").val());
    console.log("333: " , $("#dbName").text());
    console.log("222 : " , $(this).val());

    console.log("attr:: " , $(this).attr("data-hh"));
    // console.log("333: " , $(this).text());

    if($(this)){

    }

})

