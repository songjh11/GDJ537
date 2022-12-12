const modalChat = document.getElementById("modal")
const closeBtn = modalChat.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalChat.style.display = "none"
})


$(".btnArea").on("click", ".pickBtn", function(){
    console.log($(this).attr("value"));
    console.log($(this).children(".pickImg"));
    let myId = 10;
    let yourId = $(this).attr("value");
    let src = $(this).children(".pickImg").attr("src");
    if(src == "/img/star (3).png"){
        src = "/img/star (4).png"
        $(this).children(".pickImg").attr("src", src);
        let appendLi = $(this).parents(".chatLi").clone();
        // appendLi.classList.add('pickNum');
        $.ajax({
            type:"GET",
            url:"/messenger/pickCheck",
            data:{
                myId:myId,
                yourId:yourId
            },success:function(result){
                if(result>0){
                    console.log("추가됨", result);
                    $("#pickRemove").append(appendLi);

                } else{
                    console.log("실패", result);                
                }
            },error:function(error){
                console.log("error",error);
            }
        })
    } else{
        src = "/img/star (3).png"
        let pickBtnNum = $(this).attr("value");
        $(this).children(".pickImg").attr("src", src);
        $.ajax({
            type:"POST",
            url:"/messenger/pickCancel",
            data:{
                myId:myId,
                yourId:yourId
            },success:function(result){
                if(result>0){
                    console.log("취소됨", result); 
                    $(".pickBtn").each(function(index,item){
                        if($(item).attr("value") === pickBtnNum){
                            console.log("삭제됨",$(item).attr("value")); 
                            $(this).parents(".chatLi").remove();
                            return false;
                        }
                    })                       
                } else{
                    console.log("실패", result);
                }
            },error:function(error){
                console.log("error",error);
            }
        })
    }
})

$("#pickRemove").on("click",".pickBtn", function(){
    let pickBtnNum = $(this).attr("value");
    let pr = $(this).parents(".chatLi");
    let myId = 10;
    let yourId = $(this).attr("value");
    let src = "/img/star (3).png"
    $(this).parents(".chatLi").remove();
        $.ajax({
            type:"POST",
            url:"/messenger/pickCancel",
            data:{
                myId:myId,
                yourId:yourId
            },success:function(result){
                if(result>0){
                    console.log("취소됨", result);
                    pr.remove();
                    $(".pickBtn").each(function(index,item){
                        if($(item).attr("value") === pickBtnNum){
                            $(this).children(".pickImg").attr("src", src);
                        }
                    });
                } else{
                    console.log("실패", result);
                }
            },error:function(error){
                console.log("error",error);
            }
        })
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
    modalChat.style.display = "flex";
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
