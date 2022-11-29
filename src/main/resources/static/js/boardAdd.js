/**
 * Notice add js
 */
 console.log("boardAddJS")
 
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
	console.log("클릭")
})