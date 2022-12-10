
// 게시글 구분을 위한 url 분리
let arr1 = location.pathname.split("/");
// 게시글 번호를 얻기 위한 url param 분리
let arr2 = location.search.split("=");

// 게시글 요청 Controller 구분자
let boardPathName = arr1[1];
// 게시글 번호
let boardParamNum = arr2[1];

$.ajax({
    type: "POST",
    url: "/" + boardPathName + "/hit",
    data: {
        num: boardParamNum
    },
    success: result => {
        
    },
    error: result => {
        console.log(error);
    }
});