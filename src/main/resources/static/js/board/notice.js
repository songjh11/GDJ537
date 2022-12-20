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
            url: "/notice/getListByNoticeAjax?sort=공지&order="+order,

            success: function(result){
                $("#ajaxResult").html(result);
                
            },
            error: function(result){
                console.log(result);
            }
        });
})
