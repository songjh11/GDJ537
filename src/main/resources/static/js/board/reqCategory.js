$("#deptCate").on("change",function(){
    let cate1 = $(this).find("option:selected").val();

    $('#formCate').children().remove();
    $('#formCate').append('<option value="none">선택</option>');

    $.ajax({
        type:"POST",
        url: "./reqcate",
        traditional:true,
        data:{
            depnum : cate1
        },
        success : function(data){
            $.each(data,function(index,value){
                    $('#formCate').append('<option value="">'+data[index].categoryName+'</option>');
              
             
            });
        },
        error : result => {
            console.log(result);
        }
    })
});

