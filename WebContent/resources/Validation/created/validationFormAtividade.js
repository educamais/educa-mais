$(document).ready(function(){
	
	$.validator.addMethod("regx", function(value, element, regexpr) {          
	    return regexpr.test(value);
	}, "A nota deve conter apenas números");
	
	$("#cadAtividade").validate({
        rules : {
        	nomeAtividade : {
        		required : true,
        		rangelength : [3,45]
        	}
        }
    });
});