const b1 = document.querySelector("#b1");
const contents = document.querySelector("#contents");
const commentList = document.querySelector("#commentList");
const commentIdInput = $("#commentIdInput");
const up = document.querySelector("#up");
const update = document.querySelector("#update");


//page 번호 담는 변수
let page = 1;
// commentNum을 담을 변수
const boardNum = b1.getAttribute("data-boardNum");
getCommentList(page, boardNum);

b1.addEventListener("click", function () {

  let cv = contents.value;
  let commentWriter = commentIdInput.val();

  //-----ajax-----
  //1. XMLHTTPRequest 생성
  const xhttp = new XMLHttpRequest();

  //2. Method URL 준비
  xhttp.open("POST", "/comment/add"); //POST

  //3. Enctype
  //요청 header 정보
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  //4. 파라미터 전송 요청 발생 (메서드 post일 경우 파라미터 추가)
  xhttp.send("boardId=" + boardNum + "&contents=" + cv + "&creator=" + commentWriter);

  //5. 응답 처리
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      let result = xhttp.responseText.trim();
      result = JSON.parse(result);
      contents.value = "";

      if (result.result == 1) {
        alert("댓글등록성공");

        for (let i = 0; i < commentList.children.length;) {
          commentList.children[0].remove();
        }

        page = 1;

        getCommentList(page, boardNum);
      }
    }
  }

}); //click Event 끝

function getCommentList(p, bn) {
  //1. XMLHTTPRequest 생성
  const xhttp = new XMLHttpRequest();

  //2. Method URL 준비
  xhttp.open("GET", "/comment/list?page=" + p + "&boardId=" + bn); // GET

  //3. 요청 전송 enctype x
  xhttp.send();

  //4. 응답 처리
  xhttp.addEventListener("readystatechange", function () {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      console.log(xhttp.responseText);

      //1. jsp 사용한 결과물
      //commentList.innerHTML=xhttp.responseText.trim();

      //2. JSON 결과물
      let result = JSON.parse(xhttp.responseText.trim());
      let pager = result.pager; //commentPager
      let ar = result.list;     //댓글리스트

      for (let i = 0; i < ar.length; i++) {
        let tr = document.createElement("tr")

        let td = document.createElement("td")
        let tdText = document.createTextNode(ar[i].contents);
        td.appendChild(tdText);
        tr.appendChild(td);

        // //익명작성자
        // td = document.createElement("td");
        // tdText = document.createTextNode(ar[i].id);
        // td.appendChild(tdText);
        // tr.appendChild(td); 

        td = document.createElement("td");
        let dateTextes = ar[i].regDate.slice(0, 16);
        dateTextes = dateTextes.split("T");
        tdText = document.createTextNode(dateTextes[0] + " " + dateTextes[1]);
        td.appendChild(tdText);
        tr.appendChild(td);

        td = document.createElement("td");
        if(ar[i].updateDate == null){
          tdText = document.createTextNode(dateTextes[0] + " " + dateTextes[1]);
        } else {
          dateTextes = ar[i].updateDate.slice(0, 16).split("T");
          tdText = document.createTextNode(dateTextes[0] + " " + dateTextes[1]);
        }
        td.appendChild(tdText);
        tr.appendChild(td);

        // td = document.createElement("td");
        // tdText = document.createTextNode("수정");
        // let tdAttr = document.createAttribute("class")
        // tdAttr.value = "update";
        // td.setAttributeNode(tdAttr);
        // td.appendChild(tdText);
        // tr.appendChild(td);

        // tdAttr = document.createAttribute("data-commentnum");
        // tdAttr.value = ar[i].id;
        // td.setAttributeNode(tdAttr);
        // tr.appendChild(td);

        td = document.createElement("td");
        tdText = document.createTextNode("삭제");
        tdAttr = document.createAttribute("class")
        tdAttr.value = "delete";
        td.setAttributeNode(tdAttr);
        td.appendChild(tdText);

        tdAttr = document.createAttribute("data-commentnum");
        tdAttr.value = ar[i].id;
        td.setAttributeNode(tdAttr);
        tr.appendChild(td);

        commentList.append(tr);
      }
    }
  })

}

//----------댓글수정----------
commentList.addEventListener("click", function (event) {

  console.log(event.target.className);
  if (event.target.className == "update") {

    /*let contents = event.target.parentNode.parentNode.parentNode.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML;
    let num = event.target.getAttribute("data-boardNum");

    document.querySelector("#updateContents").value = contents;
    document.querySelector("#num").value = num;
    document.querySelector("#up").click();*/
    up.setAttribute("data-commentnum", event.target.getAttribute("data-commentnum"));
    up.click();

  }

  //----------댓글삭제----------
  if (event.target.className == "delete") {
    let deFlag = confirm("댓글을 삭제 하시겠습니까?");

    if(deFlag){
      let commentNum = event.target.getAttribute("data-commentnum");

      //1. XMLHTTPRequest
      const xhttp = new XMLHttpRequest();

      //2. 요청 정보
      xhttp.open("POST", "/comment/delete");

      //3. Header
      xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

      //4. 요청 (파라미터와 함께)
      xhttp.send("id=" + commentNum);

      //5. 응답처리
      xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
          let result = xhttp.responseText.trim();
          if (result == 1) {
            alert("삭제를 성공 했습니다.");
            page = 1;

            for (let i = 0; i < commentList.children.length;) {
              commentList.children[0].remove();
            }

            getCommentList(page, boardNum);
          } else {
            alert("삭제를 실패 했습니다.");
          }
        }
      }
    }
  }
})
//------------------------------Modal Update button------------------------------
update.addEventListener("click", function(){
  // modal 에서 num , contents 가져오기
  let commentNumber = up.getAttribute("data-commentnum");
  let contents = document.querySelector("#updateContents").value;
  // XMLHTTPRequest 
  const xhttp = new XMLHttpRequest();
  // 요청 정보
  xhttp.open("POST", "/comment/update"); //메서드 url
  // 요청 header 정보
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  // 요청 실행
  xhttp.send("id="+commentNumber+"&contents="+contents);
  console.log('contents =',contents)
  // 응답 처리
  xhttp.onreadystatechange=function() {
      if(xhttp.readyState==4 && this.status==200) {
          let result = xhttp.responseText.trim();
          
          if(result>0) {
              alert("댓글 수정을 완료되었습니다.");

              for(let i=0;i<commentList.children.length;) {
                  commentList.children[0].remove();
              }

              page=1;

              getCommentList(page, boardNum)

          }else {
              alert("댓글 수정을 실패했습니다.");
          }

      }
  }
})
