console.log("user");

$(".dismiss").click(function(){
    let id=$(this).prev().prev().prev().prev().prev().prev().prev().text();
    Swal.fire({
        
      title:'퇴사처리 하시겠습니까?',
      text:id,
      icon:'warning',
  
      showCancelButton: true, // cancel버튼
      confirmButtonText: '확인', // confirm 버튼 텍스트 지정
      cancelButtonText: '취소', // cancel 버튼 텍스트 지정
    }).then(result=>{
      if(result.isConfirmed){
  
          $.ajax({
              type:"post",
              url:"/user/admin/dismiss",
              data:{
                  "id":id
              },
              success:function(success){
                  Swal.fire('퇴사처리가 완료되었습니다.', '', 'success');
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
  })

  $('.showUser').mouseenter(function(){
    $(this).css('color','blue');
    $(this).css('cursor','pointer');
  })

  $('.showUser').mouseleave(function(){
    $(this).css('color','#858796');
    $(this).css('cursor','default');
  })
  $('.showUser1').mouseenter(function(){
    $(this).css('color','blue');
    $(this).css('cursor','pointer');
  })

  $('.showUser1').mouseleave(function(){
    $(this).css('color','#858796');
    $(this).css('cursor','default');
  })

  $('.showUser').click(function(){
    let id = $(this).parent().children().first().text(); //id
    let content = $(this).text();//
    let select = $(this).data().user; //변경할칼럼
    console.log("select:",select);
    (async () => {
        const { value: getName } = await Swal.fire({
            title: '수정할 내용을 입력하세요.',
            text: select,
            input: 'text',
            inputPlaceholder: content
        })
        if (getName) { // Swal.fire(`: ${getName}`)
            switch(select){
                case 'rolenum': rolenumUpdate(id,getName);
                break;
                case 'depnum': depnumUpdate(id,getName);
                break;
                case 'name':nameUpdate(id,getName);
                break;
                case 'email':emailUpdate(id,getName);
                break;
                case 'phone':phoneUpdate(id,getName);
                break;
                case 'entDate':entDateUpdate(id,getName);
                break;
            }
        }
    })()   
})
let updateId;
$('.showUser1').click(function(){
    updateId = $(this).parent().children().first().text();
    console.log(updateId);
})

$('.rolenumUpdate').click(function(){
    let rolenum = $(this).data().rolenum;
    rolenumUpdate(updateId,rolenum);
})

$('.depnumUpdate').click(function(){
    let depnum = $(this).data().depnum;
    depnumUpdate(updateId,depnum);
})


function rolenumUpdate(id,rolenum){
    $.ajax({
        type:"post",
        url:"/user/admin/rolenumUpdate",
        data:{
            id:id,
            rolenum:rolenum
        },
        success:function(){
            Swal.fire('직급을 변경하였습니다.','','success');
            setTimeout(function(){
                location.reload();
            },1000);
        },
        error:function(error){
            Swal.fire('실패하였습니다.','','error');
        }
    })
};

function depnumUpdate(id,depnum){
    $.ajax({
        type:"post",
        url:"/user/admin/depnumUpdate",
        data:{
            id:id,
            depnum:depnum
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

function nameUpdate(id,name){
    $.ajax({
        type:"post",
        url:"/user/admin/nameUpdate",
        data:{
            id:id,
            name:name
        },
        success:function(){
            Swal.fire('이름을 변경하였습니다.','','success');
            setTimeout(function(){
                location.reload();
            },1000);
        },
        error:function(error){
            Swal.fire('실패하였습니다.','','error');
        }
    })
};

function emailUpdate(id,email){
    $.ajax({
        type:"post",
        url:"/user/admin/emailUpdate",
        data:{
            id:id,
            email:email
        },
        success:function(){
            Swal.fire('이메일을 변경하였습니다.','','success');
            setTimeout(function(){
                location.reload();
            },1000);
        },
        error:function(error){
            Swal.fire('실패하였습니다.','','error');
        }
    })
};

function phoneUpdate(id,phone){
    $.ajax({
        type:"post",
        url:"/user/admin/phoneUpdate",
        data:{
            id:id,
            phone:phone
        },
        success:function(){
            Swal.fire('번호를 변경하였습니다.','','success');
            setTimeout(function(){
                location.reload();
            },1000);
        },
        error:function(error){
            Swal.fire('실패하였습니다.','','error');
        }
    })
};
function entDateUpdate(id,entDate){
    $.ajax({
        type:"post",
        url:"/user/admin/entDateUpdate",
        data:{
            id:id,
            entDate:entDate
        },
        success:function(){
            Swal.fire('번호를 변경하였습니다.','','success');
            setTimeout(function(){
                location.reload();
            },1000);
        },
        error:function(error){
            Swal.fire('실패하였습니다.','','error');
        }
    })
};