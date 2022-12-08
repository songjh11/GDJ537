console.log("role");

$(".roleDel").click(function(){
    let roleNum=$(this).prev().prev().text();
    Swal.fire({
        
      title:'직급을 삭제 하시겠습니까?',
      text:roleNum,
      icon:'warning',
  
      showCancelButton: true, // cancel버튼
      confirmButtonText: '확인', // confirm 버튼 텍스트 지정
      cancelButtonText: '취소', // cancel 버튼 텍스트 지정
    }).then(result=>{
      if(result.isConfirmed){
  
          $.ajax({
              type:"post",
              url:"/user/admin/roleDel",
              data:{
                  "roleNum":roleNum
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
  })

  $('.showRole').mouseenter(function(){
    $(this).css('color','blue');
    $(this).css('cursor','pointer');
  })

  $('.showRole').mouseleave(function(){
    $(this).css('color','#858796');
    $(this).css('cursor','default');
  })
  
  $('.showRole').click(function(){
    let roleNum = $(this).parent().children().first().text();
    let content = $(this).text();
    let select = $(this).data().role;
    
    (async () => {
        const { value: getName } = await Swal.fire({
            title: '수정할 내용을 입력하세요.',
            text: select,
            input: 'text',
            inputPlaceholder: content
        })
        if (getName) { // Swal.fire(`: ${getName}`)
            switch(select){
                case 'roleName': roleNameUpdate(roleNum,getName);
                break;
            }
        }
    })() 
})
function roleNameUpdate(roleNum,roleName){
$.ajax({
    type:"post",
    url:"/user/admin/roleNameUpdate",
    data:{
        roleNum:roleNum,
        roleName:roleName
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

$("#roleAdd").click(function(){
    console.log("click");
    (async () => {
        const { value: getName } = await Swal.fire({
            title: '추가할 직급을 입력하세요.',
            text: '',
            input: 'text',
            inputPlaceholder: '사원'
        })
     
        if (getName) {
            $.ajax({
                type:"post",
                url:"/user/admin/roleAdd",
                data:{
                    roleName:getName
                },
                success:function(){
                    Swal.fire('부서를 추가하였습니다.','','success');
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