const noticeList = $(".noticeList");
const listOrder = $("#listOrder");
changeSelect();
function changeSelect(){

    let v = listOrder.attr("title");
    if(v != null && v !=''){
        listOrder.val(v);

    }
    console.log("Order : "+v);
}

console.log(listOrder);

listOrder.change(function(){
        noticeList.empty();
        let order='';
        $(".order").each(function(idx,item){
            if($(item).prop('selected')){
                order = $(item).val();
            }
        })

        $.ajax({
            type: "GET",
            url: "/notice/getListByHit?sort=공지&order="+order,

            success: function(result){
                $("#ajaxResult").html(result);
                
                // $.each(result, function(index, item){
                //     console.log(item);
                //         noticeList.append("<div class='card-header bg-white'>"+
                //         "<div class='row justify-content-between'>"+
                //             "<p style='"+
                //                 "margin-bottom: 0;"+
                //                 "line-height: 400%;"+
                //                 "font-size: 20px;"+
                //                 "font-weight: bold;"+
                //                 "margin-left: 10px;"+
                //             "'>[공지]</p>"+
                //             "<div class='col-auto align-self-center'>"+
                //               "<p style='"+
                //                   "display: inline-block;"+
                //                 "margin-bottom: 0;"+
                //                 "color: #4E73DF;"+
                //                 "font-weight: 600;"+
                //               "'>"+item.notice.creator+" ·</p>"+
                //               "<p class='regdate' data-date='"+item.notice.regDate+"' style='display: inline-block;"+
                //                     "margin-bottom: 0;'></p>"+
                //               "<a href='/notice/hit?id="+item.notice.id+"'>"+
                //                   "<h5 class='mb-0 text-gray-800' data-anchor='data-anchor' id='file-input' style='font-size: 25px'>"+item.notice.title+"</h5>"+
                //               "</a>"+
                //             "</div>"+
                //             "<div class='col-fill ml-auto align-self-end mr-5'>"+
                //                 "<div class='d-flex justify-content-center'><svg xmlns='http://www.w3.org/2000/svg' fill='none' style='min-width: 25px;'"+
                //                     "viewBox='0 0 24 24' stroke-width='1.5' stroke='currentColor' aria-hidden='true' class='h-5 w-5'>"+
                //                     "<path stroke-linecap='round' stroke-linejoin='round'"+
                //                         "d='M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z'>"+
                //                     "</path>"+
                //                     "<path stroke-linecap='round' stroke-linejoin='round' d='M15 12a3 3 0 11-6 0 3 3 0 016 0z'></path>"+
                //                 "</svg><span>"+item.notice.hit+"</span><span style='margin-left: 5px;'>views</span>"+
                //                 "</div>"+
                //             "</div>"+
                //         "</div>"+
                //     "</div>");
                // })
            },
            error: function(result){
                console.log(result);
            }
        });
})
