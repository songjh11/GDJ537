
$('.startTime').each(function () {
    var a = $(this).val()

    a = a.replace('T', ' ');

    // console.log(a)

    $("#info").find('tr').find('td:eq(4)').text(a);

});
    

$('.endTime').each(function () {
    var a = $(this).val()

    a = a.replace('T', ' ');

    // console.log(a);

    $("#info").find('tr').find('td:eq(5)').text(a);
})