$(document).ready(function(){
	
	$("#formLogin").validate({
        rules : {
            email : {
                required: true,
                email: true
            },
            senha : {
                required: true,
                minlength: 8,
                maxlength: 16
            }
        }
    });
	
	$("#formCadastro").validate({
        rules : {
            nome : {
                required: true,
                minlength: 3
            },
            email : {
                required: true,
                email: true
            },
            senha : {
                required : true,
                minlength: 8,
                maxlength: 16
            },
            confirmarSenha : {
                required: true,
                minlength: 8,
                maxlength: 16,
                equalTo: "#senhaCadastro"
            }
        }
    });
});