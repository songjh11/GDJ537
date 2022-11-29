/**
 * Notice add js
 */
 console.log("boardAddJS")
 
 let cntFiles = 0;
 
 //summernote 적용
 $('#contents').summernote({
          placeholder: 'Hello Bootstrap 4',
          tabsize: 2,
          height: 100
      });
 
 $(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});


//file추가
$('#fileAdd').click(function(){
	console.log("클릭", cntFiles)
	if(cntFiles>3){
		alert("파일은 3개까지만 추가가 가능합니다.")
	}else{
		$("#fileDiv").append(
			'<div class="mb-1 row">'+
			'<label class="col-sm-2 col-form-label justify-contents-end" for=""><button type="button" class="btn btn-sm btn-danger">파일삭제</button></label>'+
		  	'<div class="col-sm-10">'+
	  		'<input type="file" class="custom-file-input" name="multipartFiles" id="multipartFiles">'+
	  		'<label class="custom-file-label m-1" for="multipartFiles">파일을 추가하세요</label>'+
	  		'</div></div>'
		)
		cntFiles++
	}
})