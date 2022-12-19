let count = 0;
let goodId = $("#goodId").val();
let flag=true;
let imgCheck = true;
$("#fileAdd").click(function(){
    if(flag){
        let size = $("#fileAddResult").attr("data-file-size");
        console.log("sizeeee : "+size);
        if(size==undefined){
            size=0;
        }
        count=size;
        flag=false;    
    }
    
    if($(".files").length<5){
        let r = '<div class="file_form mt-2" style="width:450px;">';
        /* r = r+'<label for="contents" class="form-label">Files</label>'; label 여부 체크 */
        r = r + `<div>`
        r = r+'<input type="file" name="files" class="files form-control" id="files">';
        r = r+'<span class="text ff">선택된 파일 없음 <button type="button" class="del btn btn-danger" style="margin-left:340px;">X</button></span> ';
        // r = r+'<button type="button" class="del btn btn-danger" style="margin:auto;">X</button>'
        r = r+'<div id="see"></div>'
        r = r+'</div>';
        r = r+`</div>`
        $("#fileAddResult").append(r);
    }else {
        //swal("최대 3개만 가능","","warning")
    }
    for(let i=0; i<$(".files").length; i++){
        console.log("i확인 : "+i);
        $($(".files")[i]).on('change',function(){
            console.log("rr");
            var fileName = $($(".files")[i]).val();
            let result = fileName.split('\\'); // fileName c\\filepath\\fileName.jpg
            console.log(fileName);
            // const reader = new FileReader();
            // reader.onload = ({ target }) => {
            //     src = target.result;
            // };
            // if($(".files")[i]){
            //     reader.readAsDataURL($(".files")[i]);
            //   }
            // let r = `<img src=`+src+` width=300 height=300>`
            // $("#fileAddResult").append(r);
            // const imageSrc = URL.createObjectURL($($(".files").files[0]));
            // src = imageSrc;
            // let r = `<img src=`+src+` width=300 height=300>`
            // $("#fileAddResult").append(r);
            $($(".text")[i]).html(result[2]);
            
            // $.ajax({
            //     type:"POST",
            //     url :"./fileDelete",
            //     data:{
            //         "rowNum":i,
            //         "noticeNum":noticeNum
            //     },
            //     success:function(result){
            //         console.log("Result : ",result)
            //         console.log("After Result This", $(this));
                    
            //     },
            //     error:function(){
            //         console.log("Error 발생");
            //     }
    
            // });
            imgCheck = true;
        });
    
    }
    
    // console.log($(".files").length);     
});
for(let i=0; i<$(".files").length; i++){
    console.log("i확인 : "+i);
    $($(".files")[i]).on('change',function(){
        console.log("rr");
        var fileName = $($(".files")[i]).val();
        let result = fileName.split('\\'); // fileName c\\filepath\\fileName.jpg
        $($(".text")[i]).html(result[2]);
        console.log();
                    $.ajax({
                        type:"POST",
                        url :"./fileUpdateNumber",
                        data:{
                            "rowNum":i,
                            "goodsId":goodId
                        },
                        success:function(result){
                            console.log("Result : ",result)
                            console.log("After Result This", $(this));
                            // if(result == 1 ){
                            //     swal("첨부파일이 삭제되었습니다.").then(function(){
                            //         location.replace("./update?noticeNum="+noticeNum);
                            //     })
                            // }
                            let r = '<input type="hidden" name="fileUpdateNumber" id="fileUpdateNumber" value="'+result
                            r = r + '">';
                            $("#fileAddResult").append(r);
                        },
                        error:function(){
                            console.log("Error 발생");
                        }
            });
        });


    $($(".del")[i]).click(function(){
        console.log("click");
        console.log(i);

        $.ajax({
            type:"POST",
            url :"./fileDelete",
            data:{
                "rowNum":i,
                "goodsId":goodId
            },
            success:function(result){
                console.log("Result : ",result)
                console.log("After Result This", $(this));
                if(result == 1 ){
                    // swal("첨부파일이 삭제되었습니다.").then(function(){
                    //     location.replace("./update?goodsId="+goodId);
                    // })
                    alert("첨부파일이 삭제되었습니다.");
                    // location.replace("./update?goodsId="+goodId);

                }

            },
            error:function(){
                console.log("Error 발생");
            }
        });
    })
}
$("#fileAddResult").on("click", ".del", function(){
    // console.log($(this).parent().parent().parent());
     $(this).parent().parent().parent().remove();
    
});

