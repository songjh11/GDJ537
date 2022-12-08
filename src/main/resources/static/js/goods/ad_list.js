$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})


$("#add").click(function(){
    location.href="/goods/add";
})

$("#ro").click(function(event){
    let t = $(event.target).attr("data-item-num");
    location.href="/goods/update?id="+t;
})


$("#ca").click(function(event){
    let t = $(event.target).attr("data-item-num");
    location.href="/goods/update?id="+t;
})


