$(document).ready(function() {
	
	$.validator.addMethod("regx", function(value, element, regexpr) {          
	    return regexpr.test(value);
	}, "Remova os caracteres especiais");
	
	$.validator.addMethod("regxNome", function(value, element, regexpr) {          
	    return regexpr.test(value);
	}, "O nome só deve conter letras e espaços");
	
	$("#alterarSenhaForm").validate({
		rules : {
			senhaAtual : {
				required : true,
                regx : /^(?=[a-zA-Z\d])\w{1,}$/,
                rangelength : [8,16]
			},
			senhaNova : {
				required : true,
                regx : /^(?=[a-zA-Z\d])\w{1,}$/,
                rangelength : [8,16]
			},
			redigiteSenha : {
				required : true,
                regx : /^(?=[a-zA-Z\d])\w{1,}$/,
                rangelength : [8,16],
				equalTo : "#senhaNova"
			}
		}
	});
	
	$("#alterarNomeForm").validate({
		rules : {
			nome : {
				required : true,
                regxNome : /^([a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+\s)*[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+$/,
                rangelength : [3,45]
			}
		}
	});
});