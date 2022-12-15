/**
 * Notice add js
 */
 console.log("boardUpdateJS")
 
 const urlParams = new URL(location.href).searchParams;
 if(urlParams.get("error")==1){
	 alert("글 작성 실패.  제목, 내용, 작성자를 모두 입력해야 합니다.");
 }
 
 
 let cntFiles = $("#fileDiv").attr("data-fileCnt");
 let cfile =  $(".custom-file-input");
 
 let chkContents=false
 let chkTitle = false
 let chkId =false
 
 //파일이 Change됐을때
$("#fileDiv").on("change", function(e) {
	//ajax로 기존 파일 삭제 요청
	 let filenum = ($(e.target).parent().parent().attr("data-fileNum"))
		$.get("/fileDelete/board/"+filenum, function(data){
	        if(data==1){
				alert("첨부파일이 수정되었습니다.")
			}
	    });
	 
  let fileName = $(e.target).val().split("\\").pop();
  $(e.target).siblings(".custom-file-label").addClass("selected").html(fileName);
});

//파일삭제 버튼을 클릭
 $("#fileDiv").on("click", function(e) {
	 if($(e.target).attr("id")=="DelFileInput"){
		 let filenum = $(e.target).parent().parent().attr("data-fileNum")
		 console.log(filenum)
		 //ajax로 파일 삭제 요청
		 $.get("/fileDelete/board/"+filenum, function(data){
	        if(data==1){
				alert("첨부파일이 삭제되었습니다.")
			}
	    });
		 
		 
		 $(e.target).parent().parent().remove()
		 cntFiles--
	 }
});

//file추가
$('#fileAdd').click(function(){
	if(cntFiles>2){
		console.log("클릭", cntFiles)
		alert("파일은 3개까지만 추가가 가능합니다.")
	}else{
		cntFiles++
		$("#fileDiv").append(
			'<div class="mb-1 row">'+
			'<label class="col-sm-2 col-form-label justify-contents-end" for=""><button type="button" class="btn btn-sm btn-danger" id="DelFileInput">파일삭제</button></label>'+
		  	'<div class="col-sm-10">'+
	  		'<input type="file" class="custom-file-input" name="multipartFiles" id="multipartFiles">'+
	  		'<label class="custom-file-label m-1" for="multipartFiles">파일을 추가하세요</label>'+
	  		'</div></div>'
		)
	}
})

//제출 버튼 클릭하면 내용이 있나 확인
$('#btnSubmit').click(function(){
	
	chkContents = !$('#contents').summernote('isEmpty')
	
	chkTitle = $('#title').val()!=""
	chkId = $('#id').val()!=""
	
	if(chkContents&chkTitle&chkId){
		console.log("onsubmit")
		$('#boardForm').submit();
	}else{
		if(chkId){
			let message = chkTitle?"":"제목 ";
			message += chkContents?"":"내용";
			
			alert(message+ "을 입력해주세요")
			
		}else{
			alert("다시 시도해주세요")
			location.href = "/";
		}
	
	}
	
})