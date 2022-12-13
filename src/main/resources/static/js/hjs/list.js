console.log("list.js");


$("#tdiv").ready(function(){

    console.log("roleName 출력 준비");

    console.log("text () " , $("#tdRoleName").text());

    let arr = [  
                {roleName : $("#tdRoleName").text()}

                    ]

    $.each (arr, function(index, str){

        console.log("text () index " , $(index).text());
        console.log("text () index " , $(index).roleName);
        
        console.log("text() item" , $(str).roleName);
        console.log("text() item" , $(str).text());
        console.log("text () " , $("#tdRoleName").text());

    });

    for(var i=0; i<arr.length; i++) {
        console.log(i)
        console.log(arr[i]);
        console.log(arr[i].roleName);
    }


});