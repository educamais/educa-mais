$(document).ready(function() {
	
	$.validator.addMethod("regx", function(value, element, regexpr) {          
	    return regexpr.test(value);
	}, "Remova os caracteres especiais");
	
	$.validator.addMethod("regxNome", function(value, element, regexpr) {          
	    return regexpr.test(value);
	}, "O nome só deve conter letras e espaços");
	
	$("#formLogin").validate({
        rules : {
            email : {
                required: true,
                email: true
            },
            senha : {
                required: true,
                regx : /^(?=[a-zA-Z\d])\w{1,}$/,
                rangelength : [8,16]
            }
        }
    });
	
	$("#formCadastro").validate({
        rules : {
            nome : {
                required: true,
                regxNome : /^([a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+\s)*[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+$/,
                rangelength : [3, 45]
            },
            email : {
                required: true,
                email: true
            },
            senha : {
                required : true,
                regx : /^(?=[a-zA-Z\d])\w{1,}$/,
                rangelength : [8,16]
            },
            confirmarSenha : {
                required: true,
                regx : /^(?=[a-zA-Z\d])\w{1,}$/,
                rangelength : [8,16],
                equalTo: "#senhaCadastro"
            }
        }
    });
});