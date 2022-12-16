

$("#license").click(function(){
    let result = $("#result").attr("data-status");
    let applyNum = $("#applyNum").attr("data-num");
    let a = window.confirm("승인하시겠습니까?");
    if(a){

        $.ajax({
            type:"post",
            url:"/report/updateapply",
            data:{
                "lstatus":result,
                "applyNum":applyNum
            },
            success:function(success){
                window.location.href="/report/doreport";
            },
            error:function(error){
                alert("승인 에러");
            }
        })
    } else{

    }
})

$("#returns").click(function(){
    let result = $("#result").attr("data-status")
    let applyNum = $("#applyNum").attr("data-num")
    let a = window.confirm("반려하시겠습니까?")
    if(a){

        $.ajax({
            type:"post",
            url:"/report/updatecancelapply",
            data:{
                "lstatus":result,
                "applyNum":applyNum
            },
            success:function(success){
                window.location.href="/report/returnreport";
            },
            error:function(error){
                alert("반려 에러");
            }
        })
    } else{

    }
})