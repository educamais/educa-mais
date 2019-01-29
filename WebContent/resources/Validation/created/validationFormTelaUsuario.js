$(document).ready(function(){
	
	$("#formCriarSala").validate({
        rules : {
        	nomeTurma : {
                required: true
            }
        }
    });
	
	$("#formParticipar").validate({
        rules : {
        	codigo : {
                required: true
            }
        }
    });
});