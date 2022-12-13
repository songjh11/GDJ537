console.log("wait");

$(".allow").click(function(){
  let id=$(this).prev().prev().prev().prev().prev().prev().text();
  Swal.fire({
    title:'회원가입을 승인하시겠습니까?',
    text:id,
    icon:'warning',

    showCancelButton: true, // cancel버튼
    confirmButtonText: '확인', // confirm 버튼 텍스트 지정
    cancelButtonText: '취소', // cancel 버튼 텍스트 지정
  }).then(result=>{
    if(result.isConfirmed){

        $.ajax({
            type:"post",
            url:"/user/admin/allow",
            data:{
                "id":id
            },
            success:function(success){
                Swal.fire('회원가입이 승인되었습니다.', '', 'success');
                setTimeout(function() {
                    location.reload();
                  }, 1000);
            },
            error:function(error){
                Swal.fire('회원가입에 실패하였습니다.', '', 'error');
            }
        })
    }else{
        Swal.fire('취소하였습니다.','','warning');
    }
  })
})

$(".allowNot").click(function(){
    let id=$(this).prev().prev().prev().prev().prev().prev().prev().text();
    Swal.fire({
      title:'회원가입을 거절하시겠습니까?',
      text:id,
      icon:'warning',
  
      showCancelButton: true, // cancel버튼
      confirmButtonText: '확인', // confirm 버튼 텍스트 지정
      cancelButtonText: '취소', // cancel 버튼 텍스트 지정
    }).then(result=>{
      if(result.isConfirmed){
  
          $.ajax({
              type:"post",
              url:"/user/admin/allowNot",
              data:{
                  "id":id
              },
              success:function(success){
                  Swal.fire('회원가입을 거절하였습니다.', '', 'success');
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