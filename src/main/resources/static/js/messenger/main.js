console.log("main");

$(".btnArea").on("click", ".pickBtn", function(){
    console.log("픽픽");
    console.log($(this).attr("userNum"));
    console.log($(this).children(".pickImg"));
    let src = $(this).children(".pickImg").attr("src");
    console.log("1",src);
    if(src == "/img/star (3).png"){
        src = "/img/star (4).png"
        $(this).children(".pickImg").attr("src", src);
        console.log("2",src);
    } else{
        src = "/img/star (3).png"
        $(this).children(".pickImg").attr("src", src);
        console.log("3",src);
    }
})

// $(".showBtn").on("click", function(){

//     let style = $("#acoArea1").attr("style");
//     console.log(style);
//     $(this).text("🔽")
//     $("#acoArea1").attr("style", "display:block;")
//     if(style == "display:block;"){
//         $(this).text("🔼")
//         console.log("1번영역");
//         $("#acoArea1").attr("style", "display:none;")
//     }
// })

$(".showBtn").click(function() {
    console.log("dsjlfds");
    if( $(this).text()=="🔽"){
        $(this).text("🔼");
    } else{
        $(this).text("🔽");
    }
    console.log($(this));
    console.log($(this).parent());
    console.log($(this).parent().next(".acoArea"));
    $(this).parent().next(".acoArea").stop().slideToggle(300);
    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".acoArea").siblings(".acoArea").slideUp(300); // 1개씩 펼치기
 });