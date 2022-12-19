const requestList = $(".requestList");
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
        requestList.empty();
        let order='';
        $(".order").each(function(idx,item){
            if($(item).prop('selected')){
                order = $(item).val();
            }
        })

        $.ajax({
            type: "GET",
            url: "/request/getListByRequestAjax?sort=요청&order="+order,

            success: function(result){
                $("#ajaxResult").html(result);
                
            },
            error: function(result){
                console.log(result);
            }
        });
})
