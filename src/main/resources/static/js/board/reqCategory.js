var arrayForm= [];
let arrayCategoryName =[];
$("#deptCate").on("change",function(){
    arrayForm= [];
    arrayCategoryName =[];
    let cate1 = $(this).find("option:selected").val();
    teamText =$(this).find("option:selected").text();
    $('#formCate').children().remove();
    $('#formCate').append('<option value="none">선택</option>');
    
    // $('.badge-info').append(teamText);
    $.ajax({
        type:"POST",
        url: "./reqcate",
        traditional:true,
        data:{
            depNum : cate1
        },
        success : function(data){
            console.log(data);
            $.each(data,function(index,value){
                    arrayForm.push(data[index].categoryForm);
                    console.log(arrayForm);
                    arrayCategoryName.push(data[index].categoryName);

                    $('#formCate').append('<option value="'+index+'">'+data[index].categoryName+'</option>');
            });

        },
        error : result => {
            console.log(result);
        }
    })
});
console.log(arrayForm);
$("#formCate").on("change",function(){
    let form =  $(this).find("option:selected").val();
     //요청받은 부서의 서식명을 넣기
     $('#title').val('['+arrayCategoryName[form]+']');
    // console.log(form)
    $('#contents').summernote("destroy")
    $('#contents').html(arrayForm[form])
    $('#contents').summernote(
             {
                  placeholder: '내용을 입력해주세요',
                  tabsize: 2,
                  height: 200
              });
       
});