flag=true;
/// 글 수정시 첨부파일 삭제
// $(".deleteFile").click(function(){
//     //DB, HDD에 파일 삭제
//     let check = confirm("삭제 됩니다.. 복구 불가");

//     if(flag){
//         let size = $("#fileAddResult").attr("data-file-size");


//         count=size;
//         flag=false;
//     }

//     if(check){
//         //post
//         // /qna/fileDelete
//         //파라미터 fileNum
//         let imgNum = $(this).attr("data-file-num");
//         console.log("Before Result This", $(this));
//         const btn = $(this);
//         $.ajax({
//             type:"POST",
//             url :"fileDelete",
//             data:{
//                 imgNum:imgNum
//             },
//             success:function(result){
//                 console.log("Result : ",result)
//                 console.log("After Result This", $(this));
//                 $(btn).parent().remove();
//                 count--;
//             },
//             error:function(){
//                 console.log("Error 발생");
//             }

//         });

//     }
// });


$("#delete").click(function(){
    var id = $("#delete").attr("data-id-num");
    $.ajax({
        type:"GET",
        url :"delete",
        data:{
            goodsId:id
        },

        success:function(result){
            console.log(result);
            console.log("삭제 완료 ");            
            location.href="/goods/ad_list";
        },
        error:function(){
            alert("예약된 건이 있어 삭제가 불가합니다.");
            console.log("Error 발생");
        }
    });
    
})
$('input[name=goodsId]').click(function(){
    if($('input[name=goodsId]:checked').val() == 'CA') {
        $('#carChecked').css("display","inline");
    }else{
        $('#carChecked').css("display", "none");
    }
})
let nameCheck = true;
let maxCheck = true;
let locationCheck = true;
let carNumCheck = true;
const name = document.getElementById("name");
const max = document.getElementById("max");
const loca = document.getElementById("location");
const carNum = document.getElementById("carNum");
const namediv = document.getElementById("namediv");
const maxdiv = document.getElementById("maxdiv");
const locationdiv = document.getElementById("locationdiv");
const carNumdiv = document.getElementById("carNumdiv");
const kinddiv = document.getElementById("kinddiv");
const imgdiv = document.getElementById("imgdiv");
const sub = document.getElementById("sub");
var pattern_num = /[1-9999999]/; //숫자
var pattern_eng = /[a-zA-Z]/;	// 문자 
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
name.addEventListener("blur",function(){
    if(name.value.length < 1) {
        $("#name").css("border-color","red");
        namediv.innerHTML ="시설 이름을 작성해주세요.";
        nameCheck = false;
    }else{
        $("#name").css("border-color","green");
        namediv.innerHTML ="";
        nameCheck = true;
    }
})
max.addEventListener("blur",function(){
    if((pattern_num.test(max.value)) && !(pattern_eng.test(max.value)) && !(pattern_spc.test(max.value)) && !(pattern_kor.test(max.value))) {
        $("#max").css("border-color","green");
        maxdiv.innerHTML="";
        maxCheck = true;
    } else{
        $("#max").css("border-color","red");
        maxdiv.innerHTML = "숫자만 작성해주세요.";
        max.value="";
        maxCheck = false;
    } 
})
loca.addEventListener("blur",function(){
    if(loca.value.length < 1) {
        $("#location").css("border-color","red");
        locationdiv.innerHTML ="시설 위치를 작성해주세요.";
        locationCheck = false;
    }else{
        $("#location").css("border-color","green");
        locationdiv.innerHTML ="";
        locationCheck = true;
    }
})
carNum.addEventListener("blur",function(){
    if($('input[name=goodsId]:checked').val() == 'CA') {
       
    if(carNum.value.length < 1) {
        $("#carNum").css("border-color","red");
        carNumdiv.innerHTML ="차량 위치를 작성해주세요.";
        carNumCheck = false;
    }else{
        $("#carNum").css("border-color","green");
        carNumdiv.innerHTML ="";
        carNumCheck = true;
    }
}
})
sub.addEventListener("click",function(){
    console.log(nameCheck);
    console.log(locationCheck);
    console.log(carNumCheck);
    console.log(imgCheck);

    console.log("valuessssd : "+$(".ff").html());
    if($(".ff").html() == undefined || $(".ff").html() == "") {
        imgCheck = false;
        imgdiv.innerHTML ="이미지는 필수입니다.";
    }else {
        imgdiv.innerHTML ="";
    }
    if(!(nameCheck && maxCheck && locationCheck && carNumCheck &&imgCheck)) {
        
        alert("모든 칸을 작성해주세요");
    }else{
       $("#addform").submit();
    }
})