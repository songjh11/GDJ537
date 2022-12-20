const deleteBtn = $("#deleteBtn");

let chkPasssword = false;

if($("#chkPw").length){
$("#chkPw").click(function(){
	
	$.ajax({
            type: "POST",
            url: "/unknown/chkboardpw",
            data: {
                id:$("#chkPw").attr("data-boardnum"),
                password:$("#password").val()
            },
            success: result => {
                if(result == 1){
                    alert("확인 완료")
					chkPasssword=true;
					$("#modifyA").attr("href", "/unknown/update?id="+$("#chkPw").attr("data-boardnum"))
					$("#modifyA").attr("class", "btn btn-danger")
					$("#deleteBtn").attr("class", "btn btn-danger")
                }else{
					alert("비밀번호가 다릅니다.")
				}
            },
            error: result => {
                console.log(result);
                
            }
        });
})


	
}

deleteBtn.on("click", function(){
	console.log("글삭제 버튼 클릭", chkPasssword);
	if(chkPasssword){
	
    let deleteFlag = confirm("정말 삭제합니까?");

    // 삭제할 게시글 번호
    let deletenum = deleteBtn.attr("data-boardnum");

    if(deleteFlag){
        
        // 첨부파일을 담고있는 틀의 자식들
        let detailFilesList = $(".card-body").children().children(".col-3").children();
        
        // 첨부파일을 담고있는 틀에 자식들이 있으면 = 파일이 첨부되어 있으면
        if(detailFilesList.length > 0){
            
            // 파일번호를 가지고 있는 자식 a 태그들을 찾음
            let fileAnchors = detailFilesList.children("a");
            $.each(fileAnchors, function(index, item){
                
                // a 태그의 href 속성에 파일 번호가 들어가 있으므로 잘라줌
                let hrefSaper = item.getAttribute("href").split("/");
                let fileDeletenum = hrefSaper[3]; // 삭제될 파일 번호

                $.get("/fileDelete/board/"+fileDeletenum, function(data){
                    
                }); // 파일 삭제

            });
        }

        // 현재 url을 잘라냄
        let pathUrl = location.pathname.split("/");
        // 현재 게시판 이름을 추출함 -> /notice/detail 이면 notice, /unknown/detail 이면 unknown이 추출됨
        let boardName = pathUrl[1];

        // 게시글을 삭제하는 Ajax 요청
        $.ajax({
            type: "POST",
            url: "/" + boardName + "/delete",
            data: {
                id: deletenum
            },
            success: result => {
                if(result == 1){
                    alert("게시글 삭제 성공");
                    location.href = "/" + boardName + "/list";
                }
            },
            error: result => {
                console.log(result);
            }
        });
		
	}

    }
});