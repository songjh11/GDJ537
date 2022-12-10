const modal = document.getElementById("modal")
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})


$(".btnArea").on("click", ".pickBtn", function(){
    console.log($(this).attr("value"));
    console.log($(this).children(".pickImg"));
    let myId = 10;
    let yourId = $(this).attr("value");
    let src = $(this).children(".pickImg").attr("src");
    console.log("1",src);
    if(src == "/img/star (3).png"){
        src = "/img/star (4).png"
        $(this).children(".pickImg").attr("src", src);
        $.ajax({
            type:"GET",
            url:"/messenger/pickCheck",
            data:{
                myId:myId,
                yourId:yourId
            },success:function(result){
                console.log(result);
            },error:function(error){
                console.log("error",error);
            }

        })
    } else{
        src = "/img/star (3).png"
        $(this).children(".pickImg").attr("src", src);
    }
})

$(".titleLi").click(function() {
    $(this).next(".acoArea").stop().slideToggle(300);
    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".acoArea").siblings(".acoArea").slideUp(300); // 1개씩 펼치기
 });

$(".empName").click(function(){
    console.log($(this).attr("value"));
    let id = $(this).attr("empId");
    let name = $(this).attr("value");
    let email = $('#email'+id).val();
    let phone = $('#phone'+id).val();
    let img = $('#yourImg'+id).attr("src");
    let dep = $('#depN'+id).attr("value");
    console.log(id, email, phone, img, dep);
    modal.style.display = "flex";
    $("#proImg").attr("src", img);
    $("#proName").text(name);
    $("#proDep").text(dep);
    $("#proEmail").text(email);
    $("#proPhone").text(phone);
})

 $("#chatBtn").click(function(){
    console.log("채팅함");
 })

 $("#msgBtn").click(function(){
    console.log("메세지함");
 })

 $("#roomBtn").click(function(){
    roomModal.style.display = "flex";
})