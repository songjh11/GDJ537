let count = 0;
let goodId = $("#goodId").val();
let flag=true;

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
        let r = '<div class="file_form mt-2">';
        /* r = r+'<label for="contents" class="form-label">Files</label>'; label 여부 체크 */
        r = r+'<input type="file" name="files" class="files form-control" id="files">';
        r = r+'<span class="text">선택된 파일 없음</span> ';
        r = r+'<button type="button" class="del btn btn-danger" style="margin:auto;display: block;">X</button>'
        r = r+'<div id="see"></div>'
        r = r+'</div>';
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
            //         "rownum":i,
            //         "noticenum":noticenum
            //     },
            //     success:function(result){
            //         console.log("Result : ",result)
            //         console.log("After Result This", $(this));
                    
            //     },
            //     error:function(){
            //         console.log("Error 발생");
            //     }
    
            // });
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
                        url :"./fileUpdatenumber",
                        data:{
                            "rownum":i,
                            "id":goodId
                        },
                        success:function(result){
                            console.log("Result : ",result)
                            console.log("After Result This", $(this));
                            // if(result == 1 ){
                            //     swal("첨부파일이 삭제되었습니다.").then(function(){
                            //         location.replace("./update?noticenum="+noticenum);
                            //     })
                            // }
                            let r = '<input type="hidden" name="fileUpdatenumber" id="fileUpdatenumber" value="'+result
                            r = r + '">';
                            $("#fileAddResult").append(r);
                        },
                        error:function(){
                            console.log("Error 발생");
                        }

            });
        });
        
    
    $($(".del")[i]).click(function(){
        $.ajax({
            type:"POST",
            url :"./fileDelete",
            data:{
                "rownum":i,
                "id":goodId
            },
            success:function(result){
                console.log("Result : ",result)
                console.log("After Result This", $(this));
                if(result == 1 ){
                    swal("첨부파일이 삭제되었습니다.").then(function(){
                        location.replace("./update?id="+goodId);
                    })
                }
                
            },
            error:function(){
                console.log("Error 발생");
            }

        });
    })

}

$("#fileAddResult").on("click", ".del", function(){
    $(this).parent().remove();
    
});

flag=true;
/// 글 수정시 첨부파일 삭제
$(".deleteFile").click(function(){
    //DB, HDD에 파일 삭제
    let check = confirm("삭제 됩니다.. 복구 불가");

    if(flag){
        let size = $("#fileAddResult").attr("data-file-size");
        
        
        count=size;
        flag=false;
    }

    if(check){
        //post
        // /qna/fileDelete
        //파라미터 filenum
        let imgnum = $(this).attr("data-file-num");
        console.log("Before Result This", $(this));
        const btn = $(this);
        $.ajax({
            type:"POST",
            url :"fileDelete",
            data:{
                imgnum:imgnum
            },
            success:function(result){
                console.log("Result : ",result)
                console.log("After Result This", $(this));
                $(btn).parent().remove();
                count--;
            },
            error:function(){
                console.log("Error 발생");
            }

        });

    }
});


$("#delete").click(function(){
    var id = $("#delete").attr("data-id-num");
    $.ajax({
        type:"GET",
        url :"delete",
        data:{
            id:id
        },
        success:function(result){
            console.log("삭제 완료 ");            
            location.href="/goods/ad_list";
        },
        error:function(){
            alert("[삭제실패] 예약된 건이 있습니다.");
            console.log("Error 발생");
        }

    });
    

})