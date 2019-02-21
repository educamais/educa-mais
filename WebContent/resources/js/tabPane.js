$(document).ready(function(){


$("#lista-menu li a").css("color","#243f11");
$("#lista-menu li a.active").css("color", "white");
$("#lista-menu li a.active").css("background-color","#243f11");

$(document).ready(function(){
    $("#lista-menu li a").click(function(){
        $("#lista-menu li a").css("color","#243f11");
        $("#lista-menu li a").css("background-color","white");
        
        $(this).css("color", "white");
        $(this).css("background-color","#243f11");
    });
});

});
