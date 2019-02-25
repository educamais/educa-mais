$(document).ready(function() {
	$("#alterarSenhaForm").validate({
		rules : {
			senhaAtual : {
				required : true,
				minlength : 8,
				maxlength : 16
			},
			senhaNova : {
				required : true,
				minlength : 8,
				maxlength : 16
			},
			redigiteSenha : {
				required : true,
				minlength : 8,
				maxlength : 16,
				equalTo : "#senhaNova"
			}
		}
	});
	
	$("#alterarNomeForm").validate({
		rules : {
			nome : {
				required : true
			}
		}
	});
});