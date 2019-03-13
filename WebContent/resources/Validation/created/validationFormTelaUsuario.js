$(document).ready(function(){
	
	$("#formCriarSala").validate({
        rules : {
        	nomeTurma : {
                required: true,
                maxlength : 45
            }
        }
    });
	
	$("#formParticipar").validate({
        rules : {
        	codigo : {
                required: true,
                maxlength : 10
            }
        }
    });
	
	$("#alterarNomeTurmaForm").validate({
		rules : {
			nomeTurma : {
				required : true,
                rangelength : [3,45]
			}
		}
	});
});