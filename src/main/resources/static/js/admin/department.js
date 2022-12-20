console.log("department6");

$("#addDepartment").click(function(){
    console.log("click");
    (async () => {
        const { value: getName } = await Swal.fire({
            title: '추가할 직급을 입력하세요.',
            text: '',
            input: 'text',
            inputPlaceholder: '영업팀'
        })
     
        if (getName) {
            $.ajax({
                type:"post",
                url:"/user/admin/departmentInsert",
                data:{
                    depName:getName
                },
                success:function(){
                    Swal.fire('직급을 추가하였습니다.','','success');
                    setTimeout(function(){
                        location.reload();
                    },1000);
                },
                error:function(error){
                    Swal.fire('실패하였습니다.','','error');
                }
            })
        }
    })()
})

$('.showDepartment').click(function(){
    let depnum = $(this).parent().children().first().text();
    let content = $(this).text();
    let select = $(this).data().department;

    (async () => {
        const { value: getName } = await Swal.fire({
            title: '수정할 내용을 입력하세요.',
            text: content,
            input: 'text',
            inputPlaceholder: content
        })
        if (getName) { // Swal.fire(`: ${getName}`)
            switch(select){
                case 'depName': depNameUpdate(depnum,getName);
                break;
                case 'id': idUpdate(depnum,getName);
                break;
            }
        }
    })() 
})

function depNameUpdate(depnum,depName){
    $.ajax({
        type:"post",
        url:"/user/admin/depNameUpdate",
        data:{
            depnum:depnum,
            depName:depName
        },
        success:function(){
            Swal.fire('부서를 변경하였습니다.','','success');
            setTimeout(function(){
                location.reload();
            },1000);
        },
        error:function(error){
            Swal.fire('실패하였습니다.','','error');
        }
    })
};

function idUpdate(depnum,id){
    $.ajax({
        type:"post",
        url:"/user/admin/idUpdate",
        data:{
            depnum:depnum,
            id:id
        },
        success:function(){
            Swal.fire('부장을 변경하였습니다.','','success');
            setTimeout(function(){
                location.reload();
            },1000);
        },
        error:function(error){
            Swal.fire('실패하였습니다.','','error');
        }
    })
};
$('.showDepartment').mouseenter(function(){
    $(this).css('color','blue');
    $(this).css('cursor','pointer');
  })

  $('.showDepartment').mouseleave(function(){
    $(this).css('color','#858796');
    $(this).css('cursor','default');
  })

  $(".departmentDel").click(function(){
    let depnum=$(this).prev().prev().prev().text();
    let depName=$(this).prev().prev().text();

    $.ajax({
        type:"post",
        url:"/user/admin/depCheck",
        data:{
            "depnum":depnum
        },
        success:function(data){
            if(data==0){
                Swal.fire({
        
                    title:'부서를 정말 삭제 하시겠습니까?',
                    text:depName,
                    icon:'warning',
                
                    showCancelButton: true, // cancel버튼
                    confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                    cancelButtonText: '취소', // cancel 버튼 텍스트 지정
                  }).then(result=>{
                    if(result.isConfirmed){
                
                        $.ajax({
                            type:"post",
                            url:"/user/admin/departmentDel",
                            data:{
                                "depnum":depnum
                            },
                            success:function(success){
                                Swal.fire('부서를 삭제하였습니다.', '', 'success');
                                setTimeout(function() {
                                    location.reload();
                                  }, 1000);
                            },
                            error:function(error){
                                Swal.fire('실패하였습니다.', '', 'error');
                            }
                        })
                    }else{
                        Swal.fire('취소하였습니다.','','warning');
                    }
                  })
            }else{
                Swal.fire('삭제할수 없습니다.','해당 부서의 사원들을 다른부서로 변경해주세요','error');
            }
        }
        
    })




    
    
  })