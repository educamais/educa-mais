$(document).ready(function() {
	
	$.validator.addMethod("regx", function(value, element, regexpr) {          
	    return regexpr.test(value);
	}, "Remova os caracteres especiais");
	
	$.validator.addMethod("regxNome", function(value, element, regexpr) {          
	    return regexpr.test(value);
	}, "O nome só deve conter letras e espaços");
	
	$("#formularioLogin").validate({
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
	
	$("#formularioCadastro").validate({
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
	
	$("#formularioCriarTurma").validate({
        rules : {
        	nomeTurma : {
                required: true,
                maxlength : 45
            }
        }
    });
	
	$("#formularioParticiparTurma").validate({
        rules : {
        	codigo : {
                required: true,
                maxlength : 10
            }
        }
    });
	
	$("#formularioAlterarSenha").validate({
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
	
	$("#formularioAlterarNome").validate({
		rules : {
			nome : {
				required : true,
                regxNome : /^([a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+\s)*[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+$/,
                rangelength : [3,45]
			}
		}
	});
	
});