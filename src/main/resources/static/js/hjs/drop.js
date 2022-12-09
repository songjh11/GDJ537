console.log("drop.js");

$(".deptLi").click(function(){

    console.log("li태그 클릭");

    console.log('dd',$(this));

    $(this).attr("data-depNum");
    $("#dropId").val($(this).attr("data-depNum"));

    console.log($("#dropId").val($(this).attr("data-depNum")));

    let di = $(this).attr("data-depNum");

    console.log("di ==> " ,di);

    $("#dropId").val(di);


});