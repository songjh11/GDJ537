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

$(".titleLi").click(function() {
    $(this).next(".acoArea").stop().slideToggle(300);
    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".acoArea").siblings(".acoArea").slideUp(300); // 1개씩 펼치기
 });

 $("#chatBtn").click(function(){
    console.log("채팅함");
 })

 $("#msgBtn").click(function(){
    console.log("메세지함");
 })