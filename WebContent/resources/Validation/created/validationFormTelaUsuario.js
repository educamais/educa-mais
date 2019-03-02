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
});