
$("#idbtn").click(()=>{
    let param = { "entDate" : $("#regdate").val(), "id" : 13414, "name" : $("#getName").val() };
    commonAjax('/user/setID', param , "post",function(res){
        $("#getID").attr("value", res.id);
        $("#addContents").val(res.name+'의 사번은 ['+res.id+'] 입니다.');
    })

})



function commonAjax(url, parameter, type, calbak, contentType) {
    $.ajax({
        url: url,
        data: JSON.stringify(parameter),
        type: type,
        contentType: contentType != null ? contentType : 'application/json; charset=UTF-8',
        success: function (res) {
            calbak(res);
        },
        error: function (err) {
            console.log('error');
            calbak(err);
        }
    });
}


$(function() {
    $('#regdate').daterangepicker({
        "locale" :{
            "format": "YYYY-MM-DD",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
      singleDatePicker: true,
      showDropdowns: true,
      minYear: 1901,
      maxYear: parseInt(moment().format('YYYY'),10),
    }, function(start, end, label) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD'));
    });
  });


